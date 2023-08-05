/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author Nguye
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private boolean gender;
    private String address;
    private String phone;
    private Date dob;
    private int roleId;

    public User(int id, String username, String password, String fullName, String email, boolean gender, String address, String phone, Date dob, int roleId) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.roleId = roleId;
    }

//    public User(int id, String username, String password, String email, int roleId) {
//        this.id = id;
//        this.username = username;
//        this.password = password;
//        this.email = email;
//        this.roleId = roleId;
//    }

    public User(int id, String username, String password, String email, int roleId) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.roleId = roleId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender?"Male":"Female";
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", gender=" + gender + ", address=" + address + ", phone=" + phone + ", dob=" + dob + ", roleId=" + roleId + '}';
    }

    public int calculateAge(Date dob, LocalDate currentDate) {
        if ((dob != null) && (currentDate != null)) {
                return Period.between(dob.toLocalDate(), currentDate).getYears();
            } else {
                return 0;
        }
    }
    
}
