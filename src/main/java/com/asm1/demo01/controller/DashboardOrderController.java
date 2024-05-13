package com.asm1.demo01.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm1.demo01.DAO.CartItemDAO;
import com.asm1.demo01.DAO.ImageDAO;
import com.asm1.demo01.DAO.OrderDAO;
import com.asm1.demo01.DAO.UsersDao;
import com.asm1.demo01.Service.OrderService;
import com.asm1.demo01.model.Brand;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.Category;
import com.asm1.demo01.model.Color;
import com.asm1.demo01.model.CountProductOrder;
import com.asm1.demo01.model.ListOrders;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Sizes;

@Controller
@RequestMapping("dashboard/order")
public class DashboardOrderController {
	@Autowired
	OrderDAO orderdao;
	@Autowired
	CartItemDAO cartItemDAO;
	@Autowired
	OrderService orderService;
	
	@Autowired
	ImageDAO imgdao;
	
	@Autowired
	UsersDao usersDao;
	
	@Autowired
	CartItemDAO cidao;
	
	@RequestMapping("/update")
	public String updateOrder(@ModelAttribute("order") Order updatedOrder, Model model) {
	    Optional<Order> existingOrderOptional = orderdao.findById(updatedOrder.getOrderId());

	    if (existingOrderOptional.isPresent()) {
	        Order existingOrder = existingOrderOptional.get();
	        
	        existingOrder.setFullname(updatedOrder.getFullname());
	        existingOrder.setAddress(updatedOrder.getAddress());
	        existingOrder.setPhoneNum(updatedOrder.getPhoneNum());
	        existingOrder.setEmail(updatedOrder.getEmail());
	        existingOrder.setNote(updatedOrder.getNote());
	        
	        orderdao.save(existingOrder);
	    }
	    
	    return "redirect:/dashboard/order";
	}
	
	
	@RequestMapping("/delete")
	public String deleteOrder(@ModelAttribute("order") Order delete) {
		 Optional<Order> existingOrderOptional = orderdao.findById(delete.getOrderId());
		 if (existingOrderOptional.isPresent()) {
		        Order existingOrder = existingOrderOptional.get();
		        existingOrder.setCartItems(null);
		        existingOrder.setUser(null);
		        orderdao.delete(existingOrder);
		 }
	    return "redirect:/dashboard/order";
	}


	@RequestMapping("/edit/{id}")
	public String getEdit(@PathVariable("id") Integer id, Model model) {
		Optional<Order> it = orderdao.findById(id);
		model.addAttribute("order", it);
		System.err.println(it);
		List<Order> od = orderdao.findAll();
		model.addAttribute("orders", od);
		Order order = it.orElse(new Order());
		List<CartItem> listc = cartItemDAO.findByOrder(order);
		ListOrders countOrderById = cartItemDAO.countItemsOrdersByOrderId(id);
		model.addAttribute("products", listc);
		model.addAttribute("ordId", countOrderById);
		model.addAttribute("imgs", imgdao.findByThumb(true));
		System.out.println(imgdao.findByThumb(true));
		List<ListOrders> countsItems = cidao.countItemsOrders();
		model.addAttribute("cItems", countsItems);

		return "order-forms";
	}
	
	



}
