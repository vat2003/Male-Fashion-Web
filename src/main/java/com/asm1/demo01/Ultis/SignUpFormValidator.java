package com.asm1.demo01.Ultis;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.asm1.demo01.model.User;
@Component
public class SignUpFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Email.users.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotBlank.users.fullname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwords", "NotBlank.users.passwords");

    }
}
