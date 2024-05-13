package com.asm1.demo01.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.Sizes;

public interface SizeDAO extends JpaRepository<Sizes, Integer> {

}
