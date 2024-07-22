<%-- 
    Document   : men_login
    Created on : Oct 2, 2023, 5:01:12 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="../css/stil.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>

    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-danger">
                            Login
                        </div>
                        <div class="card-body">
                            <form method="POST" action="ProveraMenadzera">
                                <div class="mb-3 text-danger">
                                    Username <input type="text" class="form-control" name="username" required>
                                <div class="mb-3 text-danger">
                                    Password <input type="password" class="form-control" name="password" required>
                                </div>
                                <button type="submit" class="btn btn-danger">Login</button><br><br>
                                <%
                                    String msg = (String) request.getAttribute("msg");
                                    if (msg != null && msg.length() > 0) {
                                %>
                                <%= msg%>
                                <% }%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
