package controller.employeemanagement;

import DAO.employee.EmployeeDAO;
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
import utils.Validator;

public class UpdateEmployeeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployeeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //delivery database to jsp  
        int id = Integer.parseInt(request.getParameter("sid"));
        String successMess = request.getParameter("successMessage");
        EmployeeDAO dao = new EmployeeDAO();
        User s = dao.getEmployeeByID(id);
        request.setAttribute("st", s);
        request.setAttribute("successMessage", successMess);
        //connect to jsp
        request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validator validator = new Validator();

        // Take update data from input JSP
        int sid = Integer.parseInt(request.getParameter("id").trim());
        String susername = request.getParameter("username").trim();
        String spassword = request.getParameter("password").trim();
        String sfullName = request.getParameter("fullName").trim();
        String semail = request.getParameter("email").trim();
        boolean sgender = Boolean.parseBoolean(request.getParameter("gender"));
        String saddress = request.getParameter("address").trim();
        String sphone = request.getParameter("phone").trim();
        String sdob = request.getParameter("dob");

        // Update employee data 
        EmployeeDAO dao = new EmployeeDAO();
        dao.updateEmployee(sid, susername, spassword, sfullName, semail, sgender, saddress, sphone, sdob, 2);

        // Set success message in the request attribute
        request.setAttribute("successMessage", "Update successful!");
        response.sendRedirect("updateemployee?sid=" + URLEncoder.encode(String.valueOf(sid), "UTF-8")+"&successMessage=" + URLEncoder.encode("Update successful!", "UTF-8"));
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
