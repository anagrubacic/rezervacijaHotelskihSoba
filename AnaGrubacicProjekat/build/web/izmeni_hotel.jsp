<%@page import="beans.Hotel"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : izmeni_hotel
    Created on : Oct 3, 2023, 11:57:22 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();
    Hotel hotel = new Hotel();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Početna strana | ADMIN</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="../css/stil.css" rel="stylesheet">
    </head>

    <header>
        <div class="page-header">
            <a href="admin_index.jsp"><img src="img/hoteel.jpg"></a>
            </h1> BOOKING | Admin</h1>
        </div>
    </header>

    <div class="container-fluid vh-100">
        <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Dobrodosli - <%= sesija.getAttribute("admin_email")%></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="prikaz_hotela.jsp">Hoteli</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="prikaz_menadzera.jsp">Menadzeri</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="prikaz_klijenata.jsp">Klijenti</a>
                        </li>
                    </ul>
                </div>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="bi bi-arrow-down-right-circle"></i> Sign out
                        </a>
                    </li>
                </ul>
            </div>
        </nav><br>
        <h1>Hotel</h1>
        <%
            int id = Integer.parseInt(request.getParameter("hotel_id"));
            try {
                Connection conn = Konekcija.Konekcija();
                String stmt = "Select * from hotel where hotel_id=?";
                PreparedStatement pst = conn.prepareStatement(stmt);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    hotel = new Hotel(rs.getInt("hotel_id"), rs.getNString("name"), rs.getNString("address"), rs.getNString("city"), rs.getNString("country"), rs.getNString("phoneNumber"), rs.getInt("stars"), rs.getInt("numberOfRooms"), rs.getNString("image"));
                }
            } catch (Exception e) {
            }
        %>
        <div class="row" style="margin-bottom: 30px;">
            <div class="col-9">
                <a href="DeleteHotel?hotel_id=<%= id%>"><i class="bi bi-trash"></i> IZBRISI HOTEL</a>
                <form method="post" action="IzmenaHotela" name="forma">
                    <label class="form-label">Ime:</label>
                    <input class="form-control" name="name" type="text" id="name" value="<%= hotel.getName()%>" /><br>
                    <label class="form-label">Adresa:</label>
                    <input class="form-control" name="address" type="text" id="address" value="<%= hotel.getAddress()%>" /><br>
                    <label class="form-label">Grad:</label>
                    <input class="form-control" name="city" type="text" id="city" value="<%= hotel.getCity()%>" /><br>
                    <label class="form-label" >Drzava:</label>
                    <input class="form-control" name="country" type="text" id="country" value="<%= hotel.getCountry()%>" /><br>
                    <label class="form-label" >Broj Telefona:</label>
                    <input class="form-control" name="phone" type="text" id="phone" value="<%= hotel.getPhoneNumber()%>" /><br>
                    <label class="form-label" >Zvezdice:</label>
                    <input class="form-control" name="stars" type="text" id="stars" value="<%= hotel.getStars()%>" /><br>
                    <label class="form-label" >Broj soba</label>
                    <input class="form-control" name="number" type="text" id="number" value="<%= hotel.getNumberOfRooms()%>" /><br>
                    <label class="form-label" >Slika:</label>
                    <input class="form-control" name="image" type="text" id="image" value="<%= hotel.getImage()%>" /><br>
                    <input type="hidden" name="id" value="<%= id%>">
                    <input class="btn btn-danger" type="submit" value="Izmeni" />
                    <%
                        String msg = (String) request.getAttribute("msg");
                        if (msg != null && msg.length() > 0) {
                    %>
                    <h3><%= msg%></h3>
                    <% }%>
                </form>
            </div>
        </div>
    </div>

</html>
