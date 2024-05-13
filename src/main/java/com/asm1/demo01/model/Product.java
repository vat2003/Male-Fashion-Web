package com.asm1.demo01.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String name;
	private String description;
	private Double price;

	@ManyToOne
	@JoinColumn(name = "CategoryId")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "BrandId")
	private Brand brand;

	private String status;
	private Double discount;

	@OneToMany(mappedBy = "product")
	private List<Image> images;

	@ManyToMany
	@JoinTable(name = "Product_Size", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "size_id"))
	private List<Sizes> sizes;

	@ManyToMany
	@JoinTable(name = "Product_Color", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "color_id"))
	private List<Color> colors;

	private Integer quantity;

	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createDate = new Date();

	@Override
	public String toString() {
		return "Product{" + "productId=" + productId + ", name='" + name + '\'' + ", description='" + description + '\''
				+ ", price=" + price + ", status='" + status + '\'' + ", discount=" + discount + ", quantity="
				+ quantity + '}';
	}

}
