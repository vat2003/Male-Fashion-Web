package com.asm1.demo01.interceptor;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.asm1.demo01.Service.SessionService;
import com.asm1.demo01.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		User user = (User) session.get("email"); // lấy từ session
		
		String error = "";
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa");
		
		if (user == null) { // chưa đăng nhập
			error = "Please login!";
		}

		// không đúng vai trò
		else if (!user.getRole() && ( uri.startsWith("/admin/") || uri.startsWith("/dashboarh/") ||  uri.startsWith("/dashboard/") )  ) {
			error = "Access denied!";
		}
		
//		System.out.println(user.getUsername());
		if (error.length() > 0) { // có lỗi
			session.set("security-uri", uri);
			response.sendRedirect("/asm/login?error=" + error);
			return false;
		}
		return true;
	}
}
