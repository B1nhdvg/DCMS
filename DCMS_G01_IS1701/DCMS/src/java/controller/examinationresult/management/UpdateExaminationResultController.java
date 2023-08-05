/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.examinationresult.management;

import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.appointment.appointmentDAO;
import entity.Appointment;
import entity.ExamminationResult;
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
public class UpdateExaminationResultController extends HttpServlet {

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
            out.println("<title>Servlet UpdateExaminationResultController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateExaminationResultController at " + request.getContextPath() + "</h1>");
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
        String successMess = request.getParameter("successMessage");
        appointmentDAO a = new appointmentDAO();
        ExamminationResultDAO e = new ExamminationResultDAO();
        Appointment app = a.getAppointmentByID(aid);
        request.setAttribute("appointment", app);
        ExamminationResult er = e.getExamminationResultByAppointmentID(aid);
        request.setAttribute("examminationResult", er);
        request.setAttribute("successMessage", successMess);
        request.getRequestDispatcher("UpdateExaminationResult.jsp").forward(request, response);
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
        ExamminationResultDAO er = new ExamminationResultDAO();
        int total = er.getTotalNumberOfExaminationResult();
        String id = request.getParameter("eid".trim());
        String appointmentId = request.getParameter("appointmentId").trim();
        String reason = request.getParameter("reason").trim();
        String note = request.getParameter("note").trim();
        er.updateExamminationResult(id, appointmentId, reason, note);
        request.setAttribute("successMessage", "Exammination Result updated successfull!");
        response.sendRedirect("updateexaminationresult?aid=" + URLEncoder.encode(String.valueOf(appointmentId), "UTF-8") +
                "&successMessage=" + URLEncoder.encode("Exammination Result updated successfull!", "UTF-8"));
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
