<%-- 
    Document   : DetailAppointment
    Created on : Jul 16, 2023, 1:46:05 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

            .success-message {
                color: green;
                font-size: 14px;
                margin-top: 10px;
            }
        </style>
        <script>
            function getStatusColor(status) {
                if (status === "Pending") {
                    return "text-black";
                } else if (status === "Approved") {
                    return "text-success";
                } else if (status === "Canceled") {
                    return "text-danger";
                } else {
                    return "";
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="Navbar.jsp" />
        <c:if test="${not empty successMessage}">
            <div id="successMessage" class="alert alert-success" role="alert">
                ${successMessage}
            </div>
            <script>
                setTimeout(function () {
                    var successMessage = document.getElementById('successMessage');
                    successMessage.style.display = 'none';
                }, 4000);
            </script>
        </c:if>

        <main>
            <div class="container mt-5">
                <div class="row">
                    <h1>Detail of Appointment</h1>

                    <div class="col-md-6">
                        <div class="mb-3">
                            <p class="form-control"><strong>Date:</strong> ${appointment.date}</p>
                            <p class="form-control"><strong>Start Time:</strong> ${appointment.startTime}</p>
                            <p class="form-control"><strong>End Time:</strong> ${appointment.endTime}</p>
                            <p class="form-control"><strong>Employee Name:</strong> ${appointment.getEmployeeName(appointment.employeeId)}</p>
                            <p class="form-control ${appointment.status == 'Pending' ? 'text-black' 
                                                     : appointment.status == 'Approved' ? 
                                                     'text-success' : appointment.status == 'Canceled' ? 'text-danger' : ''}">
                                <strong>Status: ${appointment.status}</strong>  </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <p class="form-control"><strong>Patient Name:</strong> ${appointment.getPatientName(appointment.patientId)}</p>
                            <p class="form-control"><strong>Patient Age:</strong> ${patientAge}</p>
                            <p class="form-control"><strong>Service:</strong> ${appointment.getServiceName(appointment.serviceId)} / <strong>Cost: </strong> ${appointment.getServiceCost(appointment.serviceId)} USD</p>
                            <p class="form-control"><strong>Tooth Number:</strong> ${appointment.tooth_number}</p>
                        </div>
                    </div>

                    <div>
                        ==============================================================================================================================================
                    </div>
                    <c:if test="${appointment.status eq 'Approved' }">
                        <!--Examination Result View-->
                        <c:if test="${sessionScope.userLogged.roleId != 1}">
                            <h1>Detail of Examination Result</h1>
                            <c:if test="${appointment.getExamminationResultByAppointmentId(appointment.id) == null}">
                                <P>There's no Examination Result for this appointment.</P>
                                <br>
                                <button type="button" onclick="location.href = 'createexaminationresult?aid=${appointment.id}'" class="btn btn-secondary">Create new one</button>
                            </c:if>
                            <c:if test="${appointment.getExamminationResultByAppointmentId(appointment.id) != null}">

                                <label ><strong>Reason: </strong></label>
                                <textarea  rows="2"  class="form-control" readonly>${exammination_result.reason} </textarea>
                                <label><strong>Note:</strong></label>
                                <textarea  rows="10" class="form-select bg-light border-0" readonly>${exammination_result.note} </textarea>
                                <c:if test="${sessionScope.userLogged.roleId == 2}">
                                    <button type="button" onclick="location.href = 'updateexaminationresult?aid=${appointment.id}'" class="btn btn-secondary">Update Examination Result</button>
                                </c:if>
                                
                            </c:if>
                            <div>
                                ==============================================================================================================================================
                            </div>
                        </c:if>

                        <c:if test="${appointment.getExamminationResultByAppointmentId(appointment.id) != null}">
                            <!--Prescription View-->
                            <c:if test="${sessionScope.userLogged.roleId == 3 || sessionScope.userLogged.roleId == 2}">
                                <h1>Detail of Prescription</h1>
                                <c:if test="${plist== null}">
                                    <c:if test="${sessionScope.userLogged.roleId == 3 or sessionScope.userLogged.roleId == 2}">
                                        <P>There's no Prescription for now.</P>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.userLogged.roleId == 2}">
                                    <button type="button" onclick="location.href = 'createprescription?aid=${appointment.id}'" class="btn btn-secondary">Create new one</button>
                                </c:if>
                                <c:if test="${plist!= null}">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Material Name</th>
                                                <th>Unit</th>
                                                <th>Amount</th>
                                                <th>Date</th>
                                                <th>Note</th>
                                                <th>Functions</th>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${plist}" var="x" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${x.materialName}</td>
                                                    <td>${x.unit}</td>
                                                    <td>${x.amount}</td>
                                                    <td>${x.date}</td>
                                                    <td>${x.note}</td>
                                                    <td>
                                                        <c:if test="${sessionScope.userLogged.roleId != 1}">
                                                            <button type="button" onclick="location.href = 'viewprescriptiondetail?pid=${x.id}'" class="btn btn-secondary">Detail</button>
                                                        </c:if>
                                                        <c:if test="${sessionScope.userLogged.roleId == 2}">
                                                            <button type="button" onclick="location.href = 'updateprescription?pid=${x.id}'" class="btn btn-secondary">Edit</button>
                                                             <button type="button" onclick="location.href = 'deleteprescription?pid=${x.id}'" class="btn btn-secondary">Delete</button>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </c:if>
                        </c:if>
                        <div>
                            ==============================================================================================================================================
                        </div> 
                    </c:if>

                    <c:if test="${sessionScope.userLogged.roleId == 3}">
                        <button type="button" onclick="location.href = 'viewappointmenthistory'" class="btn btn-secondary">Back</button>
                    </c:if>
                    <c:if test="${sessionScope.userLogged.roleId == 2}">
                        <button type="button" onclick="location.href = 'listappointmentofanemployee'" class="btn btn-secondary">Back</button>
                    </c:if>
                    <c:if test="${sessionScope.userLogged.roleId == 1}">
                        <button type="button" onclick="location.href = 'listappointment'" class="btn btn-primary me-md-2">Back</button>
                    </c:if>
                </div>
            </div>            
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</html>

