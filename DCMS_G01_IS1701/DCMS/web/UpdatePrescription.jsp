<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Prescription</title>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <style>

            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
                left: 0;
                bottom: -20px;
            }
        </style>

    </head>

    <body>

        <jsp:include page="Navbar.jsp"/>
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
        <!-- bang add thong tin user // Start -->
        <div class="container mt-5">
            <h1 class="mb-4">Edit prescription</h1>
            <form method="post" onsubmit="return validateForm()" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="materialName">Material Name</label>
                            <div class="position-relative">
                                <input type="text" id="materialName" name="materialName" value="${prescription.materialName}" class="form-control"  required required maxthlenth="20">


                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="date">Date of Prescription</label>
                            <div class="position-relative">
                                <input type="date" name="date" value="${prescription.date}" id="date" class="form-control" required onblur="validateDate()">
                                <span id="dateError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="note">Note</label>
                            <div class="position-relative">
                                <input type="text" id="note" name="note" value="${prescription.note}" class="form-control" required maxlength="50">
                                <span id="noteError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="unit">Unit</label>
                            <div class="position-relative">
                                <input type="text" id="unit" name="unit" value="${prescription.unit}" class="form-control" required maxthlenth="10" >
                                <span id="unitError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="amount">Amount</label>
                            <div class="position-relative">
                                <input type="number" id="amount" name="amount" value="${prescription.amount}" class="form-control" required onblur="validateAmount()" >
                                <span id="amountError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="button"  class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">Save</button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Notification</h5>

                                </div> 
                                <div class="modal-body">
                                    Save and change this Prescription?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary" onclick="location.href = 'updateprescription?pid=${prescription.id}'">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" onclick="location.href = 'detailappointment?aid=${examination_result.apId}'" class="btn btn-secondary">Back</button>
                </div>
            </form>
        </div>

    </body>
    <script>
        function validateDate() {
            var dateInput = document.getElementById("date");
            var currentDate = new Date().toISOString().split('T')[0];

            if (dateInput.value < currentDate) {
                showErrorMessage(dateInput, "Date must be current date or in the future.");
                return false;
            } else {
                hideErrorMessage(dateInput);
                return true;
            }
        }

        function validateAmount() {
            var amountInput = document.getElementById("amount");
            var amount = parseInt(amountInput.value);

            if (amount <= 1 || amount >= 10) {
                showErrorMessage(amountInput, "Amount must be greater than 1 and less than 10.");
                return false;
            } else {
                hideErrorMessage(amountInput);
                return true;
            }
        }

        function showErrorMessage(inputElement, message) {
            var errorSpan = inputElement.nextElementSibling;
            errorSpan.innerText = message;
            inputElement.classList.add("is-invalid");
        }

        function hideErrorMessage(inputElement) {
            var errorSpan = inputElement.nextElementSibling;
            errorSpan.innerText = "";
            inputElement.classList.remove("is-invalid");
        }

        function validateForm() {
            var isDateValid = validateDate();
            var isAmountValid = validateAmount();
            return isDateValid && isAmountValid;
        }
    </script>
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
