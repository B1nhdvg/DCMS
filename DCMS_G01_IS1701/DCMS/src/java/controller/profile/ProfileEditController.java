/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.profile;

import DAO.profile.profileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.User;
import java.net.URLEncoder;

/**
 *
 * @author Acer
 */
public class ProfileEditController extends HttpServlet {

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

//            User user = (User) request.getSession().getAttribute("Logged");            
//            request.setAttribute("ep", user);
//            request.getRequestDispatcher("profileEdit.jsp").forward(request, response);
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
        User user = (User) request.getSession().getAttribute("Logged");
        String role = request.getParameter("prole");
        String successMess = request.getParameter("successMessage");
        int id = user.getId();
        profileDAO db = new profileDAO();
        request.setAttribute("prole", role);
        request.setAttribute("successMessage", successMess);
        request.setAttribute("ep", db.getUserProfile(id));
        request.getRequestDispatcher("profileEdit.jsp").forward(request, response); //day du lieu len tu db len jsp
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
        int id = Integer.parseInt(request.getParameter("id"));
        String fname = request.getParameter("fullname").trim();
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String email = request.getParameter("email").trim();
        String address = request.getParameter("address").trim();
        String phone = request.getParameter("phone").trim();
        String dob = request.getParameter("dob").trim();
        profileDAO profileDB = new profileDAO();
        profileDB.updateUser1(id, fname, email, gender, phone, dob, address);

        User user = profileDB.getUserProfile(id);
        HttpSession session = request.getSession();
        
        // Set success message in the request attribute
        request.setAttribute("successMessage", "Update successful!");
        session.setAttribute("Logged", user);
        //response.sendRedirect("viewprofile");  //lay du lieu tu jsp
        response.sendRedirect("profileedit?id=" + URLEncoder.encode(String.valueOf(id), "UTF-8")+"&successMessage=" + URLEncoder.encode("Update successful!", "UTF-8"));
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
