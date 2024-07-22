<%-- 
    Document   : add_room_men
    Created on : Oct 4, 2023, 1:56:36 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();
    int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));%>
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
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-9">
                    <form method="post" action="DodajSobuManager" name="forma">
                        <label class="form-label">Tip sobe:</label>
                        <select class="form-control" name="tip" id="tip">
                            <%
                                    Connection conn = Konekcija.Konekcija();
                                    String sql = "SELECT DISTINCT * FROM room r JOIN roomtype rt ON r.roomType=rt.roomType_id";
                                    PreparedStatement pstmt = conn.prepareStatement(sql);
                                    ResultSet rs = pstmt.executeQuery();

                                    while (rs.next()) {
                                        int idRoomType = Integer.parseInt(rs.getString("roomType"));
                                        String name = rs.getString("name");
                                        out.println("<option value='" + idRoomType + "'>" + name + "</option>");
                                    }

                                    rs.close();
                                    pstmt.close();
                                    conn.close();
                            %>
                        </select><br>
                        <label class="form-label">Broj kreveta:</label>
                        <input class="form-control" name="numberofbeds" type="text" id="numberofbeds"  /><br>
                        <label class="form-label">Opis:</label>
                        <textarea class="form-control" name="opis" id="opis" ></textarea><br>
                        <label class="form-label" >Cena:</label>
                        <input class="form-control" name="price" type="text" id="price"  /><br>
                        <label class="form-label" >Poeni:</label>
                        <input class="form-control" name="poeni" type="text" id="poeni"  /><br>
                        <label class="form-label" >Broj sobe</label>
                        <input class="form-control" name="number" type="text" id="number"  /><br>
                        <label class="form-label" >Slika</label>
                        <input class="form-control" name="image" type="text" id="image"/><br>
                        <input type="hidden" name="hotel_id" value="<%= hotel_id%>">
                        <input class="btn btn-danger" type="submit" value="DODAJ" />
                        <%
                            String msg = (String) request.getAttribute("msg");
                            if (msg

                            != null && msg.length () 
                                > 0) {
                        %>
                        <%= msg%>
                        <% }%>
                    </form>
                </div>
            </div>
    </body>
</html>
