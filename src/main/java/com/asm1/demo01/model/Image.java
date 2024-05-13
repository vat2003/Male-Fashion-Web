package com.asm1.demo01.model;

import java.io.Serializable;

import com.asm1.demo01.model.Category;
import com.asm1.demo01.model.Product;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Images")
public class Image implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nameImg;
	private Boolean thumb;
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
}
