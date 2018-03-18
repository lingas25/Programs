/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import driver.DriverManag;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class Unblock extends HttpServlet {

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
        String code = request.getParameter("code");
        String querry;
        int i = 0;
        try {
            Statement s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            /* TODO output your page here. You may use following sample code. */
            querry = "select card_pk,cust_pk from card_det where cust_card_no ='" + cardno + "' and expiry='" + date + "' and name_on_card ='" + cname + "' and cvv=" + cvvno + " and cust_pk='" + code + "'";
            ResultSet r = s.executeQuery(querry);
            while (r.next()) {
                i++;
            }
            if (i < 1) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/mailunblock.jsp");
                rd.forward(request, response);
            }
            querry = "update card_det set status='u' where cust_card_no ='" + cardno + "'";
            s.executeUpdate(querry);
            querry = "commit";
            s.executeQuery(querry);
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Card Unblock</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Card is being Unblocked</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(Unblock.class.getName()).log(Level.SEVERE, null, ex);
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
