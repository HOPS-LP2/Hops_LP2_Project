package com.example.javawebapp;

public class Validation {

    public static boolean isParameterValid(String parameter, int minLength, int maxLength) {
        if (parameter != null && !parameter.trim().isEmpty()) {
            int length = parameter.trim().length();
            return (length >= minLength && length <= maxLength);
        }
        return false;
    }

}
