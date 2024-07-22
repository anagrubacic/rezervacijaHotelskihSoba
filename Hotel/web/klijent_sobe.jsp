<%-- 
    Document   : klijent_sobe
    Created on : Oct 4, 2023, 4:04:15 PM
    Author     : user
--%>

<%@page import="beans.Room"%>
<%@page import="java.util.ArrayList"%>
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
                ArrayList<Room> sobe = (ArrayList<Room>) sesija.getAttribute("sobe");
                for (Room pom : sobe) {
            %>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-3">
                    <img src="<%= pom.getImage()%>" style="max-width: 100%;height:100%;object-fit: cover;"> 
                </div>
                <div class="col-9">
                    <p style="margin-bottom: 5px;">Broj sobe: <strong><%= pom.getNumber()%></strong></p>
                    <p style="margin-bottom: 5px;">Broj kreveta: <strong><%= pom.getNumberOfBeds()%></strong></p>
                    <p style="margin-bottom: 5px;">Opis: <strong><%= pom.getDescription()%></strong></p>
                    <p style="margin-bottom: 5px;">Cena: <strong><%= pom.getPrice()%></strong></p>
                    <p style="margin-bottom: 5px;"><a href="rez_sobu.jsp?room_id=<%= pom.getRoomId()%>&hotel_id=<%= pom.getHotel()%>">Rezervisi</a></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
