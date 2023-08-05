<%-- 
    Document   : Security
    Created on : Sep 17, 2022, 10:05:17 PM
    Author     : fpt
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>Security</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        body {
            background-color: #f1f1f1;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 200px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #337ab7;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #337ab7;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            float: right;
        }

        input[type="submit"]:hover {
            background-color: #23527c;
        }

        a.cancel {
            display: inline-block;
            margin-top: 10px;
            color: #333;
            text-decoration: none;
            font-size: 14px;
        }

        div.process-message {
            margin-top: 10px;
        }

        div.error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>


    <jsp:include page="Navbar.jsp" />

    <div class="container">
        <h1>Change Password</h1>
        <form action="changepassword" method="POST">
            <div class="form-group">
                <label for="currentPassword">Current Password:</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <input type="submit" value="Change Password">
        </form>
        <a href="home" class="cancel">Cancel</a>
        <div class="process-message">${sessionScope.processMessage}</div>
        <% request.getSession().removeAttribute("processMessage"); %>
        <div class="error">${sessionScope.error}</div>
        <% request.getSession().removeAttribute("error"); %>
    </div>
</body>
</html>
