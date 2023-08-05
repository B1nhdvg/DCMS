/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.appointment.management.patient;

import DAO.appointment.appointmentDAO;
import DAO.employee.EmployeeDAO;
import DAO.service.serviceDAO;
import entity.Appointment;
import entity.Service;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguye
 */
public class BookAppointmentController extends HttpServlet {

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
            out.println("<title>Servlet BookAppointmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookAppointmentController at " + request.getContextPath() + "</h1>");
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
        EmployeeDAO e = new EmployeeDAO();
        serviceDAO s = new serviceDAO();
        User u = (User) request.getSession().getAttribute("userLogged");
        List<Service> listservice = s.getAllService();
        ArrayList<User> listemployee = e.getAllEmployee();
        request.setAttribute("listservice", listservice);
        request.setAttribute("listemployee", listemployee);
        request.getRequestDispatcher("user_BookAppointment.jsp").forward(request, response);
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
        appointmentDAO a = new appointmentDAO();
        ArrayList<Appointment> apList = a.getAllAppointment();
        User u = (User) request.getSession().getAttribute("Logged");
        String sid = String.valueOf(apList.size() + 1);
        String sdate = request.getParameter("date").trim();
        String sstart_time = request.getParameter("start_time").trim();
        String send_time = request.getParameter("end_time").trim();
        int semployee_id = Integer.parseInt(request.getParameter("employee_id").trim());
        int spatient_id = u.getId();
        int sservice_id = Integer.parseInt(request.getParameter("service_id").trim());
        int stooth_number = Integer.parseInt(request.getParameter("tooth_number").trim());
        a.addAppointment(sid, sdate, sstart_time, send_time, semployee_id, spatient_id, sservice_id, stooth_number, "Pending");
        response.sendRedirect("viewappointmenthistory");

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
