<%-- 
    Document   : welcome
    Created on : Oct 2, 2023, 4:54:50 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="css/stil_welcome.css">
</head>

<body>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-light text-danger" style="border-radius: 1rem;">
                        <div class="card-body p-4 text-center">
                            <div class="mb-md-3 mt-md-2 pb-2">
                                <h1 class="fw-bold mb-2 text-uppercase" style="font-weight: 800;">Dobrodošli na portal
                                    rezervacija hotelskih soba
                                </h1>
                                <br>
                                <p style="font-size: large; font-weight: 500;">Ulogujte se da biste pristupili portalu.
                                </p><br>

                                <a href="admin_login.jsp" class="text-danger">Admin</a>
                                <a href="klijent_login.jsp" class="text-danger">Klijent</a>
                                <a href="men_login.jsp" class="text-danger">Menadzer</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>

