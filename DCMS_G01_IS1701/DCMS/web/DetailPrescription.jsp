<%-- 
    Document   : detailService
    Created on : Jun 25, 2023, 9:50:04 PM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Detail</title>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* Topbar */
            .topbar {
                background-color: #f8f9fa;
                padding: 10px;
            }

            .topbar .opening-hours {
                font-size: 14px;
            }

            .topbar .contact-info {
                font-size: 14px;
                font-weight: bold;
            }

            /* Full Screen Search */
            .search-modal .modal-content {
                background: rgba(9, 30, 62, 0.7);
            }

            .search-modal .input-group {
                max-width: 600px;
            }

            .search-modal .form-control {
                background-color: transparent;
                border: none;
                border-bottom: 2px solid #007bff;
                border-radius: 0;
                box-shadow: none;
                color: #fff;
                font-size: 16px;
                padding: 16px;
            }

            .search-modal .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                border-radius: 0;
                padding: 14px 20px;
            }

            /* Service Details */
            header {
                background-color: #007bff;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            h1 {
                margin: 0;
                font-size: 24px;
            }

            main {
                padding: 20px;
            }

            .employee-details {
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .employee-description {
                flex: 1;
            }

            .employee-description p {
                margin: 0 0 10px;
                font-size: 16px;
            }

            .employee-description strong {
                font-weight: bold;
            }


        </style>

    </head>
    <body>




        <jsp:include page="Navbar.jsp" />
        <div class="container mt-5">
            <h1 class="mb-4">Detail prescription</h1>
            <form method="post" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="materialName">Material Name</label>
                            <div class="position-relative">
                                <p class="form-control">${prescription.materialName}</p>
                                

                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="date"><strong>Date:</strong></label>
                            <div class="position-relative">
                                <p class="form-control">${prescription.date}</p>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="note">Note</label>
                            <div class="position-relative">
                                <p class="form-control">${prescription.note}</p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="unit"><strong>Unit:</strong></label>
                            <div class="position-relative">
                                <p class="form-control"> ${prescription.unit}</p>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="amount">Amount</label>
                            <div class="position-relative">
                                <p class="form-control">${prescription.amount}</p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="button" onclick="location.href = 'detailappointment?aid=${appointmentId}'" class="btn btn-secondary">Back</button>
                </div>
            </form>
        </div>

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

    

</html>
