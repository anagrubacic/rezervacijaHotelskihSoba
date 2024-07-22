<%-- 
    Document   : add_men
    Created on : Oct 4, 2023, 12:47:30 AM
    Author     : user
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();
    Manager manager = new Manager();%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Početna strana | ADMIN</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="../css/stil.css" rel="stylesheet">
    </head>

    <body>
        <header>
            <div class="page-header">
                <a href="admin_index.jsp"><img src="img/hoteel.jpg"></a>
                </h1>BOOKING | Admin</h1>
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
            </nav>
            <br>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-9">
                    <form method="post" action="DodajManagera" name="forma">
                        <label class="form-label">Ime:</label>
                        <input class="form-control" name="ime" type="text" id="ime" /><br>
                        <label class="form-label">Prezime</label>
                        <input class="form-control" name="prezime" type="text" id="prezime"  /><br>
                        <label class="form-label">Email:</label>
                        <input class="form-control" name="new_email" type="text" id="new_email" /><br>
                        <label class="form-label" >Username:</label>
                        <input class="form-control" name="username" type="text" id="username"  /><br>
                        <label class="form-label" >Sifra:</label>
                        <input class="form-control" name="password" type="text" id="password"  /><br>
                        <label class="form-label" >Hotel:</label>

                        <select class="form-control"  name="hotel" id="hotel">
                            <%String sql = "SELECT DISTINCT * FROM manager m JOIN hotel h ON m.hotel=h.hotel_id";
                                Connection conn = Konekcija.Konekcija();
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    String idHotel = rs.getString("hotel_id");
                                    String naziv = rs.getString("name");
                                    out.println("<option value='" + idHotel + "'>" + naziv + "</option>");
                                }%>
                        </select><br>
                        
                        <input class="btn btn-danger" type="submit" value="Dodaj" />
                        <%
                            String msg = (String) request.getAttribute("msg");
                            if (msg != null && msg.length() > 0) {
                        %>
                        <h3><%= msg%></h3>
                        <% }%>
                    </form>
                </div>
            </div>

    </body>
</html>
