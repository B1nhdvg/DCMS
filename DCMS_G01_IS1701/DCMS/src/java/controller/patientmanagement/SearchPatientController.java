/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patientmanagement;

import DAO.appointment.appointmentDAO;
import DAO.patient.PatientDAO;
import DAO.service.serviceDAO;
import entity.Service;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Acer
 */
public class SearchPatientController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PatientDAO pdb = new PatientDAO();
        String target = request.getParameter("search");
        List<User> list = pdb.searchPatient(target);
        PrintWriter out = response.getWriter();
        out.print(
                "<table class=\"table table-bordered\">\n"
                + "                    <thead>\n"
                + "                        <tr>\n"
                + "                            <th>Id</th>\n"
                + "                            <th>Username</th>\n"
                + "                            <th>Fullname</th>\n"
                + "                            <th>Email</th>\n"
                + "                            <th>Gender</th>\n"
                + "                            <th>Address</th>\n"
                + "                            <th>Phone</th>\n"
                + "                            <th>Dob</th>\n"
                + "                            <th>Edit</th>\n"
                + "                        </tr>\n"
                + "                    </thead>\n"
                + "                    <tbody>\n");
        for (User x : list) {
            out.print("<tr>\n"
                    + "                                    <td>" + x.getId() + "</td>\n"
                    + "                                    <td><a href=\"viewdetailemployee?eid=" + x.getId() + "\">" + x.getUsername() + "</a></td>\n"
                    + "                                    <td>" + x.getFullName() + "</td>\n"
                    + "                                    <td>" + x.getEmail() + "</td>\n"
                    + "                                    <td>" + x.getGender() + "</td>\n"
                    + "                                    <td>" + x.getAddress() + "</td>\n"
                    + "                                    <td>" + x.getPhone() + "</td>\n"
                    + "                                    <td>" + x.getDob() + "</td>\n"
                    + "                                    <td>\n"
                    + "                                        <!-- update button -->\n"
                    + "                                        <a href=\"updatepatient?sid=" + x.getId() + "\" class=\"btn btn-sm btn-primary\">Update</a>\n"
                    + "                                        <!-- delete button -->\n"
                    + "                                        <button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"showDeleteModal(" + x.getId() + ")\">Delete</button>\n"
                    + "                                    </td>\n"
                    + "                                </tr>");
        }
        
        
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
