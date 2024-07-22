<%-- 
    Document   : admin_sobe
    Created on : Oct 3, 2023, 11:22:37 PM
    Author     : user
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : prikaz_hotela
    Created on : Oct 3, 2023, 10:37:50 PM
    Author     : user
--%>
<% HttpSession sesija = request.getSession();%>
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
            <a href="index_admin.php"><img src="img/hoteel.jpg"></a>
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
        <%
            ArrayList<Room> sobe = (ArrayList<Room>) sesija.getAttribute("sobe");
            for (Room pom : sobe) {
        %>
        <div class="row" style="margin-bottom: 30px;">
                <div class="col-3">
                    <img src="<%= pom.getImage() %>" style="max-width: 100%;height:100%;object-fit: cover;"> 
                </div>
                <div class="col-9">
                    <p style="margin-bottom: 5px;">SOBA BROJ: <strong><%= pom.getNumber()%></strong></p>
                    <p style="margin-bottom: 5px;">KREVETI: <strong><%= pom.getNumberOfBeds() %></strong></p>
                    <p style="margin-bottom: 5px;">OPIS: <strong><%= pom.getDescription() %></strong></p>
                    <p style="margin-bottom: 5px;">CENA: <strong><%= pom.getPoints()%></strong></p>
                    <p style="margin-bottom: 5px;"><i class="bi bi-pencil"></i> <a href="izmenisobu.jsp?room_id=<%= pom.getRoomId()%>&hotel_id=<%= pom.getHotel() %>">Izmeni</a></p>
                </div>
            </div>
        <%
            }
        %>
        <div class="form-group">
            <a href="add_room.jsp?hotel_id=<%= sesija.getAttribute("hotel_id_sobe") %>" class="btn btn-danger">Dodaj novu sobu</a>
        </div><br>
    </div>
</html>

