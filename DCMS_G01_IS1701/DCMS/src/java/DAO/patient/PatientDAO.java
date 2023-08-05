/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.patient;

import DBContext.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Nguye
 */
public class PatientDAO {

    public PatientDAO() {
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

    public void addPatient(String id, String username, String password, String fullName, String email, String gender, String address, String phone, String dob, String roleId) {
        String sql = "INSERT INTO "
                + "User_account\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
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
    }

    //Dung cho Update Function
    public void updatePatient(int id, String username, String password, String fullName, String email, boolean gender, String address, String phone, String dob, int roleId) {
        String sql = " UPDATE User_account\n"
                + " SET username = ?,"
                + " password = ?,"
                + " fullname = ?,"
                + " email = ?,"
                + " gender = ?,"
                + " address = ?,"
                + " phone = ?,"
                + " dob = ?,"
                + " role_id = ? \n"
                + " WHERE id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, fullName);
            stm.setString(4, email);
            stm.setBoolean(5, gender);
            stm.setString(6, address);
            stm.setString(7, phone);
            stm.setString(8, dob);
            stm.setInt(9, roleId);
            stm.setInt(10, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update Error:" + e.getMessage());
        }
    }

    //Dung cho Update Function
    public User getPatientByID(int id) {
        String sql = "SELECT *\n"
                + "FROM User_account\n"
                + "WHERE id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getInt(10));
            }
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());
        }
        return null;
    }

    //Dung cho edit Patient
    public void deletePatient(String id) {
        try {
            String sql = "delete from User_account "
                    + "where id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("del Error:" + e.getMessage());
        }
    }

    //Dung cho list Patient va view Patient details
    public ArrayList<User> getAllPatient() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM User_account WHERE role_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, 3);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String fullname = rs.getString(4);
                String email = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                Date dob = rs.getDate(9);
                int roleId = rs.getInt(10);
                User patient = new User(id, username, password, fullname, email, gender, address, phone, dob, roleId);
                list.add(patient);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberPage() {
        String sql = "select count(*) from User_account\n"
                + "where role_id = 3;";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 4;
                if (total % 4 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    


    public ArrayList<User> getPaging(int index) {
        String sql = "select * from User_account\n"
                + "where role_id = 3\n"
                + "order by id\n"
                + "offset ? rows\n"
                + "fetch first 4 rows only;";
        ArrayList<User> list = new ArrayList<>();
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 4);
            rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getInt(10));
                list.add(s);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
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

    public List<User> searchPatient(String target) {
        List<User> list = new ArrayList<>();
        String query = "select * from User_account where role_id = ? and fullname like ?";
        try {
            stm = cnn.prepareStatement(query);
            stm.setInt(1, 3);
            stm.setString(2, "%" + target + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String fullname = rs.getString(4);
                String email = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                Date dob = rs.getDate(9);
                int roleId = rs.getInt(10);
                User employee = new User(id, username, password, fullname, email, gender, address, phone, dob, roleId);
                list.add(employee);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
