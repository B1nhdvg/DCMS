/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import DAO.auth.UserDAO;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * Servlet implementation class RegisterController
 */
//@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forward(request, response, "auth_register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO ud = new UserDAO();
        ArrayList<User> userlist = ud.getUserList();
        int id = Integer.parseInt(request.getParameter("idNumber"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        
        User user = new User(id, username, password, email, 3);
        
        if (ud.checkIdNumberExisted(id) != 0) {
            request.getSession().setAttribute("processMessage", "Register fail.");
            request.getSession().setAttribute("errorId", "The Id Number has already been registered!");
            forward(request, response, "auth_register.jsp");
            return;
        }
        
        if (ud.checkEmailExisted(email) != 0) {
            request.getSession().setAttribute("processMessage", "Register fail.");
            request.getSession().setAttribute("errorEmail", "The email has already been registered!");
            forward(request, response, "auth_register.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.getSession().setAttribute("processMessage", "Register fail.");
            request.getSession().setAttribute("errorPassword", "Confirm password does not match");
            forward(request, response, "auth_register.jsp");
            return;
        }

        if (ud.checkUsernameExisted(username) != 0) {
            request.getSession().setAttribute("processMessage", "Register fail.");
            request.getSession().setAttribute("errorUsername", "Username already exists!");
            forward(request, response, "auth_register.jsp");
            return;
        } 
            HttpSession session = request.getSession();
            session.setAttribute("userLogged", user); // Lưu đối tượng User trong session trước khi đăng ký
            ud.register(id, username, password, fullName, email, gender, address, phone, dob, "3");
            request.getSession().setAttribute("error", "Sign up successful!");
            response.sendRedirect("auth_login.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }

}
