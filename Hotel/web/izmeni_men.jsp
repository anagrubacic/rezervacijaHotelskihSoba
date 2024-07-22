<%-- 
    Document   : izmeni_men
    Created on : Oct 4, 2023, 12:37:12 AM
    Author     : user
--%>

<%@page import="beans.Manager"%>
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
            </nav><br>
            <%
                String email = request.getParameter("client_email");
                Manager manager = new Manager();
                int manager_id = Integer.parseInt(request.getParameter("manager_id"));
                try {
                    Connection conn = Konekcija.Konekcija();
//                ArrayList<Hotel> hoteli = new ArrayList<Hotel>();
                    String stmt = "Select * from manager where manager_id=?";
                    PreparedStatement pst = conn.prepareStatement(stmt);
                    pst.setInt(1, manager_id);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        manager = new Manager(rs.getInt("manager_id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"),
                                        rs.getString("username"), rs.getString("password"), rs.getInt("hotel"));
                        
                        manager.setEmail(rs.getString("email"));
                        manager.setPassword(rs.getString("password"));
                    }
                } catch (Exception e) {
                }
            %>
            <div class="row" style="margin-bottom: 30px;">
                <div class="col-9">
                    <form method="post" action="IzmenaManagera" name="forma">
                        <label class="form-label">Ime:</label>
                        <input class="form-control" name="ime" type="text" id="ime" value="<%= manager.getFirstName()%>" /><br>
                        <label class="form-label">Prezime</label>
                        <input class="form-control" name="prezime" type="text" id="prezime" value="<%= manager.getLastName()%>" /><br>
                        <label class="form-label">Email:</label>
                        <input class="form-control" name="new_email" type="text" id="new_email" value="<%= manager.getEmail()%>" /><br>
                        <label class="form-label" >Username:</label>
                        <input class="form-control" name="username" type="text" id="username" value="<%= manager.getUsername()%>" /><br>
                        <label class="form-label" >Sifra:</label>
                        <input class="form-control" name="password" type="text" id="password" value="<%= manager.getPassword()%>" /><br>
                        <label class="form-label" >Hotel:</label>
                        <input class="form-control" name="hotel" type="text" id="hotel"  value="<%= manager.getHotel()%>"/><br>
                        <input type="hidden" name="manager_id" value="<%= manager_id%>">
                        <input class="btn btn-danger" type="submit" value="Izmeni" />
                        <%
                            String msg = (String) request.getAttribute("msg");
                            if (msg != null && msg.length() > 0) {
                        %>
                        <h3><%= msg%></h3>
                        <% }%>
                    </form>
                    <a href="DeleteManager?manager_id=<%= manager_id%>"><i class="bi bi-trash"></i> Izbrisi</a>
                </div>
            </div>
    </body>
</html>
