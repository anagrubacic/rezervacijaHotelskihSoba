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
public class DodajManagera extends HttpServlet {

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
            String name = request.getParameter("ime");
            String lastname = request.getParameter("prezime");
            String newemail = request.getParameter("new_email");
            String password = request.getParameter("password");
            String username = request.getParameter("username");
            Connection conn = Konekcija.Konekcija();

            if (!name.equals("") && !name.equals("") && !name.equals("") && !name.equals("") && !name.equals("")) {
                try {
                    int hotel = Integer.parseInt(request.getParameter("hotel"));
                    String stmt = "INSERT INTO manager(firstname,lastname,email,username,password,hotel) VALUES (?,?,?,?,?,?)";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setString(1, name);
                    pst.setString(2, lastname);
                    pst.setString(3, newemail);
                    pst.setString(4, username);
                    pst.setString(5, password);
                    pst.setInt(6, hotel);

                    pst.executeUpdate();
                    response.sendRedirect("prikaz_menadzera.jsp");
                } catch (Exception ex) {
                    request.setAttribute("msg", ex.toString());
                    String path = "add_men.jsp";
                    request.getRequestDispatcher(path).forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Sva polja su obavezna!");
                String path = "add_men.jsp";
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
