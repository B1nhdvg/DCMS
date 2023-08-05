<%-- 
    Document   : View_List_Appointment
    Created on : Jul 2, 2023, 3:34:20 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Page Title</title>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>

            /* New CSS styles for Active and Deactive checkboxes */
            .status-checkbox {
                display: inline-block;
                width: 18px;
                height: 18px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .approved-checkbox {
                background-color: green;
            }

            .pending-checkbox {
                background-color: yellow;
            }

            .cancel-checkbox {
                background-color: red;
            }

            /* Định dạng cho phần tìm kiếm */
            .search-service {
                margin-bottom: 20px;
            }

            /* Định dạng cho bảng dữ liệu */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th,
            .table td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            /* Định dạng cho nút chức năng */
            .btn {
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 400;
                line-height: 1.42857143;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                user-select: none;
                border: 1px solid transparent;
                border-radius: 4px;
            }

            .btn-primary {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-danger {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }

            /* Định dạng cho phần nội dung */
            #content {
                margin-top: 20px;
            }

            .container {
                max-width: 960px;
                margin-right: auto;
                margin-left: auto;
                padding-right: 15px;
                padding-left: 15px;
            }

            .mt-4 {
                margin-top: 1.5rem !important;
            }

            /* Định dạng cho ô input tìm kiếm */
            .input-group {
                display: flex;
                max-width: 500px;
            }

            .search-service {
                display: flex;
                justify-content: center; /* Canh giữa theo chiều ngang */
                align-items: center; /* Canh giữa theo chiều dọc */
                margin-bottom: 20px;
            }

            .form-control {
                flex: 1;
                border-radius: 4px;
                padding: 8px;
                border: 1px solid #ddd;
                width: 200px;
            }

            .form-control::placeholder {
                color: #999;
            }

            .form-control:focus {
                outline: none;
                box-shadow: 0 0 5px #ddd;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: dodgerblue;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }


        </style>
    </head>
    <body>


        <jsp:include page="Navbar.jsp" />


        <div id="content" class="container mt-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <!--<th>Appointment Id</th>-->
                        <th>Date</th>
                        <th>Start time</th>
                        <!--<th>End time</th>-->                
                        <th>Employee</th>       
                        <th>Patient</th>
                        <th>Service</th>
                        <!--<th>Tooth Number</th>-->
                        <th>Status</th>
                        <th>Functions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alist}" var="x" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td>${x.date}</td>
                            <td>${x.startTime}</td>
                            <td>${x.getEmployeeName(x.employeeId)}</td>
                            <td>${x.getPatientName(x.patientId)}</td>
                            <td>${x.getServiceName(x.serviceId)}</td>
                            <td style="color:
                                ${x.status eq 'Pending' ? 'gray' : 
                                  x.status eq 'Canceled' ? 'red' :
                                  x.status eq 'Approved' ? 'green' : ''}">
                                    ${x.status}
                                </td>
                                <td>
                                    <a href="detailappointment?aid=${String.valueOf(x.id)}" class="btn btn-sm btn-warning">Detail</a>

                                    <a href="updateappointment?sid=${String.valueOf(x.id)}" class="btn btn-sm btn-primary">Update</a>
                                    <c:if test="${sessionScope.userLogged.roleId == 3 or sessionScope.userLogged.roleId == 1 }">
                                        <button type="button" class="btn btn-sm btn-danger" onclick="showDeleteModal(${x.id})">Cancel</button>
                                    </c:if>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Delete Confirmation Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cancel Confirmation</h5>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to Cancel this Appointment?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                            <button type="button" class="btn btn-danger" onclick="deleteAppointment()">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <script>
            var appointmentIdToDelete = null;

            function showDeleteModal(appointmentId) {
                appointmentIdToDelete = appointmentId;
                $('#deleteModal').modal('show');
            }

            function deleteAppointment() {
                if (appointmentIdToDelete) {
                    window.location.href = 'cancelappointment?sid=' + appointmentIdToDelete;
                }
            }
        </script>



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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </html>

