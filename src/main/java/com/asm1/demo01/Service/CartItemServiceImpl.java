package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.annotation.SessionScope;

import com.asm1.demo01.DAO.CartDAO;
import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.DAO.ColorDAO;
import com.asm1.demo01.DAO.OrderDAO;
import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.DAO.SizeDAO;
import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.Color;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Sizes;
import com.asm1.demo01.model.User;

@SessionScope
@Controller
public class CartItemServiceImpl implements CartItemService {
	@Autowired
	CartItemDAO cartItemDAO;
	
	@Autowired
	CartDAO cartDAO;

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	SessionService sessionService;

	@Autowired
	CartItemService cartItemService;

	@Autowired
	UsersDao userDAO;

	@Autowired
	ColorDAO colorDAO;

	@Autowired
	SizeDAO sizeDAO;

	@Autowired
	CartService cartService; // Sử dụng CartService để truy cập thông tin về giỏ hàng

	@Autowired
	ProductService productService; // Sử dụng ProductService để truy cập thông tin về sản phẩm

	@Override
	public CartItem addProductToCart(Integer productId, Integer cartId, Integer size, Integer qty) {
		// Đầu tiên, bạn cần tìm CartItem tương ứng trong cơ sở dữ liệu bằng productId
		// và cartId (nếu tồn tại).
		Optional<CartItem> existingCartItem = cartItemDAO.findByProductIdAndCartId(productId, cartId);
		Product product = productService.findById(productId).orElse(null);

		if (existingCartItem.isPresent()) {
			// Nếu CartItem đã tồn tại, tăng số lượng lên.
			CartItem cartItem = existingCartItem.get();
			int currentQuantity = cartItem.getQuantity();
			cartItem.setQuantity(currentQuantity + 1);
			return cartItemDAO.save(cartItem);
		} else {
			// Nếu CartItem chưa tồn tại, bạn cần tạo mới CartItem và thêm vào Cart.
			CartItem newCartItem = new CartItem();

			newCartItem.setProduct(product);
			newCartItem.setCart(cartService.getCartByUser(sessionService.get("email")));
			newCartItem.setPrice(product.getPrice());

			newCartItem.setQuantity(qty);

			Sizes sizes = sizeDAO.findById(size).orElse(null);

			newCartItem.setSize(sizes.getName());

			return cartItemDAO.save(newCartItem);
		}
	}

	@Override
	public void minusOPlus(Integer cartItemId, String qty) {
		CartItem cartItem = cartItemDAO.findById(cartItemId).orElse(null);

		if (cartItem.getQuantity() == 1 && qty.equals("minus")) {
			removeProductFromCart(cartItemId);
			return;
		}

		if (qty.equals("minus")) {
			cartItem.setQuantity(cartItem.getQuantity() - 1);
		} else if (qty.equals("plus") && cartItem.getQuantity() < cartItem.getProduct().getQuantity()) {
			cartItem.setQuantity(cartItem.getQuantity() + 1);
		}

		cartItemDAO.save(cartItem);

	}

	@Override
	public void removeProductFromCart(Integer cartItemId) {
		CartItem ci= cartItemDAO.findById(cartItemId).orElse(new CartItem());
		Cart id = ci.getCart();
		ci.setCart(null);
		cartItemDAO.delete(ci);
	}

	@Override
	public CartItem updateCartItemQuantity(Integer cartItemId, Integer newQuantity) {
		CartItem cartItem = cartItemDAO.getById(cartItemId); // Lấy CartItem dựa trên ID
		cartItem.setQuantity(newQuantity);
		return cartItemDAO.save(cartItem); // Cập nhật và lưu CartItem
	}

	@Override
	public void clearCart(Integer userId) {

		User user = sessionService.get("email");
//		user = userDAO.getOne(userId);
		Cart cart = cartService.getCartByUser(user); // Lấy thông tin giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// Xóa tất cả các CartItem thuộc giỏ hàng
		for (CartItem cartItem : cartItems) {
			cartItemDAO.delete(cartItem);
		}

	}

	@Override
	public Iterable<CartItem> getCartItems(Integer cartId) {
		// Lấy danh sách CartItem của Cart bằng cartId.
		return cartItemService.getCartItems(cartId);
	}

	@Override
	public int getCartItemCount(User user) {
		// Đếm số lượng CartItem của Cart bằng user.

		return cartItemDAO.countByCart(cartService.getCartByUser(user));
	}

	@Override
	public double getCartTotalAmount(User user) {
	    try {
	    	 Cart cart = cartService.getCartByUser(user);
	    	 double totalAmount = 0.0;
	 	    for (CartItem cartItem : cart.getCartItems()) {
	 	        totalAmount += cartItem.getPrice();
	 	    }
	 	    
	 	    return totalAmount;
		} catch (Exception e) {
			// TODO: handle exception
			 return 0; 
		}
	   
	}

	@Override
	public void updateCartItem(CartItem cartItem) {
		// Ensure that the cart item is not null
		if (cartItem != null) {
			// Update the cart item in the database
			cartItemDAO.save(cartItem);
		} else {
			// Handle the case where the cart item is null (optional)
			// You can throw an exception or handle it as needed
		}
	}

	@Override
	public void addCartItem(CartItem cartItem) {
		// Ensure that the cart item is not null
		if (cartItem != null) {
			// Save the new cart item to the database
			cartItemDAO.save(cartItem);
		} else {
			// Handle the case where the cart item is null (optional)
			// You can throw an exception or handle it as needed
		}
	}

	@Override
	public CartItem findCartItemByProductAndCart(Product product, Cart cart) {
		// Ensure that both product and cart are not null
		if (product != null && cart != null) {
			// Query the database to find the cart item with the given product and cart
			return cartItemDAO.findByProductAndCart(product, cart);
		} else {
			// Handle the case where product or cart is null (optional)
			// You can throw an exception or handle it as needed
			return null;
		}
	}

	@Override
	public int getCartItemCountQuantity(User user) {

		return cartItemDAO.sumQuantityByCart(cartService.getCartByUser(user));
	}

	@Override
	public List<Product> findProductsByOrder(Order order) {
//		List<Product> 
		return null;
	}

}
