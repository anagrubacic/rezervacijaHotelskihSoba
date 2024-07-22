<%-- 
    Document   : prikaz_menadzera
    Created on : Oct 4, 2023, 12:23:34 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.Manager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Konekcija"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesija = request.getSession();%>
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
            <div class="box-list">
                <table class="table table-bordered table-striped border-danger table-hover">
                    <tr class="table-danger">
                        <th class="table-light">Ime</th>
                        <th class="table-light">Prezime</th>
                        <th>Korisnicko ime</th>
                        <th>Email adresa</th>
                        <th>Lozinka</th>
                        <th></th>
                    </tr>
                    <%
                        Connection conn = Konekcija.Konekcija();
                        ArrayList<Manager> managers = new ArrayList<Manager>();
                        String stmt = "SELECT * FROM manager";
                        PreparedStatement pst = conn.prepareStatement(stmt);
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                            managers.add(
                                    new Manager(rs.getInt("manager_id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"),
                                            rs.getString("username"), rs.getString("password"), rs.getInt("hotel"))
                            );
                        }
                        for (Manager pom : managers) {
                    %>
                    <tr class="table-danger">
                        <td class="table-light">
                            <%= pom.getFirstName()%>
                        </td>
                        <td class="table-light">
                            <%= pom.getLastName()%>
                        </td>
                        <td>
                            <%= pom.getUsername()%>
                        </td>
                        <td>
                            <i class="bi bi-envelope"> </i><a href="mailto:<%= pom.getEmail()%>"><%= pom.getEmail()%></a>
                        </td>
                        <td>
                            <%= pom.getPassword()%>
                        </td>
                        <td>
                            <a href="izmeni_men.jsp?manager_id=<%= pom.getManagerId()%>"><i class="bi bi-pencil"></i></a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <div class="form-group">
                <a href="add_men.jsp" class="btn btn-danger">Dodaj menadzera</a>
            </div><br>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>