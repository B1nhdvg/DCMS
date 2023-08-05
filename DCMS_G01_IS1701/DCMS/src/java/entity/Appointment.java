/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.employee.EmployeeDAO;
import DAO.patient.PatientDAO;
import DAO.service.serviceDAO;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author nmcbo
 */
public class Appointment {

    private String id;
    private Date date;
    private Time startTime;
    private Time endTime;
    private int employeeId;
    private int patientId;
    private int serviceId;
    private int tooth_number;
    private String status;

    public Appointment(String id, Date date, Time startTime, Time endTime, int employeeId, int patientId, int serviceId, int tooth_number, String status) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.employeeId = employeeId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.tooth_number = tooth_number;
        this.status = status;
    }

    public String getId() {
        return id;
    }
    public ExamminationResult getExamminationResultByAppointmentId(String id){
        ExamminationResultDAO er = new ExamminationResultDAO();
        ExamminationResult e = er.getExamminationResultByAppointmentID(id);
        return e;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public int getEmployeeId() {
        return employeeId;
    }
    public String getEmployeeName(int employeeId) {
        EmployeeDAO emp = new EmployeeDAO();
        User employee = emp.getEmployeeByID(employeeId);
        return employee.getFullName();
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getPatientId() {
        return patientId;
    }
    
    public String getPatientName(int patientId) {
        PatientDAO emp = new PatientDAO();
        User patient = emp.getPatientByID(patientId);
        return patient.getFullName();
    }
    
    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getServiceId() {
        return serviceId;
    }
    
    public String getServiceName(int serviceId ) {
        serviceDAO emp = new serviceDAO();
        Service ser = emp.getServicetByID(serviceId);
        return ser.getName();
    }
    
    public int getServiceCost(int serviceId ) {
        serviceDAO emp = new serviceDAO();
        Service ser = emp.getServicetByID(serviceId);
        return ser.getCost();
    }
    
    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getTooth_number() {
        return tooth_number;
    }

    public void setTooth_number(int tooth_number) {
        this.tooth_number = tooth_number;
    }
    public Service getService(int serviceId ) {
        serviceDAO emp = new serviceDAO();
        Service ser = emp.getServicetByID(serviceId);
        return ser;
    }
    public User getPatient(int patientId) {
        PatientDAO emp = new PatientDAO();
        User patient = emp.getPatientByID(patientId);
        return patient;
    }
    public User getEmployee(int employeeId) {
        EmployeeDAO emp = new EmployeeDAO();
        User employee = emp.getEmployeeByID(employeeId);
        return employee;
    }
    @Override
    public String toString() {
        return "Appointment{" + "id=" + id + ", status=" + status + ", date=" + date + ", startTime=" + startTime + ", endTime=" + endTime + ", employeeId=" + employeeId + ", patientId=" + patientId + ", serviceId=" + serviceId + ", tooth_number=" + tooth_number + '}';
    }

}
