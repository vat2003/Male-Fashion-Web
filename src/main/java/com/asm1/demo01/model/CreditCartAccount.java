package com.asm1.demo01.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreditCartAccount {
	private String cardNumber;
	private String cardHolderName;
	private Date expirationDate;
	private int cvv;
}
