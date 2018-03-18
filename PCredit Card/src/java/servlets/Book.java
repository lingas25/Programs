/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.MyStringRandomGen;
import driver.DriverManag;
import email.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sms.SendSmsViaSmtp;

/**
 *
 * @author sony
 */
public class Book extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = DriverManag.getConnection();
        String cardno = request.getParameter("cardno");
        String date = "1-" + request.getParameter("m") + "-" + request.getParameter("y");
        String cname = request.getParameter("cname");
        String cvvno = request.getParameter("cvvno");
        String total = request.getParameter("total");
        String state = request.getParameter("state");
        String mname = request.getParameter("mname");
        HttpSession session = request.getSession(true);
        session.setAttribute("Name on Card", cname);
        session.setAttribute("Card Number", cardno);
        session.setAttribute("Expiry", date);
        session.setAttribute("CVV No", cvvno);
        session.setAttribute("Total", total);
        session.setAttribute("State", state);
        session.setAttribute("Attempt", "0");
        String querry, mob, email;
        String card_pk, cust_pk;
        int i = 0, rnum, seq_no;
        double card_limit;
        try {
            Statement s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            DateFormat dateFormat = new SimpleDateFormat("dd-MMM-YY");
            DateFormat dateFormat1 = new SimpleDateFormat("MMM-YY");
            Calendar cal = Calendar.getInstance();
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.MONTH, -1);
            /* TODO output your page here. You may use following sample code. */
            querry = "select card_pk,cust_pk,card_limit from card_det where cust_card_no ='" + cardno + "' and expiry='" + date + "' and name_on_card ='" + cname + "' and cvv=" + cvvno + "and status='u'";
            ResultSet r = s.executeQuery(querry);
            while (r.next()) {
                i++;
            }
            if (i < 1) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/transfail.jsp");
                rd.forward(request, response);
                r.close();
            }
            System.out.println("Card Details are Valid");
            r.first();
            card_pk = r.getString(1);
            cust_pk = r.getString(2);
            card_limit = r.getDouble(3);
            r.close();
            String dat = dateFormat.format(cal.getTime());
            querry = "select sum(transaction_amount) from trans_det where card_pk='" + card_pk + "' and transaction_date between '2-" + dateFormat1.format(cal.getTime()) + "' and  '1-" + dateFormat1.format(cal1.getTime()) + "'";
            r = s.executeQuery(querry);
            double to;
            if (r.isFirst()) {
                to = Double.parseDouble(r.getString(1)) + Double.parseDouble(total);
            } else {
                to = Double.parseDouble(total);
            }
            if (to > card_limit) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/limit.jsp");
                rd.forward(request, response);
                r.close();
            }
            r.close();
            System.out.println("Card Limit Success");
            querry = "select cust_mobile,cust_email from cust_det where cust_pk='" + cust_pk + "'";
            r = s.executeQuery(querry);
            r.first();
            mob = r.getString(1);
            email = r.getString(2);
            r.close();
            PreparedStatement vs = con.prepareStatement("select max(rownum),max(seq_no) from trans_det where card_pk=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            vs.setString(1, card_pk);
            ResultSet vrs = vs.executeQuery();
            i = 0;
            if (vrs.next()) {
                vrs.first();
                rnum = Integer.parseInt(vrs.getString(1));
                seq_no = Integer.parseInt(vrs.getString(2));
                System.out.println("Rownum=" + rnum + " Sequence No=" + seq_no);
            } else {
                rnum = 0;
                seq_no = 0;
            }
            vrs.close();
            seq_no += 1;
            session.setAttribute("Sequence No", seq_no + "");
            querry = "select * from fraud where card_pk ='" + card_pk + "' and merchant_name='" + mname + "' and merchant_place ='london' and transaction_amount=" + total + "and item='" + state + "'";
            r = s.executeQuery(querry);
            if (r.next()) {
                System.out.println("Checking Fraud Table");
                querry = "insert into trans_det values('" + card_pk + "','" + dateFormat.format(cal.getTime()) + "','" + mname + "','london'," + total + ",'" + state + "','n'," + seq_no + ")";
                s.executeQuery(querry);
                querry = "commit";
                s.executeQuery(querry);
                System.out.println("Data Inserted as not Fraud");
                MyStringRandomGen msr = new MyStringRandomGen();
                String random = msr.generateRandomString();
                System.out.println(random);
                String body = "Transaction Password is " + random;
                //Sms Send
                SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
                smtpSend.msgsend(body, mob);
                session.setAttribute("Password", random);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/transpass.jsp");
                rd.forward(request, response);
            }
            if (rnum > 14) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM (select * from trans_det where card_pk=? ORDER BY seq_no desc) trans_det WHERE rownum <= ? ORDER BY rownum", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps.setString(1, card_pk);
                ps.setInt(2, 15);
                ResultSet rs = ps.executeQuery();
                PreparedStatement ps1 = con.prepareStatement("SELECT * FROM (select * from trans_det where card_pk=? ORDER BY seq_no desc) trans_det WHERE rownum <= ? ORDER BY rownum", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps1.setString(1, card_pk);
                ps1.setInt(2, 15);
                ResultSet rs1 = ps1.executeQuery();
                querry = "insert into trans_det values('" + card_pk + "','" + dateFormat.format(cal.getTime()) + "','" + mname + "','london'," + total + ",'" + state + "','n'," + seq_no + ")";
                s.executeQuery(querry);
                querry = "commit";
                s.executeQuery(querry);
                System.out.println("Data Inserted More than 15 Transaction");
                PreparedStatement ps2 = con.prepareStatement("SELECT * FROM (select * from trans_det where card_pk=? ORDER BY seq_no desc) trans_det WHERE rownum <= ? ORDER BY rownum", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps2.setString(1, card_pk);
                ps2.setInt(2, 15);
                ResultSet rs2 = ps2.executeQuery();
                PreparedStatement ps3 = con.prepareStatement("SELECT * FROM (select * from trans_det where card_pk=? ORDER BY seq_no desc) trans_det WHERE rownum <= ? ORDER BY rownum", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps3.setString(1, card_pk);
                ps3.setInt(2, 15);
                ResultSet rs3 = ps3.executeQuery();
                double alpha1, alpha2, alpha, delalpha;
                System.out.println("\nResult Set 1\n");
                while (rs.next()) {
                    System.out.println(rs.getString(1) + " " + rs.getDate(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getFloat(5) + " " + rs.getString(6) + " " + rs.getString(7));
                }

                System.out.println("\nResult Set 2\n");
                while (rs2.next()) {
                    System.out.println(rs2.getString(1) + " " + rs2.getDate(2) + " " + rs2.getString(3) + " " + rs2.getString(4) + " " + rs2.getFloat(5) + " " + rs2.getString(6) + " " + rs2.getString(7));
                }
                rs.first();
                rs2.first();
                System.out.println("\nAlpha 1 Calculation");
                alpha1 = calalpha(rs, rs1);
                System.out.println("\nValue of Alpha1=" + alpha1 + "\n");
                System.out.println("\nAlpha 2 Calculation");
                alpha2 = calalpha(rs2, rs3);
                System.out.println("\nValue of Alpha2=" + alpha2 + "\n");
                delalpha = alpha1 - alpha2;
                System.out.println("\nDelta Alpha Value = " + delalpha);
                alpha = delalpha / alpha1;
                System.out.println("\nAlpha Value = " + alpha);
                if (alpha < 0.7) {
                    MyStringRandomGen msr = new MyStringRandomGen();
                    String random = msr.generateRandomString();
                    System.out.println(random);
                    String body = "Transaction Password is " + random;
                    //Sms Send
                    SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
                    smtpSend.msgsend(body, mob);
                    session.setAttribute("Password", random);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/transpass.jsp");
                    rd.forward(request, response);
                } else {
                    querry = "update card_det set status='" + "b' where card_pk='" + card_pk + "'";
                    s.executeUpdate(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    querry = "delete from trans_det where seq_no=" + seq_no + "and card_pk='" + card_pk + "'";
                    s.executeUpdate(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    querry = "insert into fraud values('" + card_pk + "','" + dateFormat.format(cal.getTime()) + "','" + mname + "','london'," + total + ",'" + state + "','f')";
                    s.executeQuery(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    String msg = "Sir, Your Card is being blocked regarding the transaction amount " + total + " .To unblock Cick on the url and a code is been sent on your mobile ";
                    String url = "http://localhost:8080/PCredit_Card/mailunblock.jsp";
                    String body = "ADLV Bank Transaction Amount= " + total + ".Place=London, Code=" + cust_pk;
                    System.out.println("Card Blocked code"+cust_pk);
                    //Sms Send
                    SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
                    smtpSend.msgsend(body, mob);
                    //Email Send
                    SendEmail.Send("lingas25", "lingeSH$25", "lingas25@yahoo.com", email, "Card Blocked", msg + url);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/cardblock.jsp");
                    rd.forward(request, response);
                }
            } else {
                MyStringRandomGen msr = new MyStringRandomGen();
                String random = msr.generateRandomString();
                System.out.println(random);
                String body = "Transaction Password is " + random;
                querry = "insert into trans_det values('" + card_pk + "','" + dateFormat.format(cal.getTime()) + "','" + mname + "','london'," + total + ",'" + state + "','n'," + seq_no + ")";
                s.executeQuery(querry);
                querry = "commit";
                s.executeQuery(querry);
                System.out.println("Data Inserted Less than 15 Transaction");
                //Sms Send
                SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
                smtpSend.msgsend(body, mob);
                session.setAttribute("Password", random);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/transpass.jsp");
                rd.forward(request, response);
            }
        } catch (AddressException ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }

    public static double calalpha(ResultSet rs, ResultSet rs1) {
        try {
            int ecnt, gcnt, mcnt;
            Integer lw[] = new Integer[3];
            Integer md[] = new Integer[3];
            Integer hh[] = new Integer[3];
            Integer sgr[] = new Integer[3];
            Integer sel[] = new Integer[3];
            Integer smi[] = new Integer[3];
            float low, mid, high;
            double subst, state;
            Float a[][] = new Float[3][3];
            Float b[][] = new Float[3][3];
            ecnt = gcnt = mcnt = 0;
            subst = state = 1;
            for (int i = 0; i < 3; i++) {
                lw[i] = md[i] = hh[i] = 0;
                sgr[i] = sel[i] = smi[i] = 0;
            }
            rs.first();
            rs1.first();
            rs1.next();
            do {
                if (rs.getString(6).equalsIgnoreCase("el")) {
                    ecnt++;
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        sel[1]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        sel[0]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        sel[2]++;
                    }
                } else if (rs.getString(6).equalsIgnoreCase("mi")) {
                    mcnt++;
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        smi[1]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        smi[2]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        smi[0]++;
                    }
                } else if (rs.getString(6).equalsIgnoreCase("gr")) {
                    gcnt++;
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        sgr[1]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        sgr[0]++;
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        sgr[2]++;
                    }
                }
                rs.next();
            } while (rs1.next());
            rs.first();
            rs1.first();
            rs1.next();
            do {
                if (rs.getString(6).equalsIgnoreCase("el")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        lw[1]++;
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        md[1]++;
                    } else if (rs.getFloat(5) > 75) {
                        hh[1]++;
                    }
                } else if (rs.getString(6).equalsIgnoreCase("mi")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        lw[2]++;
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        md[2]++;
                    } else if (rs.getFloat(5) > 75) {
                        hh[2]++;
                    }
                } else if (rs.getString(6).equalsIgnoreCase("gr")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        lw[0]++;
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        md[0]++;
                    } else if (rs.getFloat(5) > 75) {
                        hh[0]++;
                    }
                }
            } while (rs.next());
            for (int i = 0; i < 3; i++) {
                a[0][i] = (float) sgr[i] / gcnt;
                a[1][i] = (float) sel[i] / ecnt;
                a[2][i] = (float) smi[i] / mcnt;
            }
            for (int i = 0; i < 3; i++) {
                low = (float) lw[i] / (lw[i] + md[i] + hh[i]);
                mid = (float) md[i] / (lw[i] + md[i] + hh[i]);
                high = (float) hh[i] / (lw[i] + md[i] + hh[i]);
                b[i][0] = low;
                b[i][1] = mid;
                b[i][2] = high;
            }
            System.out.println("\nMatrix A");
            for (int i = 0; i < 3; i++) {
                System.out.println();
                for (int j = 0; j < 3; j++) {
                    System.out.print(" " + a[i][j]);
                }
            }
            System.out.println("\n\nMatrix B");
            for (int i = 0; i < 3; i++) {
                System.out.println();
                for (int j = 0; j < 3; j++) {
                    System.out.print(" " + b[i][j]);
                }
            }
            System.out.println();
            rs.first();
            do {
                if (rs.getString(6).equalsIgnoreCase("el")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        subst *= (double) b[1][0];
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        subst *= (double) b[1][1];
                    } else if (rs.getFloat(5) > 75) {
                        subst *= (double) b[1][2];
                    }
                } else if (rs.getString(6).equalsIgnoreCase("mi")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        subst *= (double) b[2][0];
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        subst *= (double) b[2][1];
                    } else if (rs.getFloat(5) > 75) {
                        subst *= (double) b[2][2];
                    }
                } else if (rs.getString(6).equalsIgnoreCase("gr")) {
                    if (rs.getFloat(5) > 0 && rs.getFloat(5) < 31) {
                        subst *= (double) b[0][0];
                    } else if (rs.getFloat(5) > 30 && rs.getFloat(5) < 76) {
                        subst *= (double) b[0][1];
                    } else if (rs.getFloat(5) > 75) {
                        subst *= (double) b[0][2];
                    }
                }
            } while (rs.next());
            System.out.println("\nValue of Conditional Probability of Substate=" + subst + "\n");
            rs.first();
            rs1.first();
            rs1.next();
            do {
                if (rs.getString(6).equalsIgnoreCase("el")) {
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        state *= (double) a[1][1];
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        state *= (double) a[1][2];
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        state *= (double) a[1][0];
                    }
                } else if (rs.getString(6).equalsIgnoreCase("mi")) {
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        state *= (double) a[2][1];
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        state *= (double) a[2][2];
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        state *= (double) a[2][0];
                    }
                } else if (rs.getString(6).equalsIgnoreCase("gr")) {
                    if (rs1.getString(6).equalsIgnoreCase("el")) {
                        state *= (double) a[0][1];
                    } else if (rs1.getString(6).equalsIgnoreCase("mi")) {
                        state *= (double) a[0][2];
                    } else if (rs1.getString(6).equalsIgnoreCase("gr")) {
                        state *= (double) a[0][0];
                    }
                }
                System.out.println(rs.getString(1) + " " + rs.getDate(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getFloat(5) + " " + rs.getString(6) + " " + rs.getString(7));
                System.out.println(rs1.getString(1) + " " + rs1.getDate(2) + " " + rs1.getString(3) + " " + rs1.getString(4) + " " + rs1.getFloat(5) + " " + rs1.getString(6) + " " + rs1.getString(7));
            } while (rs.next() && rs1.next());

            System.out.println("\nValue of Conditional Probability of State=" + state);
            return subst * state;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
