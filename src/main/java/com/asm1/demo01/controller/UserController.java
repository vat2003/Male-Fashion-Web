package com.asm1.demo01.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.lang3.RandomStringUtils;
import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.Service.CookieService;
import com.asm1.demo01.Service.SessionService;
import com.asm1.demo01.Ultis.Bcryptor;
import com.asm1.demo01.Ultis.EditProfileFormValidator;
import com.asm1.demo01.Ultis.LoginFormValidator;
import com.asm1.demo01.Ultis.SignUpFormValidator;
import com.asm1.demo01.model.User;

@SessionScope
@Controller
@Configuration
@RequestMapping("asm")
public class UserController {
	@Autowired
	UsersDao usersDao;
	@Autowired
	SessionService ss;
	@Autowired
	JavaMailSender javaMailSender;
	@Autowired
	CookieService cookie;

	String pinCode;

	@RequestMapping("login")
	public String setupLogin(Model model) {

		model.addAttribute("user_login", new User());
		model.addAttribute("user_signup", new User());
		
		System.err.println(cookie.getValue("username"));
		System.err.println(cookie.getValue("password"));
		
		model.addAttribute("username", cookie.getValue("username"));
		model.addAttribute("password", cookie.getValue("password"));
		
		return "login_signup";
	}

	@RequestMapping("logout")
	public String logoutAccount(Model model) {

		ss.remove("email");
		System.err.println("LOGOUT SUCCESSFULLY!");

		return "redirect:/asm/index";
	}

	@PostMapping("/account/loginPost")
	public String Login(@ModelAttribute("user_login") @Validated User user_login, Errors errors, Model model, @RequestParam(value = "remember", required = false, defaultValue = "false") boolean remember) {
		List<User> list = usersDao.findAll();

		System.out.println(user_login.getEmail());
		System.out.println(user_login.getPasswords());
		model.addAttribute("user_signup", new User());// để cho khỏi lỗi form đăng ký

		if (errors.hasFieldErrors("email") || errors.hasFieldErrors("passwords")) {
			return "login_signup";
		}

		for (User item : list) {
			if (item.getEmail().equals(user_login.getEmail())
					&& item.getPasswords().equals(user_login.getPasswords())) {
				ss.set("email", item);
				if (remember) {
					System.err.println("lưu");
					cookie.add("username",item.getEmail(),24);
					cookie.add("password",item.getPasswords(),24);
				}else {
					System.err.println("khônglưu");
					cookie.remove("username");
					cookie.remove("password");
				}
				return "redirect:/asm/index";
			}

		}

		try {
			User us = usersDao.findByEmail(user_login.getEmail());
			System.err.println("aaaaaaaaaaaaaaaaaaaaâ");
			if (us != null && Bcryptor.matches(user_login.getPasswords(), us.getPasswords())) {
				ss.set("email", us);
				
				if (remember) {
					System.err.println("lưu");
					cookie.add("username",us.getEmail(),24);
					cookie.add("password",us.getPasswords(),24);
				}else {
					System.err.println("khônglưu");
					cookie.remove("username");
					cookie.remove("password");
				}
				
				return "redirect:/asm/index";
			}

		} catch (Exception e) {
			System.err.println("khônglưu" + e);
		}

		model.addAttribute("bug", "The email or the password isn't correct");

		return "login_signup";
	}

	@PostMapping("/account/createAcc")
	public String createAcc(@ModelAttribute("user_signup") @Validated User user_signup, Errors errors, Model model,
			@RequestParam("re_passwords") String re_passwords) {

		model.addAttribute("user_login", new User());
		System.out.println(user_signup);
		if (re_passwords == "") {
			model.addAttribute("msg", "Please enter repassword");
		}
		if (usersDao.findByEmail(user_signup.getEmail())!= null) {
			model.addAttribute("msg", "Email already exists");	
			 return "login_signup";
		}
		if (!errors.hasFieldErrors("email") && !errors.hasFieldErrors("passwords")
				&& !errors.hasFieldErrors("fullname")) {
			if (!user_signup.getPasswords().equals(re_passwords)) {
				// báo lỗi nếu re_pass sai
				model.addAttribute("msg", "The password and repassword doesn't match");

			} else {
				user_signup.setAddress("no address");
				user_signup.setPhoneNum("no phone number");
				String magiccode = Bcryptor.encrypt(user_signup.getPasswords());

				user_signup.setPasswords(magiccode);
				usersDao.save(user_signup);
			}
		}

		return "login_signup";
	}

	@RequestMapping("profile")
	public String profile(Model model) {
		User user = ss.get("email");
		System.out.println(user);
		if (user == null) {
			user = new User();
		}
		model.addAttribute("user_profile", user);
		return "profile";
	}

	@PostMapping("/account/profile/{id}")
	public String editprofile(Model model, @ModelAttribute("user_profile") @Validated User user_profile, Errors errors,
			@PathVariable("id") Integer id) {
		System.out.println(id);
		user_profile.setUserID(id);
		if (!errors.hasFieldErrors("email") && !errors.hasFieldErrors("address") && !errors.hasFieldErrors("fullname")
				&& !errors.hasFieldErrors("phoneNum")) {

			// Lấy thông tin người dùng từ cơ sở dữ liệu
			User user = usersDao.findById(user_profile.getUserID()).orElse(null);

			// Kiểm tra xem người dùng có tồn tại không
			if (user == null) {
				// Xử lý trường hợp người dùng không tồn tại
				return "redirect:/error"; // Hoặc bất kỳ trang lỗi nào bạn muốn
			}

			// Cập nhật thông tin người dùng
			user.setAddress(user_profile.getAddress());
			user.setEmail(user_profile.getEmail());
			user.setPhoneNum(user_profile.getPhoneNum());
			System.out.println(user_profile.getBirthday() + "sinh nhat");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);

			try {
				java.util.Date parsedDate = dateFormat.parse(user_profile.getBirthday() + "");
				java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
				user.setBirthday(sqlDate);
			} catch (ParseException e) {
				System.out.println(e);
			}

			user.setFullname(user_profile.getFullname());
			usersDao.save(user);
			ss.set("email", user);
			model.addAttribute("user", user);

		}

		else {
			model.addAttribute("bug", "Cập nhật thất bại!");
		}

		return "profile";
	}

	@RequestMapping("email")
	public String getPW() {
		return "forgotPass_1";
	}

	@RequestMapping("forgotPass_2")
	public String getCode() {
		return "forgotPass_2";
	}

	@RequestMapping("forgotPass_3")
	public String getChange() {
		return "forgotPass_3";
	}

	@PostMapping("/email/getpass")
	public String forgotPass_1(@RequestParam("email") String email, Model model) {
		if (email.equals("") || email == null) {
			model.addAttribute("msg", "Please enter your email!");
			return "forgotPass_1";
		}
		List<User> list = usersDao.findAll();
		for (User item : list) {
			if (item.getEmail().equals(email)) {
				ss.set("pw", item);
				sendPinCode(email);
				model.addAttribute("msg", "Please checking your email!");
				return "redirect:/asm/forgotPass_2";
			} else {
				model.addAttribute("msg", "The email address you entered isn't connected to an account.");
			}
		}
		return "forgotPass_1";
	}

	@PostMapping("/email/forgotPass_2")
	public String checkCode(@RequestParam("code") String code, Model model) {
		if (code.equals("") || code == null) {
			model.addAttribute("msg", "Enter Auth Code");
			return "forgotPass_2";
		}
		if (code.equals(pinCode)) {
			return "redirect:/asm/forgotPass_3";
		}
		model.addAttribute("msg", "Authentication code is incorrect");
		return "forgotPass_2";
	}

	@PostMapping("/email/forgotPass_3")
	public String checkCode(@RequestParam("pw") String pw, @RequestParam("repw") String repw, Model model) {
		boolean kt = true;

		if (pw == null || pw.isEmpty() || pw.equals("")) {
			model.addAttribute("msg_pw", "Please enter your new password");
			kt = false;
		}

		if (repw == null || repw.isEmpty() || pw.equals("")) {
			model.addAttribute("msg_repw", "Please confirm your new password");
			kt = false;
		}
		if (!kt) {
			return "forgotPass_3";
		}

		User user = ss.get("pw");
		if (pw.equals(repw)) {
//			user.setPasswords(pw);

			String magiccode = Bcryptor.encrypt(pw);

			user.setPasswords(magiccode);

			usersDao.save(user);
			return "redirect:/asm/login";
		} else {
			model.addAttribute("msg_repw", "Confirmation password is incorrect");
			return "forgotPass_3";
		}

	}

	public void sendPinCode(String toEmail) {
		pinCode = RandomStringUtils.randomNumeric(6);

		// Tạo đối tượng SimpleMailMessage để cấu hình email
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(toEmail);
		mailMessage.setSubject("Mã Pin Xác Thực");
		mailMessage.setText("Mã Pin của bạn là: " + pinCode);

		javaMailSender.send(mailMessage);
	}
	
	
	
	
	
	
	
	

	@RequestMapping("changePass")
	public String changePass(Model model) {
		return "change-password";
	}
	
	@PostMapping("changePass")
	public String changePass(Model model, 
			@RequestParam("oldpass") String oldpass, 
			@RequestParam("pass") String pass, 
			@RequestParam("confirmPass") String confirmPass) {
		
		
		if (oldpass == null || oldpass.isEmpty() || oldpass.equals("")) {
			model.addAttribute("msg", "Please enter your old password!");
			return "change-password";
		}
		
		if (pass == null || pass.isEmpty() || pass.equals("")) {
			model.addAttribute("msg", "Please enter your new password!");
			return "change-password";
		}

		if (confirmPass == null || confirmPass.isEmpty() || confirmPass.equals("")) {
			model.addAttribute("msg", "Please confirm your new password!");
			return "change-password";
		}
		// Rỗng
		
		
		User user = ss.get("email");
		
		if (!Bcryptor.matches(oldpass, user.getPasswords())) {
			model.addAttribute("msg", "The old password is incorrect!");
			return "change-password";
		}
		

		
		if (pass.equals(confirmPass)) {
			
			
			String magiccode = Bcryptor.encrypt(pass);

			user.setPasswords(magiccode);
			
			usersDao.save(user);
			
			
			
			
			model.addAttribute("msg", "Changed password successfully!");
		} else {
			model.addAttribute("msg", "Confirmation password is incorrect!");
		}
		
		return "change-password";
	}

}
