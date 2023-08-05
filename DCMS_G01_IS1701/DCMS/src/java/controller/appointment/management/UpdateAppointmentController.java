package controller.appointment.management;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAO.appointment.appointmentDAO;
import DAO.employee.EmployeeDAO;
import DAO.patient.PatientDAO;
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
public class UpdateAppointmentController extends HttpServlet {

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
            out.println("<title>Servlet UpdateAppointmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAppointmentController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String id = request.getParameter("sid");
        String successMess = request.getParameter("successMessage");
        //implement dao
        appointmentDAO dao = new appointmentDAO();
        EmployeeDAO employeedao = new EmployeeDAO();
        PatientDAO patientdao = new PatientDAO();
        serviceDAO servicedao = new serviceDAO();
        //load data on input
        Appointment s = dao.getAppointmentByID(id);
        request.setAttribute("st", s);
        ArrayList<User> emplist = employeedao.getAllEmployee();
        ArrayList<Service> serlist = servicedao.getAllService();
        request.setAttribute("listemployee",emplist);
        request.setAttribute("listservice",serlist);
        User pat = patientdao.getPatientByID(s.getPatientId());
        request.setAttribute("patientName", pat.getFullName());
        request.setAttribute("successMessage", successMess);
        request.getRequestDispatcher("UpdateAppointment.jsp").forward(request, response);
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
        String sid = request.getParameter("id").trim();
        String sdate = request.getParameter("date").trim();
        String sstart_time = request.getParameter("start_time").trim();
        String send_time = request.getParameter("end_time").trim();
        int semployee_id = Integer.parseInt(request.getParameter("employee_id"));
        int spatient_id = Integer.parseInt(request.getParameter("patient_id"));
        int sservice_id = Integer.parseInt(request.getParameter("service_id"));
        int stooth_number = Integer.parseInt(request.getParameter("tooth_number").trim());
        String sap_status = request.getParameter("ap_status").trim();
        //update employee data 
        appointmentDAO dao = new appointmentDAO();
        dao.updateAppointment(sid, sdate, sstart_time, send_time, semployee_id, spatient_id, sservice_id, stooth_number, sap_status);
        
        request.setAttribute("successMessage", "Appointment updated successfull!");
        response.sendRedirect("updateappointment?sid=" + URLEncoder.encode(String.valueOf(sid), "UTF-8")+"&successMessage=" + URLEncoder.encode("Appointment updated successfull!", "UTF-8"));

        
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
