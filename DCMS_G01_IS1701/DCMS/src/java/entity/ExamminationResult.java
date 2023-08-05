/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import DAO.appointment.appointmentDAO;
import DAO.employee.EmployeeDAO;
import DAO.patient.PatientDAO;
import DAO.service.serviceDAO;

/**
 *
 * @author nmcbo
 */
public class ExamminationResult {
    private String id;
    private String apId;
    private String reason;
    private String note;

    public ExamminationResult(String id, String apId, String reason, String note) {
        this.id = id;
        this.apId = apId;
        this.reason = reason;
        this.note = note;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getApId() {
        return apId;
    }

    public void setApId(String apId) {
        this.apId = apId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    public Appointment getAppointment(int apId) {
        appointmentDAO emp = new appointmentDAO();
        Appointment a = emp.getAppointmentByID(id);
        return a;
    }
}
