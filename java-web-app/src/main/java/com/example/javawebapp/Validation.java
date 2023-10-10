package com.example.javawebapp;

import java.util.regex.Pattern;

public class Validation {

    public static boolean isParameterValid(String parameter, int minLength, int maxLength) {
        if (parameter != null && !parameter.trim().isEmpty()) {
            int length = parameter.trim().length();
            return (length >= minLength && length <= maxLength);
        }
        return false;
    }

    public static boolean containsOnlyNumbers(String phoneNumber) {
        for (char c : phoneNumber.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isPasswordValid(String password) {
        // Check if the password has at least 8 characters, an uppercase letter, a
        // lowercase letter, and a number
        return Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$", password);
    }

    private static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";

    public static boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        return pattern.matcher(email).matches();
    }

    public static boolean isValidCPF(String cpf) {
        // Remove non-numeric characters from the CPF
        cpf = cpf.replaceAll("[^0-9]", "");

        // Check if CPF has 11 digits
        if (cpf.length() != 11) {
            return false;
        }

        // Validate CPF using the algorithm for verification
        int[] digits = new int[11];
        for (int i = 0; i < 11; i++) {
            digits[i] = Character.getNumericValue(cpf.charAt(i));
        }

        int sum = 0;
        for (int i = 0; i < 9; i++) {
            sum += digits[i] * (10 - i);
        }

        int remainder = sum % 11;
        int expectedDigit1 = (remainder < 2) ? 0 : (11 - remainder);

        if (digits[9] != expectedDigit1) {
            return false;
        }

        sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += digits[i] * (11 - i);
        }

        remainder = sum % 11;
        int expectedDigit2 = (remainder < 2) ? 0 : (11 - remainder);

        return (digits[10] == expectedDigit2);
    }

}
