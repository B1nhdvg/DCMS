/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.servicemanagement;

import DAO.service.serviceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import entity.Service;

/**
 *
 * @author Acer
 */
public class SearchServiceController extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code. */
        request.setCharacterEncoding("UTF-8");
        serviceDAO sdb = new serviceDAO();
        String target = request.getParameter("search");
        List<Service> list = sdb.searchService(target);
        PrintWriter out = response.getWriter();

        out.print(" <div class=\"container mt-4\">\n"
                + "            <div class=\"row\">\n"
                + "                <div id=\"content\" class=\"row\">\n"
                + "                    <table class=\"table table-bordered\">\n"
                + "                        <thead>\n"
                + "                            <tr>\n"
                
                + "                                <th>Service Name</th>\n"
                + "                                <th>Description</th>\n"
                + "                                <th>Image</th>\n"
                + "                                <th>Cost</th> \n"
                + "                                <th>Functions</th>\n"
                + "                            </tr>\n"
                + "                        </thead>\n"
                + "                        <tbody>\n");
        for (Service s : list) {
            out.print(" <tr>\n"
                    + "                                    <td><a href=\"detailservice?sid="+s.getId()+"\" >"+s.getName()+"</a></td>\n"                   
                    + "\n"
                    + "\n"
                    + "                            <td style=\"width: 300px;\n"
                    + "                                display: -webkit-box;\n"
                    + "                                max-height: 80px;\n"
                    + "                                -webkit-box-orient: vertical;\n"
                    + "                                overflow: hidden;\n"
                    + "                                text-overflow: ellipsis;\n"
                    + "                                white-space: normal;\n"
                    + "                                -webkit-line-clamp: 1;\n"
                    + "                                line-height: 30px;\n"
                    + "                                border: 0px;\">"+s.getDescription()+"</td>\n"
                    + "                            <td><img style=\"width: 100px; height: 100px\" src=\""+s.getImage()+"\" alt=\"alt\"/></td>\n"
                    + "                            <td>"+s.getCost()+"</td>            \n"
                    + "                            <td>\n"
                    + "                                <a href=\"updateservice?sid="+s.getId()+"\" class=\"btn btn-sm btn-primary\">Update</a>\n"
                    + "                                <a href=\"#\" onclick=\"showMess("+s.getId()+")\" class=\"btn btn-sm btn-danger\">Delete</a>\n"
                    + "                            </td>\n"
                    + "                            </tr>");

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
        processRequest(request, response);
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
        serviceDAO sdb = new serviceDAO();
        String target = request.getParameter("search");
        List<Service> list = sdb.searchService(target);
        request.setAttribute("listS", list);
        request.getRequestDispatcher("View_List_Service.jsp").forward(request, response);
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
