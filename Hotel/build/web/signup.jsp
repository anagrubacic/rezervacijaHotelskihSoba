<%-- 
    Document   : signup
    Created on : Oct 3, 2023, 9:01:43 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-danger">
                            Sign Up
                        </div>
                        <div class="card-body">
                            <form method="POST" action="KreirajKorisnika">
                                <div class="mb-3 text-danger">
                                    First Name <input type="text" class="form-control" name="name" >
                                </div>
                                <div class="mb-3 text-danger">
                                    Last Name <input type="text" class="form-control" name="lastname" >
                                </div>
                                <div class="mb-3 text-danger">
                                    Email <input type="email" class="form-control" name="email" >
                                </div>
                                <div class="mb-3 text-danger">
                                    Password <input type="password" class="form-control" name="password" >
                                </div>
                                <button type="submit" class="btn btn-danger">Sign Up</button>
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

