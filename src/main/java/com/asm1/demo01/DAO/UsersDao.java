package com.asm1.demo01.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.User;

public interface UsersDao extends JpaRepository<User, Integer> {
	
	User findByEmail(String email);
}
