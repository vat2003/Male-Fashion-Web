package com.asm1.demo01.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.User;

public interface CartDAO extends JpaRepository<Cart, Integer> {

	Cart findByUser(User user);
	

}
