package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;

public interface ProductService {

	void deleteAll();

	void deleteAll(Iterable<? extends Product> entities);

	void deleteAllById(List<Integer> ids);

	void delete(Product entity);

	void deleteById(Integer id);

	long count();

	List<Product> findAllById(List<Integer> ids);

	List<Product> findAll();

	boolean existsById(Integer id);

	Optional<Product> findById(Integer id);

	List<Product> saveAll(List<Product> entities);

	Product save(Product entity);

	List<Product> findByStatus(String status);

	List<Image> findImgByProductId(Integer product);

	public List<Product> getProductsSortedByPriceDesc();

	public List<Product> getProductsSortedByPriceAsc();

	List<Product> findRandomProducts();

}
