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
            .success-message {
                color: green;
                font-size: 14px;
                margin-top: 10px;
            }

        </style>
        <script>
            // Validate the form on submit
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var fullName = document.getElementById("fullName").value;
                var email = document.getElementById("email").value;
                var address = document.getElementById("address").value;
                var phone = document.getElementById("phone").value;
                var dob = document.getElementById("dob").value;
                var successMessage = document.getElementById("successMessage");
                var isValid = true;

                if (successMessage) {
                    successMessage.style.display = "none";
                }
                // Validate username
                if (!/^[a-zA-Z0-9]+$/.test(username)) {
                    document.getElementById("usernameError").innerHTML = "Username should only contain letters and numbers";
                    isValid = false;
                } else {
                    document.getElementById("usernameError").innerHTML = "";
                }
                // Validate password
                if (!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)^.{8,16}$/.test(password)) {
                    document.getElementById("passwordError").innerHTML = "Password should have from 8 to 16 characters, at least one uppercase, one digit, and one special character";
                    isValid = false;
                } else {
                    document.getElementById("passwordError").innerHTML = "";
                }
                // Validate fullName
                if (!/^[\p{L} ]+$/u.test(fullName)) {
                    document.getElementById("fullNameError").innerHTML = "Fullname should be letters";
                    isValid = false;
                } else {
                    document.getElementById("fullNameError").innerHTML = "";
                }

                // Validate email
                if (!/\S+@\S+\.\S+/.test(email)) {
                    document.getElementById("emailError").innerHTML = "Invalid email format";
                    isValid = false;
                } else {
                    document.getElementById("emailError").innerHTML = "";
                }

                // Validate address
                if (!/^[\p{L}0-9, ]+$/u.test(address)) {
                    document.getElementById("addressError").innerHTML = "Address too long";
                    isValid = false;
                } else {
                    document.getElementById("addressError").innerHTML = "";
                }

                // Validate phone
                if (!/^\d{7,11}$/.test(phone)) {
                    document.getElementById("phoneError").innerHTML = "Phone should be numbers";
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
                    document.getElementById("dobError").innerHTML = "at least 18 years old";
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
            <h1 class="mb-4">Update Employee</h1>
            <form action="updateemployee" method="post" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id"><strong>Identification Number</strong></label>
                            <input value="${st.id}" type="text" id="id" name="id" class="form-control" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="username"><strong>Username</strong></label>
                            <div class="position-relative">
                                <input value="${st.username}" type="text" id="username" name="username" class="form-control" maxlength="20">
                                <span id="usernameError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="password"><strong>Password</strong></label>
                            <div class="position-relative">
                                <input value="${st.password}" type="text" id="password" name="password" class="form-control" maxlength="20">
                                <span id="passwordError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="fullName"><strong>Fullname</strong></label>
                            <div class="position-relative">
                                <input value="${st.fullName}" type="text" id="fullName" name="fullName" class="form-control" maxlength="20">
                                <span id="fullNameError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="email"><strong>Email</strong></label>
                            <div class="position-relative">
                                <input value="${st.email}" type="email" id="email" name="email" class="form-control" readonly>
                                <span id="emailError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address"><strong>Address</strong></label>
                            <div class="position-relative">
                                <input value="${st.address}" type="text" id="address" name="address" class="form-control" maxlength="50">
                                <span id="addressError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone"><strong>Phone</strong></label>
                            <div class="position-relative">
                                <input value="${st.phone}" type="text" id="phone" name="phone" class="form-control" maxlength="10">
                                <span id="phoneError" class="error-message position-absolute"></span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="dob"><strong>Date of Birth</strong></label>
                            <div class="position-relative">
                                <input value="${st.dob}" type="date" id="dob" name="dob" class="form-control">
                                <span id="dobError" class="error-message position-absolute"></span>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="gender"><strong>Gender</strong></label>
                        <div class="form-check">
                            <input type="radio" id="male" name="gender" value="True" class="form-check-input" ${st.getGender() eq "Male" ? "checked" : ""}>
                            <label for="male" class="form-check-label">Male</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" id="female" name="gender" value="False" class="form-check-input" ${st.getGender() eq "Female" ? "checked" : ""}>
                            <label for="female" class="form-check-label">Female</label>
                        </div>
                    </div>
                </div>


                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="submit" class="btn btn-primary me-md-2">Update</button>
                    <button type="button" onclick="location.href = 'pagingemployee'" class="btn btn-secondary">Back</button>
                </div>
            </form>
        </div>


    </body>
</html>
