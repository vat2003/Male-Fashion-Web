package com.asm1.demo01.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm1.demo01.model.Image;

public interface ImageService {

	List<Image> findAll();

	List<Image> findByThumb(Boolean thumb);

	List<Image> findByProductProductId(Integer productId);

	List<Image> findByProductProductIdAndThumb(Integer productId, Boolean thumb);

	// List<Image> findByProductId(Integer productId);

}
