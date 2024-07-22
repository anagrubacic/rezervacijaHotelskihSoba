<%-- 
    Document   : client_index
    Created on : Oct 4, 2023, 2:50:51 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Konekcija"%>
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
            <form method="post" action="PretragaHotela" name="forma" style="background: pink;padding: 50px;text-align: left;">
                <h1>PRONADJI HOTEL</h1>
                <label class="form-label" style="color: #fff;">Zemlja:</label>
                <select class="form-control" name="country" id="country">
                    <%
                        Connection conn = Konekcija.Konekcija();
                        try {
                            String stmt = "Select distinct country from hotel";
                            PreparedStatement ps = conn.prepareStatement(stmt);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <option value="<%= rs.getNString("country")%>"><%= rs.getNString("country")%></option>
                    <%
                            }
                        } catch (Exception Ex) {
                        } %>
                </select>
                <label class="form-label" style="color: #fff;">Zvezdice:</label>
                <select class="form-control" name="stars" id="stars">
                    <%
                        try {
                            String stmt = "Select distinct stars from hotel";
                            PreparedStatement ps = conn.prepareStatement(stmt);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <option value="<%= rs.getInt("stars")%>"><%= rs.getInt("stars")%></option>
                    <%
                            }
                        } catch (Exception Ex) {
                        }%>
                </select> <br>
                <input class="btn btn-danger" type="submit" value="Pretrazi" />
                <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null && msg.length() > 0) {
                %>
                <%= msg%>
                <% }%>
            </form>
        </div>
</html>
