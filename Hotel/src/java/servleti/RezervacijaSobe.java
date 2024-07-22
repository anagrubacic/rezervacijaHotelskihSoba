/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import beans.Booking;
import beans.Konekcija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class RezervacijaSobe extends HttpServlet {

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
            
            Connection conn = Konekcija.Konekcija();
            HttpSession sesija = request.getSession();
            String datumOd = request.getParameter("datumOd");
            String datumDo = request.getParameter("datumDo");
            ArrayList<Booking> rezervacije = new ArrayList<>();

            if (!datumOd.equals("") && !datumDo.equals("")) {
                try {
                    int num = Integer.parseInt(request.getParameter("brojosoba"));
                    int room_id = Integer.parseInt(request.getParameter("room"));
                    int hotel = Integer.parseInt(request.getParameter("hotel"));
                    int client = Integer.parseInt(request.getParameter("client"));
                    int points = Integer.parseInt(request.getParameter("points"));
                    int numberOfPoints = (Integer) sesija.getAttribute("client_points");
                    double cena = Double.parseDouble(request.getParameter("price"));

                    String stmt = "SELECT * FROM booking WHERE room =?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setInt(1, room_id);
                    ResultSet rs = pst.executeQuery();
                    
                    String msg = "";
                    String path = "";

                    if (numberOfPoints < 10) {
                        cena = cena * 1;
                    } else if (numberOfPoints >= 10 && numberOfPoints <= 20) {
                        cena = cena * 0.3;
                    } else if (numberOfPoints > 20) {
                        cena = cena * 0.5;
                    }
                    stmt = "INSERT INTO booking(numberOfPersons,dateFrom,dateTo,room,hotel,points,client,price) VALUES (?,?,?,?,?,?,?,?)";
                    pst = conn.prepareStatement(stmt);

                    pst.setInt(1, num);
                    pst.setString(2, datumOd);
                    pst.setString(3, datumDo);
                    pst.setInt(4, room_id);
                    pst.setInt(5, hotel);
                    pst.setInt(6, points);
                    pst.setInt(7, client);
                    pst.setDouble(8, cena);
                    pst.executeUpdate();
                    
                    path = "my_profile.jsp";
                    response.sendRedirect(path);
                } catch (Exception Ex) {
                    String msg = "Neuspesna rezervacija";
                    request.setAttribute("msg", msg);
                    response.sendRedirect("client_index.jsp");
                }
            } else {
                String msg = "Morate popuniti sva polja";
                request.setAttribute("msg", msg);
                response.sendRedirect("client_index.jsp");
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
