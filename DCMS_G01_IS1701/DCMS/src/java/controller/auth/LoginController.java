/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import DAO.auth.UserDAO;
import DAO.employee.EmployeeDAO;
import DAO.patient.PatientDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * author Nguye
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("auth_login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserAccount(username, password);
        HttpSession session = request.getSession();

        if (user != null) {
            session.setAttribute("userLogged", user);
            if (user.getRoleId() == 1) {
                session.setAttribute("Logged", user);
                session.setAttribute("userName", "admin");
                // Redirect to admin home page
                response.sendRedirect("home?login=success");
            } else if (user.getRoleId() == 2) {
                session.setAttribute("Logged", user);
                session.setAttribute("userName", user.getFullName());
                // Redirect to doctor home page
                response.sendRedirect("home?login=success");
            } else if (user.getRoleId() == 3) {
                session.setAttribute("Logged", user);
                session.setAttribute("userName", user.getFullName());
                // Redirect to patient home page
                response.sendRedirect("home?login=success");
            } else {
                // Invalid role
                response.sendRedirect("auth_login.jsp?login=failed");
            }
        } else {
            // Invalid username or password
            response.sendRedirect("login?login=failed");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
