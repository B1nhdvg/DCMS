/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.employee;

import DBContext.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Nguye
 */
public class EmployeeDAO {

    public EmployeeDAO() {
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

    // Use for add employee function
    public void addEmployee(int id, String username, String password, String fullName, String email, String gender, String address, String phone, String dob, String roleId) {
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
    }

    // Use for Update employee function
    public void updateEmployee(int id, String username, String password, String fullName, String email, boolean gender, String address, String phone, String dob, int roleId) {
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

    // Use for Update employee function
    public User getEmployeeByID(int id) {
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

    //Use for delete employee function
    public void deleteEmployee(String id) {
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

    //Use for List employee function
    public ArrayList<User> getAllEmployee() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM User_account WHERE role_id = 2";
        try {
            stm = cnn.prepareStatement(sql);
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
            System.out.println("getAllEmployee Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<User> searchEmployeeByName(String txtSearch) {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM User_account WHERE role_id = ? AND fullName LIKE ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, 2);
            stm.setString(2, "%" + txtSearch + "%");
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

    public int countNumberOfEmployeeFound(String txtSearch) {
        try {
            String sql = "SELECT COUNT(*) FROM User_account WHERE role_id = ? AND fullName LIKE ?";
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, 2);
            stm.setString(2, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<User> searchEmployee(int us, String att) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM\n"
                    + "	(\n"
                    + "	SELECT * FROM [dbo].[User]\n"
                    + "	WHERE [is_super] <?\n"
                    + "	) as n1\n"
                    + "	INTERSECT\n"
                    + "SELECT * FROM\n"
                    + "	(\n"
                    + "	SELECT * FROM [dbo].[User_account]\n"
                    + "	WHERE [fullname] LIKE ?\n"
                    + "	or [username] LIKE ?\n"
                    + "	or [email] LIKE ?\n"
                    + "	or [phone] LIKE ?\n"
                    + "	or [address] LIKE ?\n"
                    + "	) as n2      ";
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, us);
            stm.setString(2, att);
            stm.setString(3, att);
            stm.setString(4, att);
            stm.setString(5, att);
            stm.setString(6, att);

            rs = stm.executeQuery();
            while (rs.next()) {
                int userid = rs.getInt(1);
                String name = rs.getString(2);
                boolean gender = rs.getBoolean(3);
                /*? "Male" : "Female";*/
                SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
                String dob = f.format(rs.getDate(4));
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String address = rs.getString(7);
                String username = rs.getString(8);
//                User u = new User(userid, name, username, gender, dob, email, phone, address);
//                u.setIs_super(is_super);
//                list.add(u);
            }
        } catch (Exception e) {
            System.out.println("getUser Error:" + e.getMessage());
        }
        return list;
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

    public int getNumberPage() {
        String sql = "select count(*) from User_account\n"
                + "where role_id = 2;";
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
                + "where role_id = 2\n"
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
}
