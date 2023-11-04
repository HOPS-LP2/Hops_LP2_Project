package com.example.javawebapp.validators;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator<Password, String> {
    private String message;
    private String uppercaseMessage;
    private String lowercaseMessage;
    private String numberMessage;

    @Override
    public void initialize(Password constraintAnnotation) {
        message = constraintAnnotation.message();
        uppercaseMessage = constraintAnnotation.uppercaseMessage();
        lowercaseMessage = constraintAnnotation.lowercaseMessage();
        numberMessage = constraintAnnotation.numberMessage();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }

        boolean containsUppercase = false;
        boolean containsLowercase = false;
        boolean containsDigit = false;

        for (char c : value.toCharArray()) {
            if (Character.isUpperCase(c)) {
                containsUppercase = true;
            } else if (Character.isLowerCase(c)) {
                containsLowercase = true;
            } else if (Character.isDigit(c)) {
                containsDigit = true;
            }
        }

        if (containsUppercase && containsLowercase && containsDigit) {
            return true;
        }

        context.disableDefaultConstraintViolation();
        if (!containsUppercase) {
            context.buildConstraintViolationWithTemplate(uppercaseMessage).addConstraintViolation();
        }
        if (!containsLowercase) {
            context.buildConstraintViolationWithTemplate(lowercaseMessage).addConstraintViolation();
        }
        if (!containsDigit) {
            context.buildConstraintViolationWithTemplate(numberMessage).addConstraintViolation();
        }

        return false;
    }
}
