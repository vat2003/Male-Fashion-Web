package com.asm1.demo01.controller;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.asm1.demo01.DAO.BrandDAO;
import com.asm1.demo01.DAO.CategoryDAO;
import com.asm1.demo01.DAO.ColorDAO;
import com.asm1.demo01.DAO.ImageDAO;
import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.DAO.SizeDAO;
import com.asm1.demo01.Service.ParamService;
import com.asm1.demo01.Service.ProductService;
import com.asm1.demo01.model.Brand;
import com.asm1.demo01.model.Category;
import com.asm1.demo01.model.Color;
import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Sizes;

@Controller
public class MAProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	ImageDAO imgdao;
	@Autowired
	SizeDAO sidao;
	@Autowired
	ColorDAO colordao;
	@Autowired
	BrandDAO branddao;
	@Autowired
	CategoryDAO ctdao;
	@Autowired
	ParamService param;

	@RequestMapping("dashboard/save")
	public String Create(@ModelAttribute("product") Product product, @RequestParam("pr") Integer id, Model model,
			@RequestParam("description") String description, @RequestParam("img1") MultipartFile img1,
			@RequestParam("img2") MultipartFile img2, @RequestParam("img3") MultipartFile img3) {
		List<Image> images = imgdao.findByProductProductId(product.getProductId());
		for (int i = 0; i < images.size(); i++) {
			System.out.println("iamge " + i + " : " + images.get(i));

		}
		if (product.getName().isBlank()) {
			model.addAttribute("errorname", "Please Enter The Name of the Product.");
		}
		if (product.getPrice() == null) {
			model.addAttribute("errorprice", "Please Enter The Price of the Product.");
		}
		if (id >= 0) {
			Optional<Product> existingProduct = dao.findById(id);
			if (existingProduct.isPresent()) {
				Product existing = existingProduct.get();
				updateProductFields(existing, product, description);

				dao.save(existing);
				saveOrupdateImg(img1, img2, img3, product, images);
				return "forward:/dashboard/product";
			}
		} else if (id < 0) {
			dao.save(product);
			saveOrupdateImg(img1, img2, img3, product, images);
			return "forward:/dashboard/product";
		}

		model.addAttribute("products", dao.findAll());
		return "forward:/dashboard/product";

	}

	private void updateProductFields(Product existing, Product newProduct, String description) {
		existing.setName(newProduct.getName());
		existing.setPrice(newProduct.getPrice());
		existing.setDescription(description);
		existing.setCategory(newProduct.getCategory());
		existing.setDiscount(newProduct.getDiscount());
		existing.setColors(newProduct.getColors());
		existing.setSizes(newProduct.getSizes());
		existing.setBrand(newProduct.getBrand());
		existing.setQuantity(newProduct.getQuantity());

	}

	@RequestMapping("dashboard/edit/{id}")
	public String getEdit(@PathVariable("id") Integer id, Model model) {
		Product it = dao.findById(id).get();
		model.addAttribute("product", it);

		model.addAttribute("products", dao.findAll());

		List<Sizes> sizes = sidao.findAll();
		List<Color> colors = colordao.findAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("colors", colors);
		List<Brand> brand = branddao.findAll();
		List<Category> cate = ctdao.findAll();
		model.addAttribute("brand", brand);
		model.addAttribute("category", cate);

		return "product-forms";
	}

	@RequestMapping("dashboard/delete/{id}")
	public String getDelete(@PathVariable("id") Integer id, Model model) {
		imgdao.deleteByProductProductId(id);
		dao.deleteById(id);
		return "forward:/dashboard/product";
	}

	public void saveOrupdateImg(MultipartFile img1, MultipartFile img2, MultipartFile img3, Product product,
			List<Image> imgs) {
		MultipartFile[] imgArray = { img1, img2, img3 };
		String uploadDirThumbImg = "/img/product/";

		String uploadDirSpImg = "/img/shopping-details/";
		
		for (int i = 0; i < imgArray.length; i++) {
			MultipartFile img = imgArray[i];

			if (!img.isEmpty()) {
				String imgName = StringUtils.cleanPath(img.getOriginalFilename());

				Image image = null;
				if (i < imgs.size()) {
					image = imgs.get(i);
					image.setNameImg(imgName);
				} else {
					image = new Image();
					image.setNameImg(imgName);
					image.setThumb(i == 0);
					image.setProduct(product);
				}

				imgdao.save(image);
				param.save(img, uploadDirThumbImg);
			}
		}
	}

}
