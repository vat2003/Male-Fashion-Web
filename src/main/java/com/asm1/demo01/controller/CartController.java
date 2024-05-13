package com.asm1.demo01.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm1.demo01.DAO.CartDAO;
import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.DAO.ImageDAO;
import com.asm1.demo01.DAO.OrderDAO;
import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.DAO.ShippingUnitDAO;
import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.Service.CartItemService;
import com.asm1.demo01.Service.CartService;
import com.asm1.demo01.Service.ImageService;
import com.asm1.demo01.Service.ProductService;
import com.asm1.demo01.Service.SessionService;
import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.CreditCartAccount;
import com.asm1.demo01.model.DebitCardPayment;
import com.asm1.demo01.model.ListOrders;
import com.asm1.demo01.model.MomoEWalletPayment;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.ShippingUnit;
import com.asm1.demo01.model.User;

import jakarta.validation.Valid;

@Controller
@RequestMapping("asm")
public class CartController {

	@Autowired
	ImageService imgService;


	@Autowired
	ImageDAO imgdao;
	
	
	@Autowired
	CartDAO cartDAO;

	@Autowired
	CartService cartService;

	@Autowired
	ShippingUnitDAO shippingUnitDAO;

	@Autowired
	CartItemService cartItemService;

	@Autowired
	CartItemDAO cartItemDAO;

	@Autowired
	SessionService sessionService;

	@Autowired
	ProductService productService;

	@Autowired
	UsersDao userDAO;

	@Autowired
	OrderDAO orderdao;

	String selectedOption;
	double endOfDiscount = 0.0;
	static double finalendprice = 0.0;
	static int counting = 0;

	@RequestMapping("shop/addToCart/{productId}")
	public String addToCart(@PathVariable("productId") Integer id, @RequestParam("sizeId") Integer size,
			@RequestParam("qty") Integer qty, Model model) {
		System.err.println("SIZE: " + size);
		System.err.println("QUANTITY: " + qty);
		User user = sessionService.get("email");
		if (user != null) {
//
			System.err.println("USER ID: " + user.getUserID());
			// Retrieve the user's cart
			Cart cart0 = cartService.getCartByUser(user);

			// Check if the cart exists
			if (cart0 == null) {
				System.err.println("CART0 IS NULL");
				cart0 = cartService.createCart(user);
				System.err.println("CART0 AFTER CREATE NEW ++ " + cart0.getCartId());
			}

			// Retrieve the product information from the database based on productId
			Product product = productService.findById(id).orElse(null);
			System.err.println("PRODUCT +++ " + product.getName());

			System.err.println("PRODUCT :" + product.getName());
			if (product != null) {
				CartItem addedCartItem = cartItemService.addProductToCart(id, cart0.getCartId(), size, qty);
				cartDAO.save(cart0);

				updateTotalAmount(cart0, cartItemDAO.findAll());

			}
			return "redirect:/asm/shop";
//

		} else {
			System.err.println("USER IS NULL. PLEASE LOGIN");
			// Handle the case when the user is not logged in
			// You may choose to redirect them to a login page or handle it differently
			return "redirect:/asm/login";
		}
	}

	public void updateTotalAmount(Cart cart, List<CartItem> cartItemsList) {
//		List<CartItem> cartItemsList = cartItemDAO.findAll();
		cartService.getCartTotalAmount(cart, cartItemsList);
	}

	@RequestMapping("shopping-cart")
	public String shopping_cart(Model model) {

		User user = sessionService.get("email");
		if (user == null) {
			System.err.println("USER IS NULL. PLEASE LOGIN");
			// Handle the case when the user is not logged in
			// You may choose to redirect them to a login page or handle it differently
			return "redirect:/asm/login";
		}

		if (user != null) {
			//
			System.err.println("USER ID: " + user.getUserID());
			// Retrieve the user's cart
			Cart cart0 = cartService.getCartByUser(user);

			// Check if the cart exists
			if (cart0 == null) {
				System.err.println("CART0 IS NULL");
				cart0 = cartService.createCart(user);
				System.err.println("CART0 AFTER CREATE NEW ++ " + cart0.getCartId());
			}
		}

		Cart cart = cartService.getCartByUser(user);

		List<CartItem> cartItemList = cart.getCartItems();

		// tính tổng tiền sau khi giảm giá
		double endOfDiscount = 0.0;
		if(cartItemList!=null) {
		for (CartItem item : cartItemList) {
			endOfDiscount += (item.getProduct().getPrice()
					- (item.getProduct().getPrice() * item.getProduct().getDiscount() / 100)) * item.getQuantity();
			}
		}
		model.addAttribute("img", imgService.findByThumb(true));

		model.addAttribute("cartItem", cartItemList);

		try {
			counting = cartItemService.getCartItemCountQuantity(user);
			model.addAttribute("count", counting);

		} catch (Exception e) {
			model.addAttribute("count", 0);
		}
		finalendprice = endOfDiscount;
		model.addAttribute("subtotal", cartService.getCartTotalAmount(cart, cartItemList));
		model.addAttribute("endOfDiscount", finalendprice);
		model.addAttribute("user", user);

		model.addAttribute("selectedOption", selectedOption);
		return "shopping-cart";
	}

	@RequestMapping("paymentMethod")
	public String paymentMethod(Model model, @ModelAttribute("creditCardAccount") CreditCartAccount creditCartAccount,
			@ModelAttribute("shippingUnit") ShippingUnit shippingUnit) {
		User user = sessionService.get("email");
		Cart cart = cartService.getCartByUser(user);
		List<CartItem> cartItemList = cart.getCartItems();
		double endOfDiscount = 0.0;
		for (CartItem item : cartItemList) {
			endOfDiscount += (item.getProduct().getPrice()
					- (item.getProduct().getPrice() * item.getProduct().getDiscount() / 100)) * item.getQuantity();
		}
		model.addAttribute("imgs", imgdao.findByThumb(true));
		List<ListOrders> countsItems = cartItemDAO.countItemsOrders();
		model.addAttribute("cItems", countsItems);
		model.addAttribute("products",cartItemList);
		model.addAttribute("customer", user);
		model.addAttribute("shippingUnits", shippingUnitDAO.findAll());
		model.addAttribute("countTotal", cartItemService.getCartItemCountQuantity(user));
		model.addAttribute("subtotal", endOfDiscount);
		model.addAttribute("total", endOfDiscount);

		return "paymentMethod";
	}

//	mathematical operations 	
	@RequestMapping("cart/update/{cartItemId}/{mo}")
	public String updateQuantity(@PathVariable("cartItemId") Integer cartItemId, @PathVariable("mo") String mo) {

		cartItemService.minusOPlus(cartItemId, mo);

		return "redirect:/asm/shopping-cart";

	}

	@RequestMapping("cart/remove/{cartItemId}")
	public String removePD(@PathVariable("cartItemId") Integer cartItemId) {
		cartItemService.removeProductFromCart(cartItemId);
		return "redirect:/asm/shopping-cart";
	}

	@PostMapping("shopping-cart/paymentMethod/selected/momoEWallet")
	public String momoWalletSelected(Model model, @Valid @ModelAttribute("momo") MomoEWalletPayment momo,
			BindingResult bindingResult) {
		System.out.println("MOMO: " + momo.getMomoAccount());
		selectedOption = "momoEWallet";
		return "redirect:/asm/shopping-cart";
	}

	@PostMapping("shopping-cart/paymentMethod/selected/debitCardPayment")
	public String debitCardSelected(Model model, @Valid @ModelAttribute("debitCard") DebitCardPayment debitCard,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("ERRORS");
		}
		System.out.println("DEBIT CARD: " + debitCard.getCardOwner());
		System.out.println("DEBIT CARD: " + debitCard.getCardNumber());
		selectedOption = "debitCardPayment";
		return "redirect:/asm/shopping-cart";
	}

	@RequestMapping("shopping-cart/detail-invoice")
	public String invoice(Model model) {

		return "detail-invoice";
	}

	@RequestMapping("shopping-cart/processShippingForm")
	public String checkout(Model model, @ModelAttribute("creditCardAccount") CreditCartAccount creditCartAccount,
			@ModelAttribute("shippingUnit") ShippingUnit shippingUnit, @RequestParam("fullname") String fullname,
			@RequestParam("phoneNum") String phoneNum, @RequestParam("address") String address,
			@RequestParam("note") String note) {
		User user = sessionService.get("email");

		// Tải danh sách orders trong phạm vi session
		Hibernate.initialize(user.getOrders());

		Cart cart = cartService.getCartByUser(user);
		System.out.println(user);
		System.out.println(cart);
		List<CartItem> cartItemList = cart.getCartItems();
		System.out.println("****************************" + cartItemList);
		double endOfDiscount = 0.0;
		for (CartItem item : cartItemList) {
			endOfDiscount += (item.getProduct().getPrice()
					- (item.getProduct().getPrice() * item.getProduct().getDiscount() / 100)) * item.getQuantity();
		}
		Order order = new Order();
		System.out.println(cartItemList + "----------------------");
		order.setShippingUnit(shippingUnit);
		System.out.println("****************" + cartItemList);
		order.setTotalAmount(endOfDiscount);
		order.setUser(user);
		order.setEmail(user.getEmail());
		order.setFullname(fullname);
		order.setAddress(address);
		order.setPhoneNum(phoneNum);
		order.setNote(note);
		System.out.println("5");
		orderdao.save(order);
		for (CartItem ct : cartItemList) {
			ct.setOrder(order);
			ct.setCart(null); // Gán null cho thuộc tính "cart" của CartItem
			cartItemDAO.save(ct);
			System.out.println("aaaaaaaaaaaaaaa" + order);
		}

		System.out.println("****************" + user);
		System.out.println("aaaaaaaaaaaaaaa" + order);
		return "result";
	}

}
