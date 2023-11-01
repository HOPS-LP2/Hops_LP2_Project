package com.example.javawebapp.forms;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class LoginForm {
    @NotNull(message = "{email.notNull}")
    @NotBlank(message = "{email.notBlank}")
    @Email(message = "email.notEmail")
    @Size(min = 5, max = 100, message = "{email.size}")
    private String email;

    @Size(min = 8, max = 100, message = "{password.size}")
    @NotNull(message = "{password.notNull}")
    @NotEmpty(message = "{password.notEmpty}")
    private String password;

    public LoginForm(@NotNull @NotBlank @Email String email, @NotNull @NotEmpty String password) {
        this.email = email;
        this.password = password;
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

}
