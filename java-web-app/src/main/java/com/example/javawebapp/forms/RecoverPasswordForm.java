package com.example.javawebapp.forms;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class RecoverPasswordForm {
    @NotNull(message = "{email.notNull}")
    @NotBlank(message = "{email.notBlank}")
    @NotEmpty(message = "{email.notEmpty}")
    @Email(message = "email.notEmail")
    @Size(min = 5, max = 100, message = "{email.size}")
    private String email;

    public RecoverPasswordForm(String email) {
        this.email = email;
    }

}
