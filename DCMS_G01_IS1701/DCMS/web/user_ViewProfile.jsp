<%-- 
    Document   : viewprofile
    Created on : Jun 6, 2023, 8:40:28 PM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">        
        <style>
            .hidetext { -webkit-text-security: disc; /* Default */ }
        </style>
    </head>
    <body>



        <jsp:include page="Navbar.jsp" />



        <!--   view table-->
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-4">
                        <div class="card-header">
                            <h1 class="text-center">View ${role} Profile</h1>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <tr>
                                    <th>User Name:</th>
                                    <td>${listU.getUsername()}</td>
                                </tr>
                                <tr>
                                    <th>Password:</th>
                                    <td class="hidetext">${listU.getPassword()}</td>
                                </tr>
                                <tr>
                                    <th>Identification Number:</th>
                                    <td>${listU.getId()}</td>
                                </tr>
                                <tr>
                                    <th>Full Name:</th>
                                    <td>${listU.getFullName()}</td>
                                </tr>
                                <tr>
                                    <th>Gender:</th>
                                    <td>${listU.getGender()}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${listU.getEmail()}</td>
                                </tr>
                                <tr>
                                    <th>Address:</th>
                                    <td>${listU.getAddress()}</td>
                                </tr>
                                <tr>
                                    <th>Phone:</th>
                                    <td>${listU.getPhone()}</td>
                                </tr>
                                <tr>
                                    <th>Date of Birth:</th>
                                    <td>${listU.getDob()}</td>
                                </tr>
<!--                                <tr>
                                    <th>Role:</th>
                                    <td>${role}</td>
                                </tr>-->
                            </table>
                        </div>
                        <div class="card-footer">
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="button" onclick="location.href = 'profileedit?sid=${listU.getId()}'" class="btn btn-primary me-md-2">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--view table end-->

    </body>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="lib/twentytwenty/jquery.event.move.js"></script>
    <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>
</html>
