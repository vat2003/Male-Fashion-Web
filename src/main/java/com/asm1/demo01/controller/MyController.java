package com.asm1.demo01.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm1.demo01.DAO.BrandDAO;
import com.asm1.demo01.DAO.CategoryDAO;
import com.asm1.demo01.DAO.ColorDAO;
import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.DAO.SizeDAO;
import com.asm1.demo01.Service.ImageService;
import com.asm1.demo01.Service.ProductService;
import com.asm1.demo01.Service.SessionService;
import com.asm1.demo01.model.Brand;
import com.asm1.demo01.model.Category;
import com.asm1.demo01.model.Color;
import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Sizes;

import jakarta.servlet.http.HttpServletRequest;

import com.asm1.demo01.Service.ParamService;

@Controller
@RequestMapping("asm")
public class MyController {
//	@Autowired
//	ProductService productService;
//
//	@Autowired
//	ImageService imgService;
//
//	@Autowired
//	ParamService paramService;
//
//	@RequestMapping("index")
//	public String index(Model model) {
//
//		model.addAttribute("products", productService.findAll());
//		model.addAttribute("img", imgService.findByThumb(true));
//		return "index";
//	}
//
//	@RequestMapping("shop")
//	public String shop(Model model) {
//		String sort = paramService.getString("sortSelect", "");
//		System.out.println(sort);
//		if (sort.equalsIgnoreCase("desc")) {
//			model.addAttribute("products", productService.getProductsSortedByPriceDesc());
//		} else if (sort.equalsIgnoreCase("asc")) {
//			model.addAttribute("products", productService.getProductsSortedByPriceAsc());
//		} else {
//			model.addAttribute("products", productService.findAll());
//		}
//		model.addAttribute("img", imgService.findByThumb(true));
//		model.addAttribute("sort", sort);
//		return "shop";
//	}
//
//	@RequestMapping("blog")
//	public String blog() {
//
//		return "blog";
//	}
//
//	@RequestMapping("contact")
//	public String contacts() {
//
//		return "contact";
//	}
//
//	////// ID PRODUCT
//	@RequestMapping("shop-details/{id}")
//	public String shopDetails(@PathVariable("id") Integer id, Model model) {
//		List<Image> imgThumb = imgService.findByProductProductIdAndThumb(id, true);
//		List<Image> img = imgService.findByProductProductIdAndThumb(id, false);
//		model.addAttribute("product", productService.findById(id));
////		model.addAttribute("img", imgService.findByProductProductId(id));
//		model.addAttribute("img", img);
//		model.addAttribute("imgThumb", imgThumb.get(0).getNameImg());
//		return "shop-details";
//	}
//
//	/// ID BLOG
//	@RequestMapping("blog-details")
//	public String blogDetails() {
//
//		return "blog-details";
//	}
//
//	@Autowired
//	ProductService productService;
//
//	@Autowired
//	CategoryDAO catdao;
//
//	@Autowired
//	ProductDAO prodao;
//
//	@Autowired
//	BrandDAO branddao;
//
//	@Autowired
//	SizeDAO sizedao;
//
//	@Autowired
//	ColorDAO colordao;
//
//	@Autowired
//	ImageService imgService;
//
//	@Autowired
//	ParamService paramService;
//
//	@Autowired
//	SessionService sessionService;
//
//	@Autowired
//	HttpServletRequest req;
//
//	@RequestMapping("shop")
//	public String shop(Model model, @RequestParam("sortSelect") Optional<String> sortSelect,
//			@RequestParam("category") Optional<String> idCate, @RequestParam("brand") Optional<String> idBrand,
//			@RequestParam("price") Optional<String> price, @RequestParam("size") Optional<Integer> idSize,
//			@RequestParam("color") Optional<Integer> idColor, @RequestParam("search") Optional<String> search,
//			@RequestParam("p") Optional<Integer> p) {
//		String fullUrl = req.getRequestURL().toString();
//		String queryString = req.getQueryString(); // Lấy tham số trên đường dẫn
//		String sort = sortSelect.orElse(sessionService.get("sortSelect"));
//		sessionService.set("sortSelect", sort);
//		String categoryId = idCate.orElse("");
//		String brandId = idBrand.orElse("");
//		String priceId = price.orElse("");
//		Integer sizeId = idSize.orElse(null);
//		Integer colorId = idColor.orElse(null);
//		String nameProduct = search.orElse("");
//		Pageable pageable;
//		Integer page = p.orElse(0);
//		int pageSize = 3;
//
//		if (queryString != null)
//			fullUrl += "?" + queryString;
//		int lastIndex = fullUrl.lastIndexOf("&");
//
//		if (categoryId.equals(""))
//			categoryId = null;
//		if (brandId.equals(""))
//			brandId = null;
//		if (priceId.equals(""))
//			priceId = null;
//		if (nameProduct.equals(""))
//			nameProduct = null;
//
//		if (sort != null && sort.equalsIgnoreCase("desc"))
//			pageable = PageRequest.of(page, pageSize, Sort.by(Sort.Direction.DESC, "price"));
//		else if (sort != null && sort.equalsIgnoreCase("asc"))
//			pageable = PageRequest.of(page, pageSize, Sort.by(Sort.Direction.ASC, "price"));
//		else
//			pageable = PageRequest.of(page, pageSize);
//
//		Page<Product> productPage = prodao.findAll(pageable);
//		// fill
//		if (!(categoryId == null) || !(brandId == null) || !(priceId == null) || !(sizeId == null) || !(colorId == null)
//				|| !(nameProduct == null)) {
//			if (priceId != null && priceId.equals("0to50"))
//				productPage = prodao.filterProducts(categoryId, brandId, null, (double) 50, sizeId, colorId,
//						nameProduct, pageable);
//			else if (priceId != null && priceId.equals("50to100"))
//				productPage = prodao.filterProducts(categoryId, brandId, (double) 50, (double) 100, sizeId, colorId,
//						nameProduct, pageable);
//			else if (priceId != null && priceId.equals("100to150"))
//				productPage = prodao.filterProducts(categoryId, brandId, (double) 100, (double) 150, sizeId, colorId,
//						nameProduct, pageable);
//			else if (priceId != null && priceId.equals("150to200"))
//				productPage = prodao.filterProducts(categoryId, brandId, (double) 150, (double) 200, sizeId, colorId,
//						nameProduct, pageable);
//			else if (priceId != null && priceId.equals("200to250"))
//				productPage = prodao.filterProducts(categoryId, brandId, (double) 200, (double) 250, sizeId, colorId,
//						nameProduct, pageable);
//			else if (priceId != null && priceId.equals("up250"))
//				productPage = prodao.filterProducts(categoryId, brandId, (double) 250, null, sizeId, colorId,
//						nameProduct, pageable);
//			else
//				productPage = prodao.filterProducts(categoryId, brandId, null, null, sizeId, colorId, nameProduct,
//						pageable);
//		}
//
//		model.addAttribute("categoryId", categoryId);
//		model.addAttribute("brandId", brandId);
//		model.addAttribute("priceId", priceId);
//		model.addAttribute("sizeId", sizeId);
//		model.addAttribute("colorId", colorId);
//		model.addAttribute("nameProduct", nameProduct);
//		model.addAttribute("page", page = 0);
//		model.addAttribute("fullUrl", fullUrl);
//		if (lastIndex > 0)
//			model.addAttribute("subUrl", fullUrl.substring(0, lastIndex) + "&p=");
//		else
//			model.addAttribute("subUrl", "/asm/shop?p=");
//		model.addAttribute("img", imgService.findByThumb(true));
//		model.addAttribute("sort", sort);
//		model.addAttribute("products", productPage);
//		return "shop";
//	}

//	@RequestMapping("blog")
//	public String blog() {
//
//		return "blog";
//	}
//
//	@RequestMapping("contact")
//	public String contacts() {
//
//		return "contact";
//	}
//
//	@RequestMapping("shopping-cart")
//	public String shopping_cart() {
//
//		return "shopping-cart";
//	}
//
//	@RequestMapping("about")
//	public String about() {
//
//		return "about";
//	}

	////// ID PRODUCT
//	@RequestMapping("shop-details/{id}")
//	public String shopDetails(@PathVariable("id") Integer id, Model model) {
//		List<Image> imgThumb = imgService.findByProductProductIdAndThumb(id, true);
//		List<Image> img = imgService.findByProductProductIdAndThumb(id, false);
//		model.addAttribute("product", productService.findById(id));
////		model.addAttribute("img", imgService.findByProductProductId(id));
//		model.addAttribute("img", img);
//		model.addAttribute("imgThumb", imgThumb.get(0).getNameImg());
//		return "shop-details";
//	}

//	@RequestMapping("checkout")
//	public String checkout() {
//		return "checkout";
//	}
//
//	/// ID BLOG
//	@RequestMapping("blog-details")
//	public String blogDetails() {
//
//		return "blog-details";
//	}

//	@ModelAttribute("categories")
//	public List<Category> cate() {
//		return catdao.findAll();
//	}
//
//	@ModelAttribute("brands")
//	public List<Brand> brand() {
//		return branddao.findAll();
//	}
//
//	@ModelAttribute("sizes")
//	public List<Sizes> size() {
//		return sizedao.findAll();
//	}
//
//	@ModelAttribute("colors")
//	public List<Color> color() {
//		return colordao.findAll();
//	}
}
