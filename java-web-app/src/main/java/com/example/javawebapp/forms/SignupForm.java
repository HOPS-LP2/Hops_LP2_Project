package com.example.javawebapp.forms;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.br.CPF;

import com.example.javawebapp.validators.Password;

public class SignupForm {

    @NotNull(message = "{first-name.notNull}")
    @NotBlank(message = "{first-name.notBlank}")
    @NotEmpty(message = "{first-name.notEmpty}")
    @Size(min = 1, max = 100, message = "{first-name.size}")
    private String first_name;

    @NotNull(message = "{last-name.notNull}")
    @NotBlank(message = "{last-name.notBlank}")
    @NotEmpty(message = "{last-name.notEmpty}")
    @Size(min = 1, max = 100, message = "{last-name.size}")
    private String last_name;

    @NotNull(message = "{email.notNull}")
    @NotBlank(message = "{email.notBlank}")
    @NotEmpty(message = "{email.notEmpty}")
    @Email(message = "{email.notEmail}")
    @Size(min = 5, max = 100, message = "{email.size}")
    private String email;

    @CPF(message = "{CPF.notCPF}")
    private String CPF;

    @NotNull(message = "{phone-number.notNull}")
    @NotBlank(message = "{phone-number.notBlank}")
    @NotEmpty(message = "{phone-number.notEmpty}")
    @Size(min = 5, max = 20, message = "{phone-number.size}")
    private String phone_number;

    @Password
    @Size(min = 8, max = 100, message = "{password.size}")
    @NotNull(message = "{password.notNull}")
    @NotBlank(message = "{password.notBlank}")
    @NotEmpty(message = "{password.notEmpty}")
    private String password;

    public SignupForm(String first_name, String last_name, String email, String CPF, String phone_number,
            String password) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.CPF = CPF;

        if (phone_number.matches("\\d+")) {
            this.phone_number = phone_number;
        } else {
            this.phone_number = null;
        }

        this.password = password;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
