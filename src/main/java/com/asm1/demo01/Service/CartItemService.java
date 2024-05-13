package com.asm1.demo01.Service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.User;

public interface CartItemService {
	CartItem addProductToCart(Integer productId, Integer cartId, Integer size, Integer qty);

	void removeProductFromCart(Integer cartItemId);

	CartItem updateCartItemQuantity(Integer cartItemId, Integer newQuantity);

	void clearCart(Integer cartId);

	Iterable<CartItem> getCartItems(Integer cartId);

	int getCartItemCount(User user);

	double getCartTotalAmount(User user);

	void updateCartItem(CartItem existingCartItem);

	void addCartItem(CartItem cartItem);

	CartItem findCartItemByProductAndCart(Product product, Cart cart);

	List<Product> findProductsByOrder(Order order);

	void minusOPlus(Integer cartItemId, String qty);

	int getCartItemCountQuantity(User user);

}