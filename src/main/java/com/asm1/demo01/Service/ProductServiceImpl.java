package com.asm1.demo01.Service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public Product save(Product entity) {
		return productDAO.save(entity);
	}

	@Override
	public List<Product> saveAll(List<Product> entities) {
		return (List<Product>) productDAO.saveAll(entities);
	}

	@Override
	public Optional<Product> findById(Integer id) {
		return productDAO.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return productDAO.existsById(id);
	}

	@Override
	public List<Product> findAll() {
		return (List<Product>) productDAO.findAll();
	}

	@Override
	public List<Product> findAllById(List<Integer> ids) {
		return (List<Product>) productDAO.findAllById(ids);
	}

	@Override
	public long count() {
		return productDAO.count();
	}

	@Override
	public void deleteById(Integer id) {
		productDAO.deleteById(id);
	}

	@Override
	public void delete(Product entity) {
		productDAO.delete(entity);
	}

	@Override
	public void deleteAllById(List<Integer> ids) {
		productDAO.deleteAllById(ids);
	}

	@Override
	public void deleteAll(Iterable<? extends Product> entities) {
		productDAO.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		productDAO.deleteAll();
	}

	@Override
	public List<Product> findByStatus(String status) {
		return productDAO.findByStatus(status);
	}

	@Override
	public List<Image> findImgByProductId(Integer product) {
		return productDAO.findImgByProductId(product);
	}

	@Override
	public List<Product> getProductsSortedByPriceDesc() {
		List<Product> products = (List<Product>) productDAO.findAll();
		Collections.sort(products, Comparator.comparing(Product::getPrice).reversed());
		return products;
	}

	@Override
	public List<Product> getProductsSortedByPriceAsc() {
		List<Product> products = (List<Product>) productDAO.findAll();
		Collections.sort(products, Comparator.comparing(Product::getPrice));
		return products;
	}

	@Override
	public List<Product> findRandomProducts() {
		return productDAO.findRandomProducts();
	}
	
	
}
