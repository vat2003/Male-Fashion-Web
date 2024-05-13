package com.asm1.demo01.Service;

import java.util.List;

import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.Order;

public interface OrderService {
	List<CartItem> findProductByOrder(Order order);
}

//lấy product = cartitem = order