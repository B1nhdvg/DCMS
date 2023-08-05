package controller.employeemanagement;

import DAO.employee.EmployeeDAO;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddEmployeeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddEmployeeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //connect to jsp
        request.getRequestDispatcher("AddEmployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //take data from input jsp 
        int sid = Integer.parseInt(request.getParameter("id").trim());
        String susername = request.getParameter("username").trim();
        String spassword = request.getParameter("password").trim();
        String sfullName = request.getParameter("fullName").trim();
        String semail = request.getParameter("email").trim();
        String sgender = request.getParameter("gender");
        String saddress = request.getParameter("address").trim();
        String sphone = request.getParameter("phone").trim();
        String sdob = request.getParameter("dob").trim();
        //insert new employee to database
        EmployeeDAO dao = new EmployeeDAO();
        dao.addEmployee(sid, susername, spassword, sfullName, semail, sgender, saddress, sphone, sdob, "2");
        response.sendRedirect("pagingemployee");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }
}
