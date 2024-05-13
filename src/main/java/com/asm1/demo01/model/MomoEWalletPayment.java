package com.asm1.demo01.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MomoEWalletPayment {
	@NotBlank(message = "{NotBlank.momo}")
	@NotNull(message = "{NotNull.momo}")
	private String momoAccount;
}
