<%-- 
    Document   : my_profile
    Created on : Oct 4, 2023, 3:46:22 PM
    Author     : user
--%>

<%@page import="beans.Client"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Booking"%>
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
                Client klijent = new Client();
                int client_id = (int) sesija.getAttribute("client_id");
                try {
                    Connection conn = Konekcija.Konekcija();
                    String stmt = "SELECT * FROM client WHERE client_id=?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setInt(1, client_id);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        klijent = new Client(
                                rs.getInt("client_id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), rs.getString("password"),
                                rs.getInt("numberOfPoints"));
                    }
                } catch (Exception e) {
                }
            %>
            <div class="container-lg">
                <div class="row" style="margin-bottom: 30px;">
                    <div class="col-9">
                        <form method="post" action="IzmenaKlijentaK" name="forma">
                            <label class="form-label">Ime:</label>
                            <input class="form-control" name="ime" type="text" id="ime" value="<%= klijent.getFirstName()%>" /><br>
                            <label class="form-label">Prezime</label>
                            <input class="form-control" name="prezime" type="text" id="prezime" value="<%= klijent.getLastName()%>" /><br>
                            <label class="form-label">Email:</label>
                            <input class="form-control" name="email" type="text" id="new_email" value="<%= klijent.getEmail()%>" /><br>
                            <label class="form-label" >Sifra:</label>
                            <input class="form-control" name="password" type="text" id="password" value="<%= klijent.getPassword()%>" /><br>
                            <label class="form-label" >Poeni:</label>
                            <input class="form-control" name="poeni" type="text" id="poeni" value="<%= klijent.getPoints()%>" disabled /><br>
                            <input type="hidden" name="client_id" value="<%= client_id%>">
                            <input class="btn btn-danger" type="submit" value="IZMENI" />
                            <%
                                String msg = (String) request.getAttribute("msg");
                                if (msg != null && msg.length() > 0) {
                            %>
                            <h3><%= msg%></h3>
                            <% } %>
                        </form>
                        <br>
                        <%
                            try {
                                Connection conn = Konekcija.Konekcija();
                                ArrayList<Booking> rezervacije = new ArrayList<>();
                                String stmt = "SELECT * FROM booking WHERE client=?";
                                PreparedStatement pst = conn.prepareStatement(stmt);
                                pst.setInt(1, client_id);
                                ResultSet rs = pst.executeQuery();

                                while (rs.next()) {
                                    rezervacije.add(
                                            new Booking(rs.getInt("booking_id"), rs.getDate("dateFrom"), rs.getDate("dateTo"), rs.getInt("room"), rs.getInt("hotel"),
                                                    rs.getInt("client"), rs.getInt("points"), rs.getDouble("price")));
                                }
                        %>
                        <div class="container-md  text-center">
                            <h2>Rezervacije</h2>
                            <div class="row">
                                <div class="col-2">Datum od</div>
                                <div class="col-2">Datum do</div>
                                <div class="col-2">Hotel</div>
                                <div class="col-2">Poeni</div>
                                <div class="col-2">Cena</div>
                            </div>
                            <%
                                for (Booking pom : rezervacije) {
                            %>
                            <div class="row">
                                <div class="col-2"><%= pom.getDateFrom()%></div>
                                <div class="col-2"><%= pom.getDateTo()%></div>
                                <div class="col-2"><%= pom.getHotel()%></div>
                                <div class="col-2"><%= pom.getPoints()%></div>
                                <div class="col-2"><%= pom.getPrice()%></div>
                                <div class="col-2"><a href="BrisiRezervaciju?booking_id=<%= pom.getBookingId()%>"><i class="bi bi-trash"></i>OBRISI</a></div>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
