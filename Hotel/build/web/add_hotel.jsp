<%-- 
    Document   : add_hotel
    Created on : Oct 4, 2023, 12:20:40 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-lg-12">
                    <form method="post" action="DodajHotel" name="forma">
                     <label class="form-label">Ime:</label>
                    <input class="form-control" name="name" type="text" id="name" /><br>
                     <label class="form-label">Adresa:</label>
                    <input class="form-control" name="address" type="text" id="address"  /><br>
                    <label class="form-label">Grad:</label>
                    <input class="form-control" name="city" type="text" id="city"  /><br>
                    <label class="form-label" >Drzava:</label>
                    <input class="form-control" name="country" type="text" id="country" /><br>
                    <label class="form-label" >Broj Telefona:</label>
                    <input class="form-control" name="phone" type="text" id="phone"  /><br>
                    <label class="form-label" >Zvezdice:</label>
                    <input class="form-control" name="stars" type="text" id="stars" /><br>
                    <label class="form-label" >Broj soba</label>
                    <input class="form-control" name="number" type="text" id="number"  /><br>
                    <label class="form-label" >Slika:</label>
                    <input class="form-control" name="image" type="text" id="image" /><br>
                    <input class="btn btn-danger" type="submit" value="Dodaj" />
                    <%
                        String msg = (String) request.getAttribute("msg");
                        if (msg!= null && msg.length()>0) {
                    %>
                    <%= msg %>
                    <% } %>
                </form>
                </div>
            </div>
</html>
