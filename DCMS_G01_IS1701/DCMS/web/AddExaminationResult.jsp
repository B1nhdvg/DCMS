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
        <div class="container mt-5">
            <h1 class="mb-4">Examination Result Form</h1>
            <form action="createexaminationresult" method="post" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
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
                        <label for="tooth_number"><strong>Reason:</strong></label>
                        <textarea  rows="2" type="input" name="reason" class="form-control" id="reason" placeholder="Write Reason Here" maxlength="100" required></textarea>
                        <label for="tooth_number"><strong>Note:</strong></label>
                        <textarea  rows="10" type="input" name="note" class="form-select bg-light border-0" id="note"  placeholder="Write Note Here" maxlength="500" required> </textarea>
                    </div>



                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">Create</button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Notification</h5>
                                        </div>
                                        <div class="modal-body">
                                            Do you want to create this Examination Result?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" onclick="location.href = 'detailappointment?aid=${appointment.id}'" class="btn btn-secondary">Back</button>
                        </div>
                        
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>