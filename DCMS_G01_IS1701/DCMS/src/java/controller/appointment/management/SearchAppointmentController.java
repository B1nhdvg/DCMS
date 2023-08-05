/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.appointment.management;

import DAO.appointment.appointmentDAO;
import entity.Appointment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import utils.Validator;

/**
 *
 * @author Acer
 */
public class SearchAppointmentController extends HttpServlet {

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
        appointmentDAO adb = new appointmentDAO();
        String target = request.getParameter("search");
        //Validator valid = new Validator();
        //Date date = valid.dateFormat(target);
        ArrayList<Appointment> list = adb.searchAppointment(target);
        PrintWriter out = response.getWriter();
        out.print(
                "<thead>\n"
                + "                    <tr>\n"
                + "                        <th>No</th>\n"
                + "                        <th>Date</th>\n"
                + "                        <th>Start time</th>\n"
                + "                        <th>Employee</th>       \n"
                + "                        <th>Patient</th>\n"
                + "                        <th>Service</th>\n"
                + "                        <th>Status</th>\n"
                + "                        <th>Functions</th>\n"
                + "                    </tr>\n"
                + "                </thead>");
        for (Appointment a : list) {
            out.print("<tr>\n"
                    + "                            <td>" + a.getId() + "</td>\n"
                    + "                            <td>" + a.getDate() + "</td>\n"
                    + "                            <td>" + a.getStartTime() + "</td>\n"
                    + "                            <td>" + a.getEmployeeName(a.getEmployeeId()) + "</td>\n"
                    + "                            <td>" + a.getPatientName(a.getPatientId()) + "</td>\n"
                    + "                            <td>" + a.getServiceName(a.getServiceId()) + "</td>\n"
                    + "                            <td>" + a.getStatus() + "</td>\n"
                    + "                                <td>\n"
                    + "                                     <a href=\"detailappointment?aid=" + a.getId() + "\" class=\"btn btn-sm btn-warning\">Detail</a>\n"
                    + "                                    <a href=\"updateappointment?sid=" + a.getId() + "\" class=\"btn btn-sm btn-primary\">Update</a>\n"
                    + "                                    <a href=\"#\" onclick=\"showMessCancel(" + a.getId() + ")\" class=\"btn btn-sm btn-danger\">Cancel</a>                          \n"
                    + "                                </td>\n"
                    + "                            </tr>");
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
