/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import beans.Client;
import beans.Konekcija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class KreirajKorisnika extends HttpServlet {

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
        String name = request.getParameter("name");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int poeni = 0;

        try {
            Connection con = Konekcija.Konekcija();
            Statement st = con.createStatement();
            ResultSet rezultat = null;
            String upit = "SELECT email FROM client";
            rezultat = st.executeQuery(upit);

            while (rezultat.next()) {
                if (email.equals(rezultat.getString("email"))) {
                    request.setAttribute("msg", "Email vec postoji. Pokusajte sa novim email-om.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            }
            st.close();
            st.close();
        } catch (SQLException ex) {
            String poruka = ex.getMessage();
            request.setAttribute("msg", poruka);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

        if (name != null && name.length() > 0 && lastname != null && lastname.length() > 0
                && email != null && email.length() > 0 && password != null && password.length() > 0) {
            try {
                Connection con = Konekcija.Konekcija();

                String upit1 = "INSERT INTO client (firstname, lastname, email, password, numberOfPoints) VALUES (?,?,?,?,?)";
                
                PreparedStatement preparedStatement = con.prepareStatement(upit1);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, lastname);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, password);
                preparedStatement.setInt(5, poeni);
                preparedStatement.executeUpdate();
                
                request.setAttribute("msg", "Uspesno ste se registrovali. Prijavite se");
                request.getRequestDispatcher("klijent_login.jsp").forward(request, response);

            } catch (SQLException e) {
                String poruka = e.getMessage();
                request.setAttribute("msg", poruka);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
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
