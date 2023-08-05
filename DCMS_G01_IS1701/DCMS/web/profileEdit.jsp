<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile | Dental Website</title>

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
            .success-message {
                color: green;
                font-size: 14px;
                margin-top: 10px;
            }
        </style>

        <script>
            // Validate the form on submit
            function validateForm() {
                var fullname = document.getElementById("fullname").value;
                var address = document.getElementById("address").value;
                var phone = document.getElementById("phone").value;
                var dob = document.getElementById("dob").value;

                var isValid = true;

                // Validate fullName
                if (!/^[\p{L} ]+$/u.test(fullname)) {
                    document.getElementById("fullnameError").innerHTML = "Fullname should be in Vietnamese format";
                    isValid = false;
                } else {
                    document.getElementById("fullnameError").innerHTML = "";
                }

                // Validate address
                if (!/^[\p{L}0-9, ]+$/u.test(address)) {
                    document.getElementById("addressError").innerHTML = "Address should be in Vietnamese format";
                    isValid = false;
                } else {
                    document.getElementById("addressError").innerHTML = "";
                }

                // Validate phone
                if (!/^\d{7,11}$/.test(phone)) {
                    document.getElementById("phoneError").innerHTML = "Phone should be a number with 7 to 11 digits";
                    isValid = false;
                } else {
                    document.getElementById("phoneError").innerHTML = "";
                }

                // Validate dob
                var currentDate = new Date();
                var selectedDate = new Date(dob);
                var minAgeDate = new Date();
                minAgeDate.setFullYear(currentDate.getFullYear() - 18);

                if (selectedDate > minAgeDate) {
                    document.getElementById("dobError").innerHTML = "You must be at least 18 years old";
                    isValid = false;
                } else {
                    document.getElementById("dobError").innerHTML = "";
                }

                return isValid;
            }
        </script>
    </head>

    <body>



        <jsp:include page="Navbar.jsp" />


        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->
        <!-- Add this code at the top of the page to display the success message -->
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
            <h1 class="mb-4">Edit Profile</h1>
            <form action="profileedit" method="post" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id">ID Number</label>
                            <input value="${ep.id}" type="text" id="id" name="id" class="form-control" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="fullname">Full Name</label>
                            <div class="position-relative">
                                <input value="${ep.fullName}" type="text" id="fullname" name="fullname" class="form-control" maxlength="20">
                                <span id="fullnameError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email</label>
                            <input value="${ep.email}" type="email" id="email" name="email" class="form-control" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="gender">Gender</label>
                            <div class="form-check">
                                <input type="radio" id="male" name="gender" value="True" class="form-check-input" ${ep.getGender() == "Male" ? "checked" : ""}>
                                <label for="male" class="form-check-label">Male</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" id="female" name="gender" value="False" class="form-check-input" ${ep.getGender() == "Female" ? "checked" : ""}>
                                <label for="female" class="form-check-label">Female</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="address">Address</label>
                            <div class="position-relative">
                                <input value="${ep.address}" type="text" id="address" name="address" class="form-control" maxlength="50">
                                <span id="addressError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="phone">Phone</label>
                            <div class="position-relative">
                                <input value="${ep.phone}" type="text" id="phone" name="phone" class="form-control" maxlength="10">
                                <span id="phoneError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="dob">Date of Birth</label>
                            <div class="position-relative">
                                <input value="${ep.dob}" type="date" id="dob" name="dob" class="form-control">
                                <span id="dobError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="submit" class="btn btn-primary me-md-2">Update</button>
                    <button type="button" onclick="location.href = 'viewprofile'" class="btn btn-secondary">Back</button>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
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

</html>
