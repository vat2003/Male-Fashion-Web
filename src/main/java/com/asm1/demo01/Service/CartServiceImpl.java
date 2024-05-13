package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.annotation.SessionScope;

import com.asm1.demo01.DAO.CartDAO;
import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.User;

@SessionScope
@Controller
public class CartServiceImpl implements CartService {
	@Autowired
	CartDAO cartDAO;

	@Autowired
	CartItemDAO cartItemDAO;

	@Override
	public Cart createCart(User user) {
		// Create a new cart for the user
		Cart cart = new Cart();
		cart.setUser(user);
		cart.setTotalAmount(0.0);
		return cartDAO.save(cart);
	}

	@Override
	public Cart getCartByUser(User user) {
		// Find the cart associated with the user
//		return cartDAO.findById(user.getUserID());
		return cartDAO.findByUser(user);
	}

	@Override
	public CartItem addProductToCart(Cart cart, Integer productId) {
		// Create a new cart item and associate it with the cart
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		// You might want to set other properties of the cart item here
		return cartItemDAO.save(cartItem);
	}

	@Override
	public void removeProductFromCart(CartItem cartItem) {
		// Remove the cart item from the cart
		cartItemDAO.delete(cartItem);

	}

	@Override
	public CartItem updateCartItemQuantity(CartItem cartItem, Integer newQuantity) {
		// Update the quantity of the cart item
		cartItem.setQuantity(newQuantity);
		return cartItemDAO.save(cartItem);
	}

	@Override
	public void clearCart(Cart cart) {
		// Remove all cart items associated with the cart
		cartItemDAO.deleteByCart(cart);

	}

	@Override
	public Iterable<CartItem> getCartItems(Cart cart) {
		// Get all cart items associated with the cart
		return cartItemDAO.findByCart(cart);
	}

	@Override
	public int getCartItemCount(Cart cart) {
		// Get the count of cart items associated with the cart
		return cartItemDAO.countByCart(cart);
	}

	@Override
	public double getCartTotalAmount(Cart cart, List<CartItem> cartItems) {
		double totalAmount = 0.0;

		for (CartItem cartItem : cartItems) {
			double itemTotal = cartItem.getQuantity() * cartItem.getProduct().getPrice();
			totalAmount += itemTotal;
		}
		cart.setTotalAmount(totalAmount);
		cartDAO.save(cart);
		return totalAmount;
	}

}
