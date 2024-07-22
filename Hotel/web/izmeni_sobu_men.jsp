<%-- 
    Document   : izmeni_sobu_men
    Created on : Oct 4, 2023, 2:24:08 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();
    Room soba = new Room();%>
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
                int id = Integer.parseInt(request.getParameter("room_id"));
                int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
                try {
                    Connection conn = Konekcija.Konekcija();

                    String stmt = "SELECT * FROM room WHERE room_id=?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setInt(1, id);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        soba = new Room(rs.getInt("room_id"), rs.getInt("roomType"), rs.getInt("hotel"), rs.getInt("numberOfBeds"), rs.getNString("description"),
                                rs.getNString("image"), rs.getInt("number"), rs.getDouble("price"), rs.getInt("points"));
                    }
                } catch (Exception e) {
                }
            %>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-9">
                    <form method="post" action="IzmenaSobeManager" name="forma">
                        <label class="form-label">Tip:</label>
                        <input class="form-control" name="type" type="text" id="type" value="<%= soba.getRoomType()%>" /><br>
                        <label class="form-label">Broj kreveta</label>
                        <input class="form-control" name="numberofbeds" type="text" id="numberofbeds" value="<%= soba.getNumberOfBeds()%>" /><br>
                        <label class="form-label">Opis:</label>
                        <textarea class="form-control" name="opis" type="text" id="opis" /><%= soba.getDescription()%></textarea><br>
                        <label class="form-label" >Cena:</label>
                        <input class="form-control" name="price" type="text" id="price" value="<%= soba.getPrice()%>" /><br>
                        <label class="form-label" >Poeni:</label>
                        <input class="form-control" name="poeni" type="text" id="poeni" value="<%= soba.getPoints()%>" /><br>
                        <label class="form-label" >Broj sobe</label>
                        <input class="form-control" name="number" type="text" id="number" value="<%= soba.getNumber()%>" /><br>
                        <label class="form-label" >Slika</label>
                        <input class="form-control" name="image" type="text" id="image" value="<%= soba.getImage()%>" /><br>
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="hotel_id" value="<%= hotel_id%>">
                        <input class="btn btn-danger" type="submit" value="IZMENI" />
                        <%
                            String msg = (String) request.getAttribute("msg");
                            if (msg != null && msg.length() > 0) {
                        %>
                        <%= msg%>
                        <% }%>
                        <div class="form-group">
                            <br><a href="DeleteRoomManager?room_id=<%= id%>&hotel_id=<%= hotel_id%>" class="btn btn-danger">OBRISI SOBU</a>
                        </div><br>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
