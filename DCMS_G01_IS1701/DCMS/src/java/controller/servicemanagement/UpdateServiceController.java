/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.servicemanagement;

import DAO.service.serviceDAO;
import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 *
 * @author ADMIN
 */
public class UpdateServiceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServiceController at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("successMessage", successMess);
        serviceDAO dao = new serviceDAO();
        Service s = dao.getServicetByID(id);
        request.setAttribute("st", s);
        request.getRequestDispatcher("UpdateService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        int sid = Integer.parseInt(request.getParameter("id"));
        String sname = request.getParameter("name");
        String sdescription = request.getParameter("description");
        String simage = request.getParameter("image");
        int scost = Integer.parseInt(request.getParameter("cost"));
        
        serviceDAO dao = new serviceDAO();
        dao.updateService(sid, sname, sdescription, simage, scost);
        request.setAttribute("successMessage", "Service updated successfull!");
        response.sendRedirect("updateservice?sid=" + URLEncoder.encode(String.valueOf(sid), "UTF-8") + "&successMessage="
                + URLEncoder.encode("Service updated successfull!", "UTF-8"));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
