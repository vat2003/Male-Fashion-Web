package com.asm1.demo01.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CashOnDeliveryPayment {
	private String recipientName; // Họ tên người nhận
	private String phoneNumber; // Số điện thoại
	private String deliveryAddress; // Địa chỉ giao hàng
}
