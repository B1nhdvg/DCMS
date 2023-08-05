/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.auth;

import DBContext.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nmcbo
 */
public class UserDAO {

    public UserDAO() {
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

    public User getUserAccount(String username, String password) {
        String sql = "Select * from dbo.[User_account] where username=? AND password=?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10));
                return u;
            }
            System.out.println("Login ok!");
        } catch (Exception e) {
            System.out.println("getUser Error:" + e.getMessage());
        }
        return null;
    }

    public ArrayList<User> getUserList() {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "select * from dbo.[User_account]";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int userIdNumber = rs.getInt(1);
                String userUsername = rs.getString(2);
                String userPassword = rs.getString(3);
                String userEmail = rs.getString(4);
                int userRoleid = rs.getInt(5);
                User u = new User(userIdNumber, userUsername, userPassword, userEmail, userRoleid);
                listUser.add(u);
            }
        } catch (Exception e) {
            System.out.println("Get list user error: " + e.getMessage());
        }
        return listUser;
    }

    public boolean register(int id, String username, String password, String fullName, String email, String gender, String address, String phone, String dob, String roleId) {
        String sql = "INSERT INTO "
                + "User_account\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.setString(4, fullName);
            stm.setString(5, email);
            stm.setString(6, gender);
            stm.setString(7, address);
            stm.setString(8, phone);
            stm.setString(9, dob);
            stm.setString(10, roleId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());
        }
        return false;
    }
///

    public void changePassword(int userid, String newPassword) {
        try {
            String sql = "update [User_account] set "
                    + "  [password] = ? "
                    + "where [id] = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, newPassword);
            stm.setInt(2, userid);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("changePass Error:" + e.getMessage());
        }
    }

    public int checkEmailExisted(String email) {
        String sql = "SELECT [id] FROM [User_account] "
                + "WHERE email= ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("checkExistEmail Error:" + e.getMessage());
        }
        return 0;
    }

    public int checkIdNumberExisted(int idNumber) {
        String sql = "SELECT [id] FROM [User_account] "
                + "WHERE id= ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, idNumber);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("checkExistId Error:" + e.getMessage());
        }
        return 0;
    }

    public int checkUsernameExisted(String key) {
        try {
            String sql = "SELECT [id] FROM [User_account] "
                    + "             WHERE username = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, key);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("checkUsername Error:" + e.getMessage());
        }
        return 0;
    }
}
