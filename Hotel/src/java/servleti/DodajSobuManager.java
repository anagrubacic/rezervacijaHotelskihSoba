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
public class DodajSobuManager extends HttpServlet {

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
            int type = Integer.parseInt(request.getParameter("tip"));
            int numberofbeds = Integer.parseInt(request.getParameter("numberofbeds"));
            String opis = request.getParameter("opis");
            double price = Double.parseDouble(request.getParameter("price"));
            int points = Integer.parseInt(request.getParameter("poeni"));
            int number = Integer.parseInt(request.getParameter("number"));
            String image = request.getParameter("image");
            
            int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
            Connection conn = Konekcija.Konekcija();
            
            try {
                String stmt = "INSERT INTO room (roomType,hotel,numberOfBeds,description,image,number,price,points) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement pst = conn.prepareStatement(stmt);
                pst.setInt(1, type);
                pst.setInt(2, hotel_id);
                pst.setInt(3, numberofbeds);
                pst.setString(4, opis);
                pst.setString(5, image);
                pst.setInt(6, number);
                pst.setDouble(7, price);
                pst.setInt(8, points);
                pst.executeUpdate();
                
                String putanja = "men_sobe.jsp?hotel_id=" + hotel_id;
                response.sendRedirect(putanja);
            } catch (Exception ex) {
                request.setAttribute("msg", ex.getCause());
                String path = "add_room_men.jsp?hotel_id=" + hotel_id;
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
