package com.asm1.demo01.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CountProductOrder {
	Integer count;
	CartItem cartItem;
}
