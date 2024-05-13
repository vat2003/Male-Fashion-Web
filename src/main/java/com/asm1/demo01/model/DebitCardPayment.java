package com.asm1.demo01.model;

import org.hibernate.validator.constraints.CreditCardNumber;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DebitCardPayment {
	@NotBlank(message = "CardOwner Name is required")
	private String cardOwner;

	@CreditCardNumber(message = "Invalid card number")
	private String cardNumber;

	@Pattern(regexp = "\\d{2}/\\d{2}", message = "Invalid expiration date. Please use MM/YY format")
	private String expirationDate;

	@Pattern(regexp = "\\d{3}", message = "CVV must be a 3-digit number")
	private String cvv;

}
