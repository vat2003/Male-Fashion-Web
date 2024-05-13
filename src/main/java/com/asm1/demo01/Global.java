package com.asm1.demo01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.asm1.demo01.Service.CartItemService;
import com.asm1.demo01.Service.CartService;
import com.asm1.demo01.Service.SessionService;
import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.User;

@ControllerAdvice
public class Global {
	@Autowired
	SessionService sessionService;
	@Autowired
	CartService cartService;
	@Autowired
	CartItemService cartItemService;

	@ModelAttribute("dem")
	public Integer count() {
		int counting = 0;
		User user = sessionService.get("email");
		if (user == null) {
			System.err.println("USER IS NULL. PLEASE LOGIN");
			// Handle the case when the user is not logged in
			// You may choose to redirect them to a login page or handle it differently

		}
		Cart cart = cartService.getCartByUser(user);
		try {
			List<CartItem> cartItemList = cart.getCartItems();
			if (cartItemList != null) {
				

				try {
					counting = cartItemService.getCartItemCountQuantity(user);

				} catch (Exception e) {
					counting = 0;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			counting = 0;
		}

		// tính tổng tiền sau khi giảm giá

		return counting;

	}

	@ModelAttribute("endOfDiscount")
	public Double finalPrice() {
		double counting = 0;
		User user = sessionService.get("email");
		if (user == null) {
			System.err.println("USER IS NULL. PLEASE LOGIN");
			// Handle the case when the user is not logged in
			// You may choose to redirect them to a login page or handle it differently

		}
		Cart cart = cartService.getCartByUser(user);
		try {
			List<CartItem> cartItemList = cart.getCartItems();
			if (cartItemList != null) {
				// tính tổng tiền sau khi giảm giá
				double endOfDiscount = 0.0;
				for (CartItem item : cartItemList) {
					endOfDiscount += (item.getProduct().getPrice()
							- (item.getProduct().getPrice() * item.getProduct().getDiscount() / 100))
							* item.getQuantity();
				}
				counting = endOfDiscount;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			counting = 0;
		}

		return counting;

	}
	@ModelAttribute("welcome")
	public String welcome() {
		User us = (User) sessionService.get("email");
		String welcome = "";
		if (us != null) {
			welcome = "Welcome "+ us.getFullname() + " .";
		}
	
		
		return welcome;
		
	}

	
	
	
}
