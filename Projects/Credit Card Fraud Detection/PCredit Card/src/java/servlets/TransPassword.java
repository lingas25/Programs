/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import driver.DriverManag;
import email.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class TransPassword extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        String cardno = (String) session.getAttribute("Card Number");
        String cname = (String) session.getAttribute("Name on Card");
        String date = (String) session.getAttribute("Expiry");
        String cvvno = (String) session.getAttribute("CVV No");
        String total = (String) session.getAttribute("Total");
        String pass = (String) session.getAttribute("Password");
        String state = request.getParameter("state");
        String mname = request.getParameter("mname");
        int attempt = Integer.parseInt((String) session.getAttribute("Attempt"));
        int seq_no = Integer.parseInt((String) session.getAttribute("Sequence No"));
        String transpass = request.getParameter("password");
        String querry, card_pk, cust_pk, mob, email;
        DateFormat dateFormat = new SimpleDateFormat("dd-MMM-YY");
        Calendar cal = Calendar.getInstance();
        try {
            Statement s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            /* TODO output your page here. You may use following sample code. */
            querry = "select card_pk,cust_pk from card_det where cust_card_no='" + cardno + "'";
            ResultSet r = s.executeQuery(querry);
            if (!pass.equals(transpass)) {
                attempt += 1;
                if (attempt == 3) {
                    querry = "select card_pk,cust_pk from card_det where cust_card_no='"+ cardno + "'";
                    r = s.executeQuery(querry);
                    r.first();
                    card_pk = r.getString(1);
                    cust_pk = r.getString(2);
                    r.close();
                    querry = "select cust_mobile,cust_email from cust_det where cust_pk='" + cust_pk + "'";
                    r = s.executeQuery(querry);
                    r.first();
                    mob = r.getString(1);
                    email = r.getString(2);
                    r.close();
                    querry = "update card_det set status='" + "b' where card_pk='" + card_pk + "'";
                    s.executeUpdate(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    querry = "delete from trans_det where seq_no=" + seq_no  + "and card_pk='"+card_pk+"'";
                    s.executeUpdate(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    querry = "insert into fraud values('" + card_pk + "','" + dateFormat.format(cal.getTime()) + "','" + mname + "','london'," + total + ",'" + state + "','f')";
                    s.executeQuery(querry);
                    querry = "commit";
                    s.executeQuery(querry);
                    String msg = "Sir, Your Card is being blocked regarding the transaction amount=" + total + " To unblock Cick on the url and a code is been sent to ur mobile ";
                    String url = "http://localhost:8080/PCredit_Card/mailunblock.jsp";
                    String body = "ADLV Bank Transaction Amount=" + total + ".Place=London, Code=" + cust_pk;
                    try {
                        //Sms Send
                        SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
                        smtpSend.msgsend(body, mob);
                        //Send Email
                        SendEmail.Send("lingas25", "lingeSH$25", "lingas25@yahoo.com", email, "Card Blocked", msg + url);
                    } catch (AddressException ex) {
                        Logger.getLogger(TransPassword.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (MessagingException ex) {
                        Logger.getLogger(TransPassword.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/cardblock.jsp");
                    rd.forward(request, response);
                }
                session.removeAttribute("Attempt");
                session.setAttribute("Attempt", attempt + "");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/transpass.jsp");
                rd.forward(request, response);
            }
            querry = "select card_pk,cust_pk from card_det where cust_card_no='" + cardno + "'";
            r = s.executeQuery(querry);
            r.first();
            cust_pk = r.getString(2);
            r.close();
            querry = "select cust_mobile,cust_email from cust_det where cust_pk='" + cust_pk + "'";
            r = s.executeQuery(querry);
            r.first();
            mob = r.getString(1);
            r.close();
            String body = "ADLV Bank Transaction Amount=" + total + " Place=London  Thanks for Shopping";
            //Sms Send
            SendSmsViaSmtp smtpSend = new SendSmsViaSmtp();
            smtpSend.msgsend(body, mob);
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Transaction Succesfull</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center><h1>Transaction</h1><hr><br>");
            out.println("<h3>Tranaction taken place Successfully</h3>");
            out.println("<h3>Transaction Amount " + total + "</h3>");
            out.println("<h3>Thanks for shoppping</h3>");
            out.println("</center></body>");
            out.println("</html>");
        } catch (AddressException ex) {
            Logger.getLogger(TransPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(TransPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TransPassword.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
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
