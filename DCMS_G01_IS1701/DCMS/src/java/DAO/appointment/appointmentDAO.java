/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.appointment;

import DBContext.DBContext;
import DBContext.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import entity.Appointment;

/**
 *
 * @author Nguye
 */
public class appointmentDAO {

    public appointmentDAO() {
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

    public void addAppointment(String id, String date, String start_time, String end_time, int employee_id, int patient_id, int service_id, int tooth_number, String status) {
        String sql = "insert into Appointment\n"
                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, date);
            stm.setString(3, start_time);
            stm.setString(4, end_time);
            stm.setInt(5, employee_id);
            stm.setInt(6, patient_id);
            stm.setInt(7, service_id);
            stm.setInt(8, tooth_number);
            stm.setString(9, "Pending");
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAppointment Error:" + e.getMessage());
        }
    }

    public ArrayList<Appointment> getAllAppointment() {
        ArrayList<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointment order by date desc";
        try {
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                Date date = rs.getDate(2);
                Time start_time = rs.getTime(3);
                Time end_time = rs.getTime(4);
                int employee_id = rs.getInt(5);
                int patient_id = rs.getInt(6);
                int service_id = rs.getInt(7);
                int tooth_number = rs.getInt(8);
                String status = rs.getString(9);
                Appointment app = new Appointment(id, date, start_time, end_time, employee_id, patient_id, service_id, tooth_number, status);
                list.add(app);

            }
        } catch (Exception e) {
            System.out.println("getAllAppointment Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Appointment> getAppointmentsOfAPatient(int patientid) {
        ArrayList<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointment where patient_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, patientid);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                Date date = rs.getDate(2);
                Time start_time = rs.getTime(3);
                Time end_time = rs.getTime(4);
                int employee_id = rs.getInt(5);
                int patient_id = rs.getInt(6);
                int service_id = rs.getInt(7);
                int tooth_number = rs.getInt(8);
                String status = rs.getString(9);
                Appointment app = new Appointment(id, date, start_time, end_time, employee_id, patient_id, service_id, tooth_number, status);
                list.add(app);
            }
        } catch (Exception e) {
            System.out.println("getAppointmentsOfAPatient Error:" + e.getMessage());
        }
        return list;
    }
    public ArrayList<Appointment> getAppointmentsOfAnEmployee(int employeeId) {
        ArrayList<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointment where employee_id = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, employeeId);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                Date date = rs.getDate(2);
                Time start_time = rs.getTime(3);
                Time end_time = rs.getTime(4);
                int employee_id = rs.getInt(5);
                int patient_id = rs.getInt(6);
                int service_id = rs.getInt(7);
                int tooth_number = rs.getInt(8);
                String status = rs.getString(9);
                Appointment app = new Appointment(id, date, start_time, end_time, employee_id, patient_id, service_id, tooth_number, status);
                list.add(app);

            }
        } catch (Exception e) {
            System.out.println("getAppointmentsOfAnEmployee Error:" + e.getMessage());
        }
        return list;
    }

    // Use for Update Appointment function
    public void updateAppointment(String id, String date, String start_time, String end_time, int employee_id, int patient_id, int service_id, int tooth_number, String ap_status) {
        String sql = " UPDATE Appointment\n"
                + "SET date = ?,"
                + "start_time = ?,"
                + "end_time = ?,"
                + "employee_id = ?,"
                + "patient_id = ?,"
                + "service_id = ?,"
                + "tooth_number = ?,"
                + "ap_status = ?\n"
                + "WHERE id = ?";
        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, date);
            stm.setString(2, start_time);
            stm.setString(3, end_time);
            stm.setInt(4, employee_id);
            stm.setInt(5, patient_id);
            stm.setInt(6, service_id);
            stm.setInt(7, tooth_number);
            stm.setString(8, ap_status);
            stm.setString(9, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update Error:" + e.getMessage());
        }
    }

    public Appointment getAppointmentByID(String id) {
        String sql = "SELECT * \n"
                + "FROM Appointment \n"
                + "WHERE id = ? ";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Appointment(rs.getString(1),
                        rs.getDate(2),
                        rs.getTime(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());
        }
        return null;
    }

    // Cancel and Approve An Appointment
    public void changeAppointmentStatus(int k, String appointmentId) {
        try {
            String sql = "update [Appointment] set "
                    + "  [ap_status] = ? "
                    + "where [id] = ?";
            stm = cnn.prepareStatement(sql);
            switch (k) {
                case 1:
                    stm.setString(1, "Pending");
                    break;
                case 2:
                    stm.setString(1, "Canceled");
                    break;
                case 3:
                    stm.setString(1, "Approved");
                    break;
            }
            stm.setString(2, appointmentId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("changeAppointmentStatus Error:" + e.getMessage());
        }
    }
    
    public ArrayList<Appointment> searchAppointment(String target){
        ArrayList<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointment where date = ?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, "%" + target + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                Date date = rs.getDate(2);
                Time start_time = rs.getTime(3);
                Time end_time = rs.getTime(4);
                int employee_id = rs.getInt(5);
                int patient_id = rs.getInt(6);
                int service_id = rs.getInt(7);
                int tooth_number = rs.getInt(8);
                String status = rs.getString(9);
                Appointment app = new Appointment(id, date, start_time, end_time, employee_id, patient_id, service_id, tooth_number, status);
                list.add(app);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
//    public Appointment getAppointmentByID(int id) {
//        String sql = "SELECT *\n"
//                + "FROM Appointment\n"
//                + "WHERE id = ? ";
//        try {
//            stm = cnn.prepareStatement(sql);
//            stm.setInt(1, id);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return new Appointment(rs.getString(1),
//                        rs.getDate(2),
//                        rs.getTime(3),
//                        rs.getTime(4),
//                        rs.getInt(5),
//                        rs.getInt(6),
//                        rs.getInt(7),
//                        rs.getInt(8),
//                        rs.getString(9));
//            }
//        } catch (Exception e) {
//            System.out.println("add Error:" + e.getMessage());
//        }
//        return null;
//    }
}
