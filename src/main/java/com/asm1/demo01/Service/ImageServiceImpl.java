package com.asm1.demo01.Service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import com.asm1.demo01.DAO.ImageDAO;
import com.asm1.demo01.model.Image;



@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
	ImageDAO imageDAO;

	@Override
	public List<Image> findAll() {
		return imageDAO.findAll();
	}

	@Override
	public List<Image> findByThumb(Boolean thumb) {
		return imageDAO.findByThumb(thumb);
	}

	@Override
	public List<Image> findByProductProductId(Integer productId) {
		return imageDAO.findByProductProductId(productId);
	}

	@Override
	public List<Image> findByProductProductIdAndThumb(Integer productId, Boolean thumb) {
		return imageDAO.findByProductProductIdAndThumb(productId, thumb);
	}
	
//	@Override
//	public List<Image> findByProductId(Integer productId) {
//		
//		return imageDAO.findByProductId(productId);
//	}
//	

	

	
}
