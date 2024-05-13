package com.asm1.demo01.Service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.asm1.demo01.model.Report;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class ExcelExportService {
	public void exportToExcel(List<Report> reports1,List<Report> reports2, String filePath) throws IOException {
		try (Workbook workbook = new XSSFWorkbook()) {
			Sheet sheet1 = workbook.createSheet("CATEGORY");
			Sheet sheet2 = workbook.createSheet("TIMING");
			
			//SHEET 1
			// Create a header row
			Row headerRow1 = sheet1.createRow(0);
			headerRow1.createCell(0).setCellValue("STT");
			headerRow1.createCell(1).setCellValue("Category");
			headerRow1.createCell(2).setCellValue("Total");
			headerRow1.createCell(3).setCellValue("Quantity");

			// Populate data rows
			for (int i = 0; i < reports1.size(); i++) {
				Report report = reports1.get(i);
				Row dataRow1 = sheet1.createRow(i + 1);
				dataRow1.createCell(0).setCellValue(i + 1);
				dataRow1.createCell(1).setCellValue(report.getGroups()+"");
				dataRow1.createCell(2).setCellValue(report.getSum());
				dataRow1.createCell(3).setCellValue(report.getCount());
			}
			
			//SHEET2
			// Create a header row
			Row headerRow2 = sheet2.createRow(0);
			headerRow2.createCell(0).setCellValue("STT");
			headerRow2.createCell(1).setCellValue("Create Date");
			headerRow2.createCell(2).setCellValue("Total");
			headerRow2.createCell(3).setCellValue("Quantity");
			
			// Populate data rows
			for (int i = 0; i < reports2.size(); i++) {
				Report report = reports2.get(i);
				Row dataRow2 = sheet2.createRow(i + 1);
				dataRow2.createCell(0).setCellValue(i + 1);
				dataRow2.createCell(1).setCellValue(report.getGroups()+"");
				dataRow2.createCell(2).setCellValue(report.getSum());
				dataRow2.createCell(3).setCellValue(report.getCount());
			}

			// Write to the Excel file
			try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
				workbook.write(fileOut);
			}
		}
	}
}
