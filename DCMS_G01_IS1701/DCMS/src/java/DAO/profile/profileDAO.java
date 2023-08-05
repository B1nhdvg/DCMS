/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.profile;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import entity.User;

/**
 *
 * @author Acer
 */
public class profileDAO {

    public profileDAO() {
        connectDB();
    }

    Connection cnn = null; // ket noi db
    PreparedStatement stm = null; // thuc thi cac cau lenh sql
    ResultSet rs = null; // luu tru va xu ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext().getConnection());
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public List<User> getPatientProfile() {
        List<User> listP = new ArrayList<>();
        String query1 = "select * from Patient";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query1);
            rs = stm.executeQuery();

            while (rs.next()) {
                listP.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10)));
            }

        } catch (Exception e) {
        }
        return listP;
    }

    public void updateUser(int id, String username, String password, String fullname, String email, boolean gender, String phone, String dob, String address, int roleId) {
        String query = "update User_account"
                + " set username=?,"
                + " password=?,"
                + " fullname=?,"
                + " email=?,"
                + " gender=?,"
                + " address=?,"
                + " phone=?,"
                + " dob=?,"
                + " role_id=?"
                + " where id=?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, fullname);
            stm.setString(4, email);
            stm.setBoolean(5, gender);
            stm.setString(6, address);
            stm.setString(7, phone);
            stm.setString(8, dob);
            stm.setInt(9, roleId);
            stm.setInt(10, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public void updateUser1(int id, String fullname, String email, boolean gender, String phone, String dob, String address) {
        String query = "update User_account "
                + "set fullname=?, "
                + "email=?, "
                + "gender=?, "
                + "address=?, "
                + "phone=?, "
                + "dob=? "
                + "where id=?";                
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, fullname);
            stm.setString(2, email);
            stm.setBoolean(3, gender);
            stm.setString(4, address);
            stm.setString(5, phone);
            stm.setString(6, dob);
            stm.setInt(7, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public User getUserProfile(int id) {
        String query = "select * from User_account where id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            if (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10));
                return user;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
