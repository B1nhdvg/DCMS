/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.prescription.management;

import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.Prescription.PrescriptionDAO;
import DAO.appointment.appointmentDAO;
import entity.Appointment;
import entity.ExamminationResult;
import entity.Prescription;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 *
 * @author nmcbo
 */
public class CreatePrescriptionController extends HttpServlet {

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
            out.println("<title>Servlet CreatePrescription</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePrescription at " + request.getContextPath() + "</h1>");
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
        String aid = request.getParameter("aid");
        ExamminationResultDAO er = new ExamminationResultDAO();
        ExamminationResult e = er.getExamminationResultByAppointmentID(aid);
        request.setAttribute("examination_result", e);
        request.getRequestDispatcher("AddPrescription.jsp").forward(request, response);
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
        PrescriptionDAO p = new PrescriptionDAO();
        String aid = request.getParameter("aid");
        int newtotal = p.getTotalNumberOfPrescriptions() + 1;
        String id = "pre" + newtotal;
        if (p.getPrescriptionsByID(id) == null) {
            String materialName = request.getParameter("materialName").trim();
            String unit = request.getParameter("unit").trim();
            int amount = Integer.parseInt(request.getParameter("amount").trim());
            String date = request.getParameter("date").trim();
            String note = request.getParameter("note").trim();
            ExamminationResultDAO er = new ExamminationResultDAO();
            ExamminationResult e = er.getExamminationResultByAppointmentID(aid);
            p.addPrescription(id, materialName, unit, amount, date, note, e.getId());
            response.sendRedirect("detailappointment?aid=" + URLEncoder.encode(aid, "UTF-8"));
        } else {
            Prescription lastpre = p.getLastPrescriptionsByID();
            String lastpreId = lastpre.getId();
            int intnewId = Integer.parseInt(lastpreId.substring(3)) + 1;

            String materialName = request.getParameter("materialName").trim();
            String unit = request.getParameter("unit").trim();
            int amount = Integer.parseInt(request.getParameter("amount").trim());
            String date = request.getParameter("date").trim();
            String note = request.getParameter("note").trim();
            ExamminationResultDAO er = new ExamminationResultDAO();
            ExamminationResult e = er.getExamminationResultByAppointmentID(aid);
            p.addPrescription("pre" + String.valueOf(intnewId), materialName, unit, amount, date, note, e.getId());
            response.sendRedirect("detailappointment?aid=" + URLEncoder.encode(aid, "UTF-8"));
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
