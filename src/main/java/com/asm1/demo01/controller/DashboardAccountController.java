package com.asm1.demo01.controller;

import java.util.List;
import java.util.Optional;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.Ultis.Bcryptor;
import com.asm1.demo01.Ultis.random_PasswordForCreateAcc;
import com.asm1.demo01.model.User;

@Controller
public class DashboardAccountController {
	@Autowired
	UsersDao usersDao;
	@Autowired
	JavaMailSender javaMailSender;
	
	
	@RequestMapping("/dashboard/account/CU")
	public String create_updateAccount(@ModelAttribute("acc") @Validated User acc, Errors errors, Model model) {
	

		if (!errors.hasFieldErrors("email") && !errors.hasFieldErrors("address") && !errors.hasFieldErrors("fullname")
				&& !errors.hasFieldErrors("phoneNum")) {

			
			if (acc.getUserID() == null) { //Tạo acc 
				if (usersDao.findByEmail(acc.getEmail()) != null) { //Tạo acc mà email đã tồn tại thì không cho
					model.addAttribute("msg", "Email already exists");
				}else {					// Tạo acc mà email chưa tồn tại thì mới tạo, acc mới tạo mật khẩu mặc định là "a"
					// dòng 44

					String randompass = new random_PasswordForCreateAcc().getRandomPass();
										
										String magiccode = Bcryptor.encrypt(randompass);

										acc.setPasswords(magiccode);
									
										sendPinCode(acc.getEmail(), randompass);
					
				}
			  
			}else {
				acc.setPasswords(usersDao.findByEmail(acc.getEmail()).getPasswords());
			}
			
			
		}
		usersDao.save(acc);
		model.addAttribute("listUser", usersDao.findAll());
	    return "account-forms";
	}
	
	
	@RequestMapping("/dashboard/account/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		User us = usersDao.findById(id).orElse(new User());
		model.addAttribute("acc", us);
		model.addAttribute("listUser", usersDao.findAll());
		return "account-forms";
	}
	
	@RequestMapping("/dashboard/account/delete/{id}")
	public String delete(@PathVariable("id") Integer id, Model model) {
		
		usersDao.deleteById(id);
		model.addAttribute("acc", new User());
		model.addAttribute("listUser", usersDao.findAll());
		return "account-forms";
	}
	

	public void sendPinCode(String toEmail, String pass) {

		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(toEmail);
		mailMessage.setSubject("Mật khẩu tài khoản Male Fashion");
		mailMessage.setText("Mật khẩu tài khoản Male Fashion: " + pass);

		javaMailSender.send(mailMessage);
	}

}
