<%-- 
    Document   : user_Appointment
    Created on : Jul 9, 2023, 10:35:56 PM
    Author     : Nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic Website Template</title>
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
        <style>
            .error-message {
                color: white;
            }
        </style>

    </head>

    <body>



        <jsp:include page="Navbar.jsp" />




        <!-- Hero Start -->
        <div class="container-fluid bg-primary py-5 hero-header mb-5">
            <div class="row py-3">
                <div class="col-12 text-center">
                    <h1 class="display-3 text-white animated zoomIn">Appointment</h1>
                    <a href="" class="h4 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h4 text-white">Appointment</a>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Appointment Start -->
        <div class="container-fluid bg-primary bg-appointment mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 90px;">
            <div class="container">
                <div class="row gx-5">
                    <div class="col-lg-6 py-5">
                        <div class="py-5">
                            <h1 class="display-5 text-white mb-4">We Are A Certified and Award Winning Dental Clinic You Can Trust</h1>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s">
                            <h1 class="text-white mb-4">Book An Appointment</h1>
                            <form action="bookappointment" method="post" onsubmit="return validateForm()">

                                <div class="row g-3">


                                    <div class="col-12 col-sm-6">
                                        <p style="color: white">Start Time</p>
                                        <div class="time" id="time1" data-target-input="nearest">
                                            <input id="start_time" name="start_time" type="time" class="form-control bg-light border-0" placeholder="Appointment Start Time" style="height: 55px;" required onblur="validateForm()">
                                            <span id="timeError"></span>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <p style="color: white">End Time</p>
                                        <div class="time" id="time1" data-target-input="nearest">
                                            <input id="end_time" name="end_time" type="time" class="form-control bg-light border-0" placeholder="Appointment Time" data-toggle="datetimepicker" style="height: 55px;" required onblur="validateForm()">
                                            <span id="endTimeError"></span>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="date" id="date1" data-target-input="nearest">
                                            <input name="date" type="date" class="form-control bg-light border-0" placeholder="Appointment Date" style="height: 55px;" required onblur="validateForm()">
                                            <span id="dateError"></span>
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <div class="date" id="date1" data-target-input="nearest" >
                                            <input name="tooth_number" type="text" class="form-control bg-light border-0" placeholder="Tooth number" style="height: 55px;" required onblur="validateForm()">
                                            <span id="toothNumberError"></span>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <p style="color: white">Choose your service:</p>
                                        <select class="form-select bg-light border-0" style="height: 55px;" name="service_id"> 
                                            <c:forEach items="${listservice}" var="service">
                                                <option value="${service.id}">${service.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <p style="color: white">Your desired doctor:</p>
                                        <select class="form-select bg-light border-0" style="height: 55px;" name="employee_id">
                                            <c:forEach items="${listemployee}" var="employee">
                                                <option value="${employee.id}">${employee.fullName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-12">
                                        <button type="button" class="btn btn-primary" onclick="validateForm()" data-bs-toggle="modal" data-bs-target="#exampleModal">Book An Appointment</button>


                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Notification</h5>

                                                    </div>
                                                    <div class="modal-body">
                                                        Do you want to book this appointment?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <c:if test ="${sessionScope.userLogged.roleId == 3}">
                                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Newsletter Start -->
        <div class="container-fluid position-relative pt-5 wow fadeInUp" data-wow-delay="0.1s" style="z-index: 1;">
            <div class="container">
                <div class="bg-primary p-5">
                    <form class="mx-auto" style="max-width: 600px;">
                        <div class="input-group">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Newsletter End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
            <div class="container pt-5">
                <div class="row g-5 pt-4">
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Quick Links</h3>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">

                        <div class="d-flex flex-column justify-content-start">

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Get In Touch</h3>
                        <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>FPT, HANOI, VIETNAM</p>
                        <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>G1Dental@gmail.com</p>
                        <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>+012 345 6789</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Follow Us</h3>
                        <div class="d-flex">
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-youtube fw-normal"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


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
        <script src="js/main.js"></script>
        <script>
                                            function validateForm() {
                                                var appointmentDate = document.getElementsByName("date")[0].value;
                                                var currentDate = new Date().toISOString().split("T")[0];
                                                var dateError = document.getElementById("dateError");

                                                var startTime = document.getElementById("start_time").value;
                                                var endTime = document.getElementById("end_time").value;
                                                var endTimeError = document.getElementById("endTimeError");

                                                var toothNumber = parseInt(document.getElementsByName("tooth_number")[0].value);
                                                var toothNumberError = document.getElementById("toothNumberError");

                                                var timeError = document.getElementById("timeError");

                                                var startHour = parseInt(startTime.split(":")[0]);
                                                var endHour = parseInt(endTime.split(":")[0]);

                                                // Convert 12-hour format to 24-hour format
                                                if (startTime.includes("PM") && startHour !== 12) {
                                                    startHour += 12;
                                                }

                                                if (endTime.includes("PM") && endHour !== 12) {
                                                    endHour += 12;
                                                }

                                                if (startTime.includes("AM") && startHour === 12) {
                                                    startHour = 0;
                                                }

                                                if (endTime.includes("AM") && endHour === 12) {
                                                    endHour = 0;
                                                }

                                                var isValid = true;

                                                if (appointmentDate < currentDate) {
                                                    dateError.innerText = "Please select a date at least the current date.";
                                                    dateError.style.color = "white";
                                                    dateError.style.display = "block";
                                                    isValid = false;
                                                } else {
                                                    dateError.innerText = "";
                                                    dateError.style.color = "";
                                                    dateError.style.display = "none";
                                                }

                                                if (startTime >= endTime) {
                                                    endTimeError.innerText = "End time must be after start time.";
                                                    endTimeError.style.color = "white";
                                                    endTimeError.style.display = "block";
                                                    isValid = false;
                                                } else {
                                                    endTimeError.innerText = "";
                                                    endTimeError.style.color = "";
                                                    endTimeError.style.display = "none";
                                                }

                                                if (isNaN(toothNumber) || toothNumber < 1 || toothNumber > 32) {
                                                    toothNumberError.innerText = "Please enter a tooth number between 1 and 32.";
                                                    toothNumberError.style.color = "white";
                                                    toothNumberError.style.display = "block";
                                                    isValid = false;
                                                } else {
                                                    toothNumberError.innerText = "";
                                                    toothNumberError.style.color = "";
                                                    toothNumberError.style.display = "none";
                                                }

                                                if (startHour < 6 || startHour > 22 || endHour < 6 || endHour > 22) {
                                                    timeError.innerText = "Please select a time between 6 AM and 10 PM.";
                                                    timeError.style.color = "white";
                                                    timeError.style.display = "block";
                                                    isValid = false;
                                                } else {
                                                    timeError.innerText = "";
                                                    timeError.style.color = "";
                                                    timeError.style.display = "none";
                                                }

                                                return isValid;
                                            }
        </script>
    </body>

</html>