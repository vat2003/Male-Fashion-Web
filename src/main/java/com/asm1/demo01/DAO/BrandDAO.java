package com.asm1.demo01.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.Brand;
import com.asm1.demo01.model.Cart;

public interface BrandDAO extends JpaRepository<Brand, String> {

}
