/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.appointment.management;

import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.Prescription.PrescriptionDAO;
import DAO.appointment.appointmentDAO;
import entity.Appointment;
import entity.ExamminationResult;
import entity.Prescription;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Nguye
 */
public class DetailAppointmentController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewDetailAppointmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewDetailAppointmentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //implement 3 DAOs:
        appointmentDAO adb = new appointmentDAO();
        ExamminationResultDAO er = new ExamminationResultDAO();
        PrescriptionDAO pre = new PrescriptionDAO();
        //get the chosen appointment id
        String id = request.getParameter("aid");
        //get 3 entities
        Appointment a = adb.getAppointmentByID(id);
        request.setAttribute("appointment", a);
        User patient = a.getPatient(a.getPatientId());
        LocalDate today = LocalDate.now();
        int patientAge = patient.calculateAge(patient.getDob(), today);
        request.setAttribute("patientAge", patientAge);
        ExamminationResult e = er.getExamminationResultByAppointmentID(id);
        request.setAttribute("exammination_result", e);
        if(e!=null){
            ArrayList<Prescription> p = pre.getPrescriptionsByExamminationResultID(e.getId());
            request.setAttribute("plist", p);
        }
        request.getRequestDispatcher("DetailAppointment.jsp").forward(request, response);
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
