<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">

        <title>Update Appointment</title>
        <style>

            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
                left: 0;
                bottom: -20px;
            }
            .success-message {
                color: green;
                font-size: 14px;
                margin-top: 10px;
            }

        </style>
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
                }, 4000); // 4000 milliseconds = 4 seconds
            </script>
        </c:if>
        <c:if test="${not empty successCancelMessage}">
            <div id="successCancelMessage" class="alert alert-success" role="alert">
                ${successCancelMessage}
            </div>
            <script>
                setTimeout(function () {
                    var successCancelMessage = document.getElementById('successCancelMessage');
                    successCancelMessage.style.display = 'none';
                }, 4000); // 4000 milliseconds = 4 seconds
            </script>
        </c:if>

        <div class="container mt-5">
            <h1 class="mb-4">Update Appointment</h1>
            <form action="updateappointment" method="post" onsubmit="return validateForm()">
                <c:if test="${sessionScope.userLogged.roleId == 2 and st.status eq 'Pending' == true or  
                              sessionScope.userLogged.roleId == 3 and st.status eq 'Canceled' == true or 
                              sessionScope.userLogged.roleId == 3 and st.status eq 'Approved' == true or 
                              sessionScope.userLogged.roleId == 2 and st.status eq 'Canceled' == true }">
                      <div class="row">
                          <div class="col-md-6">
                              <div class="mb-3">
                              </div>
                              <div class="mb-3">
                                  <label for="patient_id"><strong>Patient</strong></label>
                                  <div value="${st.patientId}"name="patient_id" class="form-control"> ${patientName} </div>
                              </div>
                              <div class="mb-3">
                                  <label for="date"><strong>Date</strong></label>
                                  <div "name="date" class="form-control"> ${st.date} </div>
                              </div>
                              <div class="mb-3">
                                  <label for="start_time"><strong>Start Time</strong></label>
                                  <div "name="start_time" class="form-control"> ${st.startTime}</div>
                              </div>

                              <div class="mb-3">
                                  <label for="end_time"><strong>End Time</strong></label>
                                  <div "name="end_time" class="form-control"> ${st.endTime}</div>
                              </div>

                              <div class="mb-3">
                                  <label for="tooth_number"><strong>Tooth Number</strong></label>
                                  <div "name="end_time" class="form-control"> ${st.tooth_number}</div>
                              </div>
                          </div>
                          <div class="col-md-6">
                              <div class="mb-3">

                              </div>
                              <div class="mb-3">
                                  <label for="employee_id"><strong>Employee</strong></label>

                                  <div class="form-select bg-light border-0" style="height: 55px;" name="employee_id">${st.getEmployeeName(st.employeeId)}</div>
                              </div>


                              <div class="mb-3">
                                  <label for="service_id"><strong>Service</strong></label>
                                  <div class="form-select bg-light border-0" style="height: 55px;" name="service_id">${st.getServiceName(st.serviceId)}</div>
                              </div>
                              <div class="mb-3">
                                  <div  style="height: 55px; color:
                                        ${st.status eq 'Pending' ? 'gray' : 
                                          st.status eq 'Canceled' ? 'red' :
                                          st.status eq 'Approved' ? 'green' : ''}"> 
                                      <strong>Status: ${st.status}</strong> 
                                  </div>
                              </div>
                          </div>
                          <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                              <c:if test="${sessionScope.userLogged.roleId == 2}">
                                  <button type="button" onclick="location.href = 'listappointmentofanemployee'" class="btn btn-secondary">Back</button>
                              </c:if>
                              <c:if test="${sessionScope.userLogged.roleId == 3}">
                                  <button type="button" onclick="location.href = 'viewappointmenthistory'" class="btn btn-secondary">Back</button>
                              </c:if>
                          </div>
                      </c:if>
                      <c:if test="${st.status eq 'Pending'== true and sessionScope.userLogged.roleId == 3 
                                    or sessionScope.userLogged.roleId == 1 or sessionScope.userLogged.roleId == 2 
                                    and st.status eq 'Approved' == true}">
                          <div class="row">
                              <div class="col-md-6">
                                  <div class="mb-3">
                                      <input value="${st.id}" type="text" name="id" class="form-control" readonly="readonly" hidden>
                                  </div>

                                  <div class="mb-3">
                                      <label for="patient_id"><strong>Patient</strong></label>
                                      <div value="${st.patientId}"name="patient_id" class="form-control"> ${patientName} </div>
                                      <input value="${st.patientId}" type="text" name="patient_id"  hidden> 
                                  </div>
                                  <div class="mb-3">
                                      <label for="date"><strong>Date</strong></label>
                                      <input value="${st.date}" type="date" name="date" class="form-control" required onblur="validateForm()">
                                      <span style="color: red" id="dateError" class="error-message"></span>
                                  </div>
                                  <div class="mb-3">
                                      <label for="start_time"><strong>Start Time</strong></label>
                                      <input value="${st.startTime}" type="time" name="start_time" class="form-control" required onblur="validateForm()">
                                      <span style="color: red" id="timeError" class="error-message"></span>
                                  </div>

                                  <div class="mb-3">
                                      <label for="end_time"><strong>End Time</strong></label>
                                      <input value="${st.endTime}" type="time" name="end_time" class="form-control" required onblur="validateForm()" />
                                      <span style="color: red" id="endTimeError" class="error-message"></span>
                                  </div>

                                  <div class="mb-3">
                                      <label for="tooth_number"><strong>Tooth Number</strong></label>
                                      <input value="${st.tooth_number}" type="text" name="tooth_number" id="tooth_number_input" class="form-control" required onblur="validateForm()" />
                                      <span style="color: red" id="toothNumberError" class="error-message"></span>
                                  </div>
                              </div>
                              <div class="col-md-6">
                                  <div class="mb-3">

                                  </div>
                                  <c:if test="${sessionScope.userLogged.roleId == 1}">
                                      <div class="mb-3">
                                          <label for="employee_id"><strong>Employee</strong></label>
                                          <select class="form-select bg-light border-0" style="height: 55px;" name="employee_id">
                                              <c:forEach items="${listemployee}" var="employee">
                                                  <option value="${employee.id}" ${st.employeeId eq employee.id ? "selected":""}>${employee.fullName}</option>
                                              </c:forEach>
                                          </select>
                                      </div>
                                  </c:if>

                                  <div class="mb-3">
                                      <label for="service_id"><strong>Service</strong></label>
                                      <select class="form-select bg-light border-0" style="height: 55px;" name="service_id">
                                          <c:forEach items="${listservice}" var="service">
                                              <option value="${service.id}" ${st.serviceId eq service.id ? "selected":""}>${service.name}</option>
                                          </c:forEach>
                                      </select>
                                  </div>
                                  <c:if test="${sessionScope.userLogged.roleId == 1}">
                                      <div class="mb-3">
                                          <label for="ap_status"><strong>Status</strong></label>

                                          <div class="form-check">
                                              <input type="radio" name="ap_status" value="Approved" class="form-check-input" ${st.status eq "Approved"?'checked':''}>
                                              <label style="color: green" for="Approved" class="form-check-label"><strong>Approve</strong></label>
                                          </div>

                                          <div class="form-check">
                                              <input type="radio" name="ap_status" value="Pending" class="form-check-input"  ${st.status eq "Pending"?'checked':''}>
                                              <label style="color: black" for="Pending" class="form-check-label"><strong>Pending</strong></label>
                                          </div>
                                          <div class="form-check">
                                              <input type="radio" name="ap_status" value="Canceled" class="form-check-input"  ${st.status eq "Canceled"?'checked':''}>
                                              <label style="color: red" for="Cancel" class="form-check-label"><strong>Cancel</strong></label>
                                          </div>
                                      </div>
                                  </c:if>
                                  <c:if test="${sessionScope.userLogged.roleId == 3}">
                                      <label>  <strong>Status: </strong></label>
                                      <input value="${st.status}" type="text" name="ap_status" readonly />
                                  </c:if>
                              </div>
                              <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                  <button type="submit" class="btn btn-primary me-md-2">Update</button>
                                  <c:if test="${sessionScope.userLogged.roleId == 3}">
                                      <button type="button" class="btn btn-sm btn-danger" onclick="showDeleteModal(${st.id})">Cancel Booking</button>
                                      <!-- Delete Confirmation Modal -->
                                      <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                  <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Cancel Booking Confirmation</h5>
                                                  </div>
                                                  <div class="modal-body">
                                                      Are you sure you want to Cancel this Booking?
                                                  </div>
                                                  <div class="modal-footer">
                                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                      <button type="button" class="btn btn-danger" onclick="cancelAppointment()">Confirm</button>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                  </c:if>
                                  <c:if test="${sessionScope.userLogged.roleId == 1}">
                                      <button type="button" onclick="location.href = 'listappointment'" class="btn btn-secondary">Back</button>
                                  </c:if>
                                  <c:if test="${sessionScope.userLogged.roleId == 2}">
                                      <button type="button" onclick="location.href = 'listappointmentofanemployee'" class="btn btn-secondary">Back</button>
                                  </c:if>
                                  <c:if test="${sessionScope.userLogged.roleId == 3}">
                                      <button type="button" onclick="location.href = 'viewappointmenthistory'" class="btn btn-secondary">Back</button>
                                  </c:if>
                              </div>
                          </div>
                      </c:if>

                </div>
            </form>
        </div>
    </body>
    <script>
        var appointmentIdToCancel = null;

        function showDeleteModal(appointmentId) {
            appointmentIdToCancel = appointmentId;
            $('#deleteModal').modal('show');
        }

        function cancelAppointment() {
            if (appointmentIdToCancel) {
                window.location.href = 'cancelappointment?sid=' + appointmentIdToCancel;
            }
        }
        function validateForm() {
            var appointmentDate = document.getElementsByName("date")[0].value;
            var currentDate = new Date().toISOString().split("T")[0];
            var dateError = document.getElementById("dateError");

            var startTime = document.getElementsByName("start_time")[0].value;
            var endTime = document.getElementsByName("end_time")[0].value;
            var endTimeError = document.getElementById("endTimeError");

            var toothNumber = parseInt(document.getElementById("tooth_number_input").value);
            var toothNumberError = document.getElementById("toothNumberError");

            var timeError = document.getElementById("timeError");

            var startHour = parseInt(startTime.split(":")[0]);
            var endHour = parseInt(endTime.split(":")[0]);
            var successMessage = document.getElementById("successMessage");

            if (successMessage) {
                successMessage.style.display = "none";
            }

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
                dateError.className = "error-message";
                isValid = false;
            } else {
                dateError.innerText = "";
                dateError.className = "";
            }

            if (startTime >= endTime) {
                endTimeError.innerText = "End time must be after start time.";
                endTimeError.className = "error-message";
                isValid = false;
            } else {
                endTimeError.innerText = "";
                endTimeError.className = "";
            }

            if (isNaN(toothNumber) || toothNumber < 1 || toothNumber > 32) {
                toothNumberError.innerText = "Please enter a tooth number between 1 and 32.";
                toothNumberError.className = "error-message";
                isValid = false;
            } else {
                toothNumberError.innerText = "";
                toothNumberError.className = "";
            }

            if (startHour < 6 || startHour > 22 || endHour < 6 || endHour > 22) {
                timeError.innerText = "Please select a time between 6 AM and 10 PM.";
                timeError.className = "error-message";
                isValid = false;
            } else {
                timeError.innerText = "";
                timeError.className = "";
            }
            if (isValid) {
                successMessage.style.display = "block";
            }

            return isValid;
        }
    </script>
</html>
