
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dental Website</title>

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
        <script>
            // Function to display error message
            function displayErrorMessage(inputId, errorMessage) {
                var errorElement = document.getElementById(inputId + "Error");
                errorElement.innerHTML = errorMessage;
            }

            // Function to validate ID number
            function validateId() {
                var id = document.getElementById("id").value;
                var isValid = /^\d{9}$/.test(id);
                if (!isValid) {
                    displayErrorMessage("id", "ID Number should be a 9-digit number.");
                } else {
                    displayErrorMessage("id", "");
                }
            }

            // Function to validate username
            function validateUsername() {
                var username = document.getElementById("username").value;
                var isValid = /^[a-zA-Z0-9]+$/.test(username);
                if (!isValid) {
                    displayErrorMessage("username", "Username should only contain letters and numbers.");
                } else {
                    displayErrorMessage("username", "");
                }
            }

            // Function to validate password
            function validatePassword() {
                var password = document.getElementById("password").value;
                var isValid = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)^.{8,16}$/.test(password);
                if (!isValid) {
                    displayErrorMessage("password", "Password should contain at least one digit, lowercase letter, uppercase letter, and special character, and be between 8 and 16 characters long.");
                } else {
                    displayErrorMessage("password", "");
                }
            }

            // Function to validate fullname
            function validateFullName() {
                var fullName = document.getElementById("fullName").value;
                var isValid = /^[\p{L} ]+$/u.test(fullName);
                if (!isValid) {
                    displayErrorMessage("fullName", "Fullname should only contain letters.");
                } else {
                    displayErrorMessage("fullName", "");
                }
            }

            // Function to validate email
            function validateEmail() {
                var email = document.getElementById("email").value;
                var isValid = /\S+@\S+\.\S+/.test(email);
                if (!isValid) {
                    displayErrorMessage("email", "Invalid email format.");
                } else {
                    displayErrorMessage("email", "");
                }
            }

            // Function to validate address
            function validateAddress() {
                var address = document.getElementById("address").value;
                var isValid = /^[\p{L}0-9, ]+$/u.test(address);
                if (!isValid) {
                    displayErrorMessage("address", "Address can only contain letters, numbers, commas, and spaces.");
                } else {
                    displayErrorMessage("address", "");
                }
            }

            // Function to validate phone
            function validatePhone() {
                var phone = document.getElementById("phone").value;
                var isValid = /^\d{7,10}$/.test(phone);
                if (!isValid) {
                    displayErrorMessage("phone", "Phone should be a number between 7 and 10 digits.");
                } else {
                    displayErrorMessage("phone", "");
                }
            }

            // Function to validate dob
            function validateDOB() {
                var dob = document.getElementById("dob").value;
                var currentDate = new Date();
                var selectedDate = new Date(dob);
                var minAgeDate = new Date();
                minAgeDate.setFullYear(currentDate.getFullYear() - 18);

                if (selectedDate > minAgeDate) {
                    displayErrorMessage("dob", "You must be at least 18 years old.");
                } else {
                    displayErrorMessage("dob", "");
                }
            }
        </script>
    </head>

    <body>
        <%@include file="Navbar.jsp" %>
        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-primary p-3"
                                   placeholder="Type search keyword">
                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- bang add thong tin user // Start -->
        <div class="container mt-5">
            <h1 class="mb-4">Add Employee</h1>
            <form action="addemployee" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id"><strong>Identification Number</strong></label>
                            <div class="position-relative">
                                <input type="text" id="id" name="id" class="form-control" maxlength="9" required
                                       onblur="validateId()">
                                <span id="idError" class="error-message position-absolute"></span>
                                
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="username"><strong>Username</strong></label>
                            <div class="position-relative">
                                <input type="text" id="username" name="username" class="form-control" maxlength="20" required
                                       onblur="validateUsername()">
                                <span id="usernameError" class="error-message position-absolute"></span>
                                
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="password"><strong>Password</strong></label>
                            <div class="position-relative">
                                <input type="password" id="password" name="password" class="form-control" maxlength="20" required
                                       onblur="validatePassword()">
                                <span id="passwordError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="fullName"><strong>Fullname</strong></label>
                            <div class="position-relative">
                                <input type="text" id="fullName" name="fullName" class="form-control" maxlength="20" required
                                       onblur="validateFullName()">
                                <span id="fullNameError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="gender"><strong>Gender</strong></label>
                            <div class="form-check">
                                <input type="radio" id="male" name="gender" value="true" class="form-check-input" required>
                                <label for="male" class="form-check-label">Male</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" id="female" name="gender" value="false" class="form-check-input" required>
                                <label for="female" class="form-check-label">Female</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="email"><strong>Email</strong></label>
                            <div class="position-relative">
                                <input type="email" id="email" name="email" class="form-control" required
                                       onblur="validateEmail()">
                                <span id="emailError" class="error-message position-absolute"></span>
                                
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address"><strong>Address</strong></label>
                            <div class="position-relative">
                                <input type="text" id="address" name="address" class="form-control" maxlength="50" required
                                       onblur="validateAddress()">
                                <span id="addressError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone"><strong>Phone</strong></label>
                            <div class="position-relative">
                                <input type="text" id="phone" name="phone" class="form-control" maxlength="10" required
                                       onblur="validatePhone()">
                                <span id="phoneError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="dob"><strong>Date of Birth</strong></label>
                            <div class="position-relative">
                                <input type="date" name="dob" id="dob" class="form-control" required
                                       onblur="validateDOB()">
                                <span id="dobError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                    </div>
                </div>
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
                                    Do you want to create this employee?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" onclick="location.href = 'pagingemployee'" class="btn btn-secondary">Back</button>
                </div>
            </form>

        </div>

    </body>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
