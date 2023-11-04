package com.example.javawebapp.validators; // Adjust the package name as per your project's package structure

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER, ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordValidator.class)
@Documented
public @interface Password {
    String message() default "{password.invalid}";

    String uppercaseMessage() default "{password.upper-case}";

    String lowercaseMessage() default "{password.lower-case}";

    String numberMessage() default "{password.number}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
