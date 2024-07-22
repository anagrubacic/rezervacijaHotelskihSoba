/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import beans.Konekcija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class IzmenaHotelaManager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            String phone = request.getParameter("phone");
            String image = request.getParameter("image");
            int stars = Integer.parseInt(request.getParameter("stars"));
            int number = Integer.parseInt(request.getParameter("number"));
            int id = Integer.parseInt(request.getParameter("id"));
            Connection conn = Konekcija.Konekcija();
            try {
                String stmt = "UPDATE hotel SET name=?,address=?,city=?,country=?,phoneNumber=?,stars=?,numberOfRooms=?,image=? WHERE hotel_id=?";
                PreparedStatement pst = conn.prepareStatement(stmt);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, city);
                pst.setString(4, country);
                pst.setString(5, phone);
                pst.setInt(6, stars);
                pst.setInt(7, number);
                pst.setString(8, image);
                pst.setInt(9, id);
                pst.executeUpdate();
                
                response.sendRedirect("men_index.jsp");
            } catch (Exception ex) {
                request.setAttribute("msg", ex.getCause());
                String path = "izmeni_hotel_men.jsp?hotel_id=" + id;
                request.getRequestDispatcher(path).forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
