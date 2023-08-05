
import DAO.ExaminationResult.ExamminationResultDAO;
import DAO.Prescription.PrescriptionDAO;
import DAO.employee.EmployeeDAO;
import DAO.patient.PatientDAO;
import entity.User;
import java.util.ArrayList;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class Test {

    public static void main(String[] args) {
//        PatientDAO dao = new PatientDAO();
//        boolean adu = true ;
        EmployeeDAO edao = new EmployeeDAO();
        ExamminationResultDAO er = new ExamminationResultDAO();
        er.addExamminationResult("1", "10", "e", "note");
        PrescriptionDAO p = new PrescriptionDAO();

        p.addPrescription("1", "Anti-inflammatory drugs", "Package", 1, "2023-07-16", "1 tablet/day", "1");
        List<User> e = edao.searchEmployeeByName("cuong");
        int k = edao.countNumberOfEmployeeFound("");
        System.out.println(e);
        System.out.println(k);
    }
}
