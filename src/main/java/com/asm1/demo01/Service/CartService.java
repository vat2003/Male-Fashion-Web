package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;

import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.User;

public interface CartService {

	Cart createCart(User user);

	Cart getCartByUser(User user);

	CartItem addProductToCart(Cart cart, Integer productId);

	void removeProductFromCart(CartItem cartItem);

	CartItem updateCartItemQuantity(CartItem cartItem, Integer newQuantity);

	void clearCart(Cart cart);

	Iterable<CartItem> getCartItems(Cart cart);

	int getCartItemCount(Cart cart);

	double getCartTotalAmount(Cart cart, List<CartItem> cartItem);

}
