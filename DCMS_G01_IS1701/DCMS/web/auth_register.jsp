<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>DCMS Registration Form</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                background: linear-gradient(135deg, #71b7e6, #9b59b6);
            }

            .container {
                max-width: 700px;
                width: 100%;
                background-color: #fff;
                padding: 25px 30px;
                border-radius: 5px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
            }

            .container .title {
                font-size: 25px;
                font-weight: 500;
                position: relative;
            }

            .container .title::before {
                content: "";
                position: absolute;
                left: 0;
                bottom: 0;
                height: 3px;
                width: 30px;
                border-radius: 5px;
                background: linear-gradient(135deg, #71b7e6, #9b59b6);
            }

            .content form .user-details {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin: 20px 0 12px 0;
            }

            form .user-details .input-box {
                margin-bottom: 15px;
                width: calc(100% / 2 - 20px);
            }

            form .input-box span.details {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .user-details .input-box input {
                height: 45px;
                width: 100%;
                outline: none;
                font-size: 16px;
                border-radius: 5px;
                padding-left: 15px;
                border: 1px solid #ccc;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }

            .user-details .input-box input:focus,
            .user-details .input-box input:valid {
                border-color: #9b59b6;
            }

            form .gender-details .gender-title {
                font-size: 20px;
                font-weight: 500;
            }

            form .category {
                display: flex;
                width: 80%;
                margin: 14px 0;
                justify-content: space-between;
            }

            form .category label {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            form .category label .dot {
                height: 18px;
                width: 18px;
                border-radius: 50%;
                margin-right: 10px;
                background: #d9d9d9;
                border: 5px solid transparent;
                transition: all 0.3s ease;
            }

            #dot-1:checked ~ .category label .one,
            #dot-2:checked ~ .category label .two,
            #dot-3:checked ~ .category label .three {
                background: #9b59b6;
                border-color: #d9d9d9;
            }

            form input[type="radio"] {
                display: none;
            }

            form .button {
                height: 45px;
                margin: 35px 0;
            }

            form .button input {
                height: 100%;
                width: 100%;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 18px;
                font-weight: 500;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: linear-gradient(135deg, #71b7e6, #9b59b6);
            }

            form .button input:hover {
                background: linear-gradient(-135deg, #71b7e6, #9b59b6);
            }

            @media (max-width: 584px) {
                .container {
                    max-width: 100%;
                }

                form .user-details .input-box {
                    margin-bottom: 15px;
                    width: 100%;
                }

                form .category {
                    width: 100%;
                }

                .content form .user-details {
                    max-height: 300px;
                    overflow-y: scroll;
                }

                .user-details::-webkit-scrollbar {
                    width: 5px;
                }
            }

            @media (max-width: 459px) {
                .container .content .category {
                    flex-direction: column;
                }

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
                    document.getElementById("passwordError").innerHTML = "Passwordshould have from 8 to 16 characters, at least one uppercase, one digit, and one special character";
                    isValid = false;
                } else {
                    document.getElementById("passwordError").innerHTML = "";
                }

                // Validate fullName
                if (!/^[\p{L} ]+$/u.test(fullName)) {
                    document.getElementById("fullNameError").innerHTML = "Fullname should only contain letters";
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
                    document.getElementById("addressError").innerHTML = "Address is too long";
                    isValid = false;
                } else {
                    document.getElementById("addressError").innerHTML = "";
                }

                // Validate phone
                if (!/^\d{7,11}$/.test(phone)) {
                    document.getElementById("phoneError").innerHTML = "Phone should only contain numbers";
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
        <div class="container">
            <div class="title">DCMS Registration</div>
            <div class="content">
                <form action="register" method="post" onsubmit="return validateForm()">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Username</span>
                            <input type="text" id="username" name="username" placeholder="Enter your username" required maxlength="20">
                            <span id="usernameError" class="error-message position-absolute"></span>
                            <div class="errorUsername">${sessionScope.errorUsername}</div>
                            <% request.getSession().removeAttribute("errorUsername"); %>
                        </div>
                        <div class="input-box">
                            <span class="details">ID number</span>
                            <input type="text" name="idNumber" placeholder="Enter your ID number" required maxlength="9">
                            <div class="errorId">${sessionScope.errorId}</div>
                            <% request.getSession().removeAttribute("errorId"); %>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" id="password" name="password" placeholder="Enter your password" required maxlength="16">
                            <span id="passwordError" class="error-message position-absolute"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required maxlength="16">
                            <div class="errorPassword">${sessionScope.errorPassword}</div>
                            <% request.getSession().removeAttribute("errorPassword"); %>
                        </div>
                        <div class="input-box">
                            <span class="details">Full Name</span>
                            <input type="text" id="fullName" name="fullName" placeholder="Enter your name" required maxlength="20">
                            <span id="fullNameError" class="error-message position-absolute"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="email" id="email" name="email" placeholder="Enter your email" required maxlength="30">
                            <span id="emailError" class="error-message position-absolute"></span>
                            <div class="errorEmail">${sessionScope.errorEmail}</div>
                            <% request.getSession().removeAttribute("errorEmail"); %>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required maxlength="11">
                            <span id="phoneError" class="error-message position-absolute"></span>
                        </div>

                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" id="address" name="address" placeholder="Enter your address" required maxlength="50">
                            <span id="addressError" class="error-message position-absolute"></span>
                        </div>

                        <div class="input-box">
                            <span class="details">DOB</span>
                            <input type="date" id="dob" name="dob" placeholder="Enter your birthday" required>
                            <span id="dobError" class="error-message position-absolute"></span>
                        </div>
                    </div>
                    <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1" value="1">
                        <input type="radio" name="gender" id="dot-2" value="0">
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label> 
                            </label>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                </form>
                <div class="process-message">${sessionScope.processMessage}</div>
                <% request.getSession().removeAttribute("processMessage"); %>



            </div>
        </div>
    </body>
</html>
