package com.example.javawebapp.user;

public class User {
    private Integer userId;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String CPF;
    private String phone_number;
    private String CNH;
    private char CNH_license_class;

    public User(String first_name, String last_name, String email, String password, String cPF, String phone_number) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        CPF = cPF;
        this.phone_number = phone_number;
    }

    public User(Integer userId, String first_name, String last_name, String email, String password, String cPF,
            String phone_number) {
        this.userId = userId;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        CPF = cPF;
        this.phone_number = phone_number;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String cPF) {
        CPF = cPF;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getCNH() {
        return CNH;
    }

    public void setCNH(String cNH) {
        CNH = cNH;
    }

    public char getCNH_license_class() {
        return CNH_license_class;
    }

    public void setCNH_license_class(char cNH_license_class) {
        CNH_license_class = cNH_license_class;
    }
}
