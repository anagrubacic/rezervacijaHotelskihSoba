<%-- 
    Document   : hoteli
    Created on : Oct 4, 2023, 3:02:50 PM
    Author     : user
--%>

<%@page import="beans.Konekcija"%>
<%@page import="beans.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Početna strana | KLIJENT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="../css/stil.css" rel="stylesheet">
    </head>

    <body>
        <header>
            <div class="page-header">
                <a href="client_index.jsp"><img src="img/hoteel.jpg"></a>
                </h1>BOOKING | KLIJENT</h1>
            </div>
        </header>

        <div class="container-fluid vh-100">
            <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Dobrodosli - <%= sesija.getAttribute("client_email")%></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="my_profile.jsp">MOJ PROFIL</a>
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
                ArrayList<Hotel> hoteli = (ArrayList<Hotel>) sesija.getAttribute("hoteli");
                for (Hotel pom : hoteli) {
            %>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-3">
                    <img src="<%= pom.getImage()%>" style="max-width: 100%;height:100%;object-fit: cover;"> 
                </div>
                <div class="col-9">
                    <h3><%= pom.getName()%></h3>
                    <p style="margin-bottom: 5px;">Grad: <strong><%= pom.getCity()%></strong></p>
                    <p style="margin-bottom: 5px;">Drzava: <strong><%= pom.getCountry()%></strong></p>
                    <p style="margin-bottom: 5px;">Broj Telefona: <strong><%= pom.getPhoneNumber()%></strong></p>
                    <p style="margin-bottom: 5px;">Zvezdice: <strong><%= pom.getStars()%></strong></p>
                    <p style="margin-bottom: 5px;">Broj soba: <strong><%= pom.getNumberOfRooms()%></strong></p>
                    <p><a href="PretragaSobe?hotel_id=<%= pom.getHotelId()%>"><i class="bi bi-info-circle"></i> DETALJNIJE</a></p>
                </div> 
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
