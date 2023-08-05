<!DOCTYPE html>
<html>
    <head>
        <title>Examination Result Form</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
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
    <div class="container mt-5">
        <h1 class="mb-4">Update Examination Result Form</h1>
        <form action="updateexaminationresult" method="post" >
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <input value="${examminationResult.id}" name="eid" type="text" name="appointmentId" class="form-control" readonly="readonly" hidden >
                        <input value="${appointment.id}" type="text" name="appointmentId" class="form-control" readonly="readonly" hidden >
                    </div>
                    <div class="mb-3">
                        <label for="patient_id"><strong>Patient</strong></label>
                        <div "name="patient_id" class="form-control"> ${appointment.getPatientName(appointment.patientId)}</div>
                    </div>
                    <div class="mb-3">
                        <label for="date"><strong>Date</strong></label>
                        <div "name="date" class="form-control"> ${appointment.date} </div>
                    </div>
                    <div class="mb-3">
                        <label for="start_time"><strong>Start Time</strong></label>
                        <div "name="start_time" class="form-control"> ${appointment.startTime}</div>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="mb-3">

                    </div>
                    <div class="mb-3">
                        <label for="employee_id"><strong>Employee</strong></label>

                        <div class="form-control"  name="employee_id">${appointment.getEmployeeName(appointment.employeeId)}</div>
                    </div>
                    <div class="mb-3">
                        <label for="service_id"><strong>Service</strong></label>
                        <div class="form-control"  name="service_id">${appointment.getServiceName(appointment.serviceId)} </div>
                    </div>
                    <div class="mb-3">
                        <label for="tooth_number"><strong>Tooth Number</strong></label>
                        <div "name="end_time" class="form-control"> ${appointment.tooth_number}</div>
                    </div>

                </div>
                <div class="mb-3">
                    <label for="reason"><strong>Reason:</strong></label>
                    <textarea rows="2" type="input" name="reason" class="form-control" id="reason" maxlength="100">${examminationResult.reason}</textarea>
                    <label for="note"><strong>Note:</strong></label>
                    <textarea rows="10" type="input" name="note" class="form-select bg-light border-0" id="note" maxlength="500">${examminationResult.note}</textarea>
                </div>




                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="submit" class="btn btn-secondary">Save</button>
                    <button type="button" onclick="location.href = 'detailappointment?aid=${appointment.id}'" class="btn btn-secondary">Back</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>