/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Prescription;

import DBContext.DBContext;
import entity.Prescription;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author nmcbo
 */
public class PrescriptionDAO {
    public PrescriptionDAO() {
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
    
    public void updatePrescription(String id, String materialName, String unit, int amount,
                            String date,String note, String erId) {        
    String sql = " UPDATE [dbo].[Prescription]\n"
                + "SET \n"
                + "[material_name] = ?,"
                + "[unit] = ?,"
                + "[amount] = ?,"
                + "[date] = ?,"
                + "[note] = ?,"
                + "[ER_id] = ?\n"
                + "WHERE id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, materialName);
            stm.setString(2, unit);
            stm.setInt(3, amount);
            stm.setString(4, date);
            stm.setString(5, note);
            stm.setString(6, erId);
            stm.setString(7, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePrescription Error:" + e.getMessage());
        }
    }
    public void addPrescription(String id, String materialName, String unit, int amount,
                            String date,String note, String erId) {
        String sql = "INSERT INTO [dbo].[Prescription] VALUES (?,?,?,?,?,?,?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, materialName);
            stm.setString(3, unit);
            stm.setInt(4, amount);
            stm.setString(5, date);
            stm.setString(6, note);
            stm.setString(7, erId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addPrescription Error:" + e.getMessage());
        }
    }
    public ArrayList<Prescription> getPrescriptionsByExamminationResultID(String examResultId) {
        ArrayList<Prescription> list = new ArrayList<>();
        String sql = "SELECT *  FROM [dbo].[Prescription]\n"
                + "WHERE ER_id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, examResultId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Prescription pre =  new Prescription(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getString(6),
                rs.getString(7));
                list.add(pre);
            }
        } catch (Exception e) {
            System.out.println("getPrescriptionsByExamminationResultID Error:" + e.getMessage());
        }
        return list;
    }
    public Prescription getPrescriptionsByID(String id) {
        String sql = "SELECT *  FROM [dbo].[Prescription]\n"
                + "WHERE id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Prescription(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
            System.out.println("getPrescriptionsByExamminationResultID Error:" + e.getMessage());
        }
        return null;
    }
    public Prescription getLastPrescriptionsByID() {
        String sql = "SELECT TOP 1 * FROM [dbo].[Prescription] ORDER BY ID DESC";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Prescription(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
            System.out.println("getLastPrescriptions Error:" + e.getMessage());
        }
        return null;
    }
    public void deletePrescription(String id) {
        try {
            String sql = "DELETE FROM [dbo].[Prescription]\n" +
                            "WHERE id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("deletePrescription Error:" + e.getMessage());
        }
    }
    
    public int getTotalNumberOfPrescriptions(){
            String sql = "SELECT COUNT(*) from Prescription";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalNumberOfPrescriptions Error:" + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
    
}
