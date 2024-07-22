<%-- 
    Document   : men_index
    Created on : Oct 4, 2023, 1:26:51 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Manager"%>
<%@page import="beans.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Početna strana | MENADZER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="../css/stil.css" rel="stylesheet">
    </head>

    <body>
        <header>
            <div class="page-header">
                <a href="men_index.jsp"><img src="img/hoteel.jpg"></a>
                </h1>BOOKING | Menadzer</h1>
            </div>
        </header>

        <div class="container-fluid vh-100">
            <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Dobrodosli - <%= sesija.getAttribute("manager_username")%></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">MOJ HOTEL</a>
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
            <%
                Connection conn = Konekcija.Konekcija();
                ArrayList<Hotel> hoteli = new ArrayList<>();
                Manager manager = (Manager) sesija.getAttribute("manager");
                
                int id = manager.getHotel();
                try {
                    String stmt = "SELECT * FROM hotel where hotel_id=?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    
                    pst.setInt(1, id);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        hoteli.add(
                        new Hotel(rs.getInt("hotel_id"), rs.getNString("name"), rs.getNString("address"), rs.getNString("city"), 
                        rs.getNString("country"), rs.getNString("phoneNumber"), rs.getInt("stars"), rs.getInt("numberOfRooms"), rs.getNString("image")));
                    }
                } catch (Exception e) {
                }
                for (Hotel pom : hoteli) {
            %>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-3">
                    <img src="<%= pom.getImage()%>" style="max-width: 100%;height:100%;object-fit: cover;"> 
                </div>
                <div class="col-9">
                    <h3><%= pom.getName()%></h3>
                    <p style="margin-bottom: 5px;">GRAD: <strong><%= pom.getCity()%></strong></p>
                    <p style="margin-bottom: 5px;">DRZAVA: <strong><%= pom.getCountry()%></strong></p>
                    <p style="margin-bottom: 5px;">TELEFON: <strong><%= pom.getPhoneNumber()%></strong></p>
                    <p style="margin-bottom: 5px;"><i class="bi bi-star"></i>: <strong><%= pom.getStars()%></strong></p>
                    <p style="margin-bottom: 5px;">BROJ SOBA: <strong><%= pom.getNumberOfRooms()%></strong></p>
                    <p><i class="bi bi-search"></i> <a href="MenadzerSobe?hotel_id=<%= pom.getHotelId()%>">Pretrazi sobe</a></p>
                    <p><i class="bi bi-pencil"></i> <a href="izmeni_hotel_men.jsp?hotel_id=<%= pom.getHotelId()%>">Izmeni hotel</a></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
