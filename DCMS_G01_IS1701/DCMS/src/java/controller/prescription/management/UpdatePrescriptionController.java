/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.prescription.management;

import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.Prescription.PrescriptionDAO;
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
public class UpdatePrescriptionController extends HttpServlet {

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
            out.println("<title>Servlet UpdatePrescription</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePrescription at " + request.getContextPath() + "</h1>");
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
        String pid = request.getParameter("pid");
        String successMess = request.getParameter("successMessage");
        request.setAttribute("successMessage", successMess);
        PrescriptionDAO dao = new PrescriptionDAO();
        Prescription pre = dao.getPrescriptionsByID(pid);
        request.setAttribute("prescription", pre);
        ExamminationResultDAO er = new ExamminationResultDAO();
        ExamminationResult e = er.getExamminationResultByID(pre.getErId());
        request.setAttribute("examination_result", e);
        request.getRequestDispatcher("UpdatePrescription.jsp").forward(request, response);
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
        String pid = request.getParameter("pid");
        PrescriptionDAO dao = new PrescriptionDAO();
        ExamminationResultDAO er = new ExamminationResultDAO();
        Prescription pre = dao.getPrescriptionsByID(pid);
        ExamminationResult e = er.getExamminationResultByID(pre.getErId());
        PrescriptionDAO p = new PrescriptionDAO();
        String materialName = request.getParameter("materialName").trim();
        String unit = request.getParameter("unit").trim();
        int amount = Integer.parseInt(request.getParameter("amount").trim());
        String date = request.getParameter("date");
        String note = request.getParameter("note").trim();
        p.updatePrescription(pid, materialName, unit, amount, date, note, pre.getErId());
        request.setAttribute("successMessage", "Prescription updated successfull!");
        response.sendRedirect("updateprescription?pid=" + URLEncoder.encode(pid, "UTF-8") + "&successMessage="
                + URLEncoder.encode("Prescription updated successfull!", "UTF-8"));

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
