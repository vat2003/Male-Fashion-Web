package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm1.demo01.DAO.OrderDAO;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<CartItem> findProductByOrder(Order order) {
		Optional<Order> orders = orderDAO.findById(order.getOrderId());
		List<CartItem> cartItemsList = null;

		if (orders.isPresent()) {
			Order order2 = orders.get();

			// Now you can use a foreach loop to iterate over the elements
			for (CartItem cartItem : orders.get().getCartItems()) {
				cartItemsList.add(cartItem);
			}
		}

		return cartItemsList;
	}

}
