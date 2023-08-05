<%-- 
    Document   : login
    Created on : May 29, 2023, 4:36:19 PM
    Author     : nmcbo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login Page in HTML with CSS Code Example</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"><link rel="stylesheet" href="./login_style.css">
        <link href="css\login_style.css" rel="stylesheet">
    </head>
    <body>
        <!-- partial:index.partial.html -->


        <div class="box-form">
            <div class="left">
                <div class="overlay">
                    <h1>Wu Hai Ruan Dental Clinic</h1>
                    <span>
                    </span>
                </div>
            </div>

            <!-- login.jsp -->


            <form class="right" action="login" method="post">
                <h5>Login</h5>
                <p>Don't have an account? <a href="register">Create Your Account</a> it takes less than a minute</p>
                <div class="inputs">
                    <input type="text" name="username" placeholder="username">
                    <br>
                    <input type="password" name="password" placeholder="password">
                </div>		
                <br><br>
                <div>
                    <a href="forgot">Forget password?</a>
                </div>

                <%-- Check login status and display message --%>
                <c:if test="${param.login == 'failed'}">
                    <p>Login failed. Please try again.</p>
                </c:if>                
                <br>
                <button type="submit">Login</button>
            </form>

        </div>
        <!-- partial -->

    </body>
</html>

