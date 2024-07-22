<%-- 
    Document   : rez_sobu
    Created on : Oct 4, 2023, 4:07:43 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Room"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();
    int soba_id = Integer.parseInt(request.getParameter("room_id"));
    int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
    Connection conn = Konekcija.Konekcija();
    Room soba = new Room();%>
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
                try {
                    String stmt = "SELECT * FROM room WHERE room_id =?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setInt(1, soba_id);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        soba.setRoomId(rs.getInt("room_id"));
                        soba.setRoomType(rs.getInt("roomType"));
                        soba.setHotel(rs.getInt("hotel"));
                        soba.setNumberOfBeds(rs.getInt("numberOfBeds"));
                        soba.setDescription(rs.getNString("description"));
                        soba.setImage(rs.getNString("image"));
                        soba.setNumber(rs.getInt("number"));
                        soba.setPoints(rs.getInt("points"));
                        soba.setPrice(rs.getDouble("price"));
                    }
                } catch (Exception ex) {
                }
            %>
            <div class="form-control" style="margin-bottom: 30px;">
                <div class="col-3">
                    <img src="<%= soba.getImage()%>" style="max-width: 100%;height:100%;object-fit: cover;"> 
                </div>
                <div class="col-9">
                    <p style="margin-bottom: 5px;">Broj sobe: <strong><%= soba.getNumber()%></strong></p>
                    <p style="margin-bottom: 5px;">Broj kreveta: <strong><%= soba.getNumberOfBeds()%></strong></p>
                    <p style="margin-bottom: 5px;">Opis: <strong><%= soba.getDescription()%></strong></p>
                    <p style="margin-bottom: 5px;">Cena: <strong><%= soba.getPrice()%></strong></p>
                    <p style="margin-bottom: 5px;">Poeni: <strong><%= soba.getPoints()%></strong></p>
                    <h3>Rezervacija</h3>
                    <div class="form-control">
                        <form action="RezervacijaSobe" method="post" name="forma">
                            <label class="form-label">Broj osoba:</label>
                            <input type="number" name="brojosoba" min="0" max="<%=soba.getNumberOfBeds()%>"> <br>
                            <label class="form-label">Datum od:</label>
                            <input type="date" name="datumOd"><br>
                            <label class="form-label">Datum do:</label>
                            <input type="date" name="datumDo">
                            <input type="hidden" name="room" value="<%= soba_id%>">
                            <input type="hidden" name="hotel" value="<%= hotel_id%>">
                            <input type="hidden" name="client" value="<%= sesija.getAttribute("client_id")%>">
    <!--                         <input type="hidden" name="tip" value="<%= soba.getRoomType()%>">-->
                            <input type="hidden" name="price" value="<%= soba.getPrice()%>">
                            <input type="hidden" name="points" value="<%= soba.getPoints()%>">
                            <input type="submit" value="Rezervisi">
                        </form>
                    </div>
                    <%
                        String msg = (String) sesija.getAttribute("msg");
                        if (msg != null && msg.length() > 0) {
                    %>
                    <p style="color:#000;"><%= msg%></p>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
