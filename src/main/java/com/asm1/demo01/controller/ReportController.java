package com.asm1.demo01.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm1.demo01.DAO.ProductDAO;
import com.asm1.demo01.Service.ExcelExportService;
import com.asm1.demo01.model.Report;



@Controller
public class ReportController {

	@Autowired
	ProductDAO dao;
	@Autowired
	ExcelExportService excelService;
	
	@RequestMapping("dashboard/report")
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		
		List<Report> itemsByDate = dao.getInventoryByDate();
		model.addAttribute("itemsByDate", itemsByDate);
		return "report";
		
	}
	
	@RequestMapping("report/index")
	public String index(Model model) {
		
		
		return "report";
	}
	
	@RequestMapping("dashboard/report/excel")
	public String excel(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		List<Report> itemsByDate = dao.getInventoryByDate();
		LocalDate date = LocalDate.now();
		try {
			excelService.exportToExcel(items,itemsByDate, "REPORT_DATA_" + date.toString() + ".xlsx");
			System.err.println("Xuat thanh cong");
		} catch (Exception e) {

			System.err.println("Xuat that bai");

		}
		
		return "redirect:/dashboard/report";
	}


}
