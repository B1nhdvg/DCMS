package controller.patientmanagement;

import DAO.patient.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddPatientController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPatientController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPatientController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("AddPatient.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sid = request.getParameter("id");
        String susername = request.getParameter("username").trim();
        String spassword = request.getParameter("password").trim();
        String sfullName = request.getParameter("fullName").trim();
        String semail = request.getParameter("email").trim();
        String sgender = request.getParameter("gender").trim();
        String saddress = request.getParameter("address").trim();
        String sphone = request.getParameter("phone").trim();
        String sdob = request.getParameter("dob").trim();

        PatientDAO dao = new PatientDAO();
        dao.addPatient(sid, susername, spassword, sfullName, semail, sgender, saddress, sphone, sdob, "3");
        response.sendRedirect("pagingpatient");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
