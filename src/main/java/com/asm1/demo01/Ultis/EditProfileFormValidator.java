package com.asm1.demo01.Ultis;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.asm1.demo01.model.User;

import jakarta.validation.constraints.NotNull;
@Component
public class EditProfileFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotBlank.users.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotBlank.users.fullname");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotBlank.users.address");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthday", "NotNull.users.birthday");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNum", "NotBlank.users.phoneNum");
    }
}
