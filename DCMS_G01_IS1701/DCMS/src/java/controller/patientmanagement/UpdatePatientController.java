
package controller.patientmanagement;

import DAO.patient.PatientDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UpdatePatientController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdatePatientController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePatientController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
            int id = Integer.parseInt(request.getParameter("sid"));
            String successMess = request.getParameter("successMessage");
            PatientDAO dao = new PatientDAO();
            User s = dao.getPatientByID(id);
            request.setAttribute("st", s);
            request.setAttribute("successMessage", successMess);
            request.getRequestDispatcher("UpdatePatient.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        int sid = Integer.parseInt(request.getParameter("id"));
        String susername = request.getParameter("username");
        String spassword = request.getParameter("password");
        String sfullName = request.getParameter("fullName");
        String semail = request.getParameter("email");
        boolean sgender = Boolean.parseBoolean(request.getParameter("gender"));
        String saddress = request.getParameter("address");
        String sphone = request.getParameter("phone");
        String sdob = request.getParameter("dob");
        PatientDAO dao = new PatientDAO();
        dao.updatePatient(sid, susername, spassword, sfullName, semail, sgender, saddress, sphone, sdob, 3);
        request.setAttribute("successMessage", "Update successful!");
        response.sendRedirect("updatepatient?sid=" + URLEncoder.encode(String.valueOf(sid), "UTF-8")+"&successMessage=" + URLEncoder.encode("Update successful!", "UTF-8"));
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
