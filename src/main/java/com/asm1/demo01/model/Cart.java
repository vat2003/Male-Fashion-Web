package com.asm1.demo01.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString(exclude="cartItems")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Carts")
public class Cart implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartId;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
	private List<CartItem> cartItems;

	private Double totalAmount;
}
