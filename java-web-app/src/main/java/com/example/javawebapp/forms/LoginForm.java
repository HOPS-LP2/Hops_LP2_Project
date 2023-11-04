package com.example.javawebapp.forms;

import jakarta.validation.GroupSequence;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.br.CPF;

@GroupSequence({ LoginForm.class, LoginForm.EmailValidationGroup.class, LoginForm.CPFValidationGroup.class })
public class LoginForm {
    @NotNull(message = "{email.notNull}", groups = EmailValidationGroup.class)
    @NotBlank(message = "{email.notBlank}", groups = EmailValidationGroup.class)
    @NotEmpty(message = "{email.notEmpty}", groups = EmailValidationGroup.class)
    @Email(message = "email.notEmail", groups = EmailValidationGroup.class)
    @Size(min = 5, max = 100, message = "{email.size}", groups = EmailValidationGroup.class)
    private String email;

    @CPF(message = "{CPF.notCPF}", groups = CPFValidationGroup.class)
    private String CPF;

    @Size(min = 8, max = 100, message = "{password.size}")
    @NotNull(message = "{password.notNull}")
    @NotBlank(message = "{password.notBlank}")
    @NotEmpty(message = "{password.notEmpty}")
    private String password;

    public LoginForm(String credential, String password) {
        if (credential.length() == 11 && credential.matches("\\d+")) {
            this.CPF = credential;
        } else {
            this.email = credential;
        }
        this.password = password;
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

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public interface EmailValidationGroup {
    }

    public interface CPFValidationGroup {
    }
}
