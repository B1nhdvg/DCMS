<%-- 
    Document   : Navbar
    Created on : Jul 13, 2023, 5:16:24 PM
    Author     : Nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Wo Hai Ruan Dental Clinic</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

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
    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <small class="py-2"><i class="far fa-clock text-primary me-2"></i>Opening Hours: Mon - Tues : 6.00 am - 10.00 pm, Sunday Closed </small>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-end">
                    <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                        <div class="me-3 pe-3 border-end py-2">
                            <p class="m-0"><i class="fa fa-envelope-open me-2"></i>G1Dental@gmail.com</p>
                        </div>
                        <div class="py-2">
                            <p class="m-0"><i class="fa fa-phone-alt me-2"></i>+0123456789</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
            <a href="home" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>Wo Hai Ruan</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="home" class="nav-item nav-link active">Home</a>
                     <c:if test ="${sessionScope.userLogged.roleId != 2}">
                    <a href="userviewaboutus" class="nav-item nav-link">About</a>
                    <a href="userviewservice" class="nav-item nav-link">Service</a>
                    <a href="userviewdoctor" class="nav-item nav-link">Our Dentist</a>
                    </c:if>
                    <c:if test ="${sessionScope.userLogged.roleId == 3 }">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Appointment</a>
                            <div class="dropdown-menu m-0">
                                <a href="bookappointment" class="dropdown-item">Book Appointment</a>
                                <a href="viewappointmenthistory" class="dropdown-item">My Appointment</a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test ="${sessionScope.userLogged.roleId == 1 }">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">System Management</a>
                            <div class="dropdown-menu m-0">
                                <a href="pagingservice" class="dropdown-item">Service Management</a>
                                <a href="pagingemployee" class="dropdown-item">Employee Management</a>
                                <a href="pagingpatient" class="dropdown-item">Patient Management</a>
                                <a href="listappointment" class="dropdown-item">Appointment Management</a>
                            </div>
                        </div>
                    </c:if>
                </div>

                

                <c:if test ="${sessionScope.userLogged.roleId == 2 }">
                    <a href="listappointmentofanemployee" class="btn btn-primary py-2 px-4 ms-3">Appointment Schedule</a>
                </c:if>

                <c:if test ="${not empty sessionScope.userLogged or not empty sessionScope.adminLogged or not empty sessionScope.employeeLogged}">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"> Hello ${userName}</a>
                        <div class="dropdown-menu m-0">
                            <a href="viewprofile" class="dropdown-item">User Profile</a>
                            <a href="changepassword" class="dropdown-item"> Change Password</a>
                            <a href="logout" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty sessionScope.userLogged and empty sessionScope.adminLogged and empty sessionScope.employeeLogged}">
                    <a href="login" class="btn btn-primary py-2 px-4 ms-3">Login</a>
                </c:if>

            </div>
        </nav>
        <!-- Navbar End -->
    </body>
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

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</html>
