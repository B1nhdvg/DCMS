/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ExaminationResult;

import DBContext.DBContext;
import entity.ExamminationResult;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author nmcbo
 */
public class ExamminationResultDAO {
    public ExamminationResultDAO() {
        connectDB();
    }

    Connection cnn; // ket noi db
    PreparedStatement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext().getConnection());
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }
    public void addExamminationResult(String id, String apId, String reason, String note) {
        String sql = "INSERT INTO [dbo].[Examination_Result]\n" +
"           ([id]\n" +
"           ,[ap_id]\n" +
"           ,[reason]\n" +
"           ,[note])\n" +
"     VALUES (?,?,?,?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, apId);
            stm.setString(3, reason);
            stm.setString(4, note);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addExamminationResult Error:" + e.getMessage());
        }
    }

    // Use for Update Appointment function
public void updateExamminationResult(String id, String apId, String reason, String note) {        
    String sql = " UPDATE Examination_Result\n"
                + "SET ap_id = ?,"
                + "reason = ?,"
                + "note = ?\n"
                + "WHERE id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, apId);
            stm.setString(2, reason);
            stm.setString(3, note);
            stm.setString(4, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateExamminationResult Error:" + e.getMessage());
        }
    }

    public ExamminationResult getExamminationResultByAppointmentID(String appointmentId) {
        String sql = "SELECT *\n"
                + "FROM Examination_Result\n"
                + "WHERE ap_id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, appointmentId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new ExamminationResult(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
            System.out.println("getExamminationResultByAppointmentID Error:" + e.getMessage());
        }
        return null;
    }
    public ExamminationResult getExamminationResultByID(String id) {
        String sql = "SELECT *\n"
                + "FROM Examination_Result\n"
                + "WHERE id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new ExamminationResult(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
            System.out.println("getExamminationResultByID Error:" + e.getMessage());
        }
        return null;
    }
    
    public int getTotalNumberOfExaminationResult(){
            String sql = "SELECT COUNT(*) AS total from  Examination_Result";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalNumberOfExaminationResult Error:" + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
    
 
}
