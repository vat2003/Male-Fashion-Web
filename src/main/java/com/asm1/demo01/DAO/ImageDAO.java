package com.asm1.demo01.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;

import jakarta.transaction.Transactional;

public interface ImageDAO extends JpaRepository<Image, Integer> {
	List<Image> findByThumb(Boolean thumb);

	List<Image> findByProductProductId(Integer productId);

	List<Image> findByProductProductIdAndThumb(Integer productId, Boolean thumb);

	@Transactional
	void deleteByProductProductId(Integer productId);

}
