package com.asm1.demo01.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm1.demo01.DAO.BrandDAO;
import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.DAO.CategoryDAO;
import com.asm1.demo01.DAO.ColorDAO;
import com.asm1.demo01.DAO.ImageDAO;
import com.asm1.demo01.DAO.OrderDAO;
import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.DAO.SizeDAO;
import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.model.Brand;
import com.asm1.demo01.model.Category;
import com.asm1.demo01.model.Color;
import com.asm1.demo01.model.ListOrders;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Sizes;
import com.asm1.demo01.model.User;

@Controller
public class DashboardController {

	@Autowired
	UsersDao usersDao;

	@Autowired
	SizeDAO sidao;
	@Autowired
	ColorDAO colordao;
	@Autowired
	BrandDAO branddao;
	@Autowired
	CategoryDAO ctdao;
	@Autowired
	ProductDAO dao;

	@Autowired
	ImageDAO imgdao;
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	CartItemDAO cidao;

	@RequestMapping("/dashboard/index")
	public String setupindex(Model model) {
		List<Order> od=orderDAO.findAll();
		model.addAttribute("orders",od);
		List<ListOrders> countsItems = cidao.countItemsOrders();
		model.addAttribute("cItems", countsItems);
		model.addAttribute("products", dao.find4ProductsByNewestDate());
		model.addAttribute("img", imgdao.findByThumb(true));
		return "dashboardindex";
	}

	@RequestMapping("/dashboard/product")
	public String sePD(Model model) {
		Product pr = new Product();
		List<Sizes> sizes = sidao.findAll();
		List<Color> colors = colordao.findAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("colors", colors);
		List<Brand> brand = branddao.findAll();
		List<Category> cate = ctdao.findAll();
		model.addAttribute("brand", brand);
		model.addAttribute("category", cate);
		model.addAttribute("products", dao.findAll());
		model.addAttribute("product", pr);

		return "product-forms";
	}

	@RequestMapping("/dashboard/account")
	public String account(Model model) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new Date());

		List<User> listUser = usersDao.findAll();

		model.addAttribute("listUser", listUser);
		model.addAttribute("acc", new User());
		model.addAttribute("currentDate", currentDate);

		return "account-forms";
	}

	@RequestMapping("/dashboard/order")
	public String order(@ModelAttribute("order")Order order, Model model) {
		List<Order> od=orderDAO.findAll();
		model.addAttribute("orders",od);
		List<ListOrders> countsItems = cidao.countItemsOrders();
		model.addAttribute("cItems", countsItems);
		
		
		
		return "order-forms";
	}
}
