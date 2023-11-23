package com.example.javawebapp.forms;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ContactForm {
    @NotNull(message = "{email.notNull}")
    @NotBlank(message = "{email.notBlank}")
    @NotEmpty(message = "{email.notEmpty}")
    @Email(message = "email.notEmail")
    @Size(min = 5, max = 100, message = "{email.size}")
    private String email;

    @NotNull(message = "{name.notNull}")
    @NotBlank(message = "{name.notBlank}")
    @NotEmpty(message = "{name.notEmpty}")
    private String name;

    @NotNull(message = "{message.notNull}")
    @NotBlank(message = "{message.notBlank}")
    @NotEmpty(message = "{message.notEmpty}")
    private String message;

    public ContactForm(
            @NotNull(message = "{email.notNull}") @NotBlank(message = "{email.notBlank}") @NotEmpty(message = "{email.notEmpty}") @Email(message = "email.notEmail") @Size(min = 5, max = 100, message = "{email.size}") String email,
            @NotNull(message = "{name.notNull}") @NotBlank(message = "{name.notBlank}") @NotEmpty(message = "{name.notEmpty}") String name,
            @NotNull(message = "{message.notNull}") @NotBlank(message = "{message.notBlank}") @NotEmpty(message = "{message.notEmpty}") String message) {
        this.email = email;
        this.name = name;
        this.message = message;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
