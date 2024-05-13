package com.asm1.demo01.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    private Date dateOrder = new Date();
    private String fullname;
    private String address;
    private String phoneNum;
    private String email;
    private String note;

    @ManyToOne
    @JoinColumn(name = "userid") // Đảm bảo tên cột phù hợp với tên cột trong cơ sở dữ liệu
    private User user;

    private Double totalAmount;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<CartItem> cartItems;

    @ManyToOne
    @JoinColumn(name = "shippingUnitId")
    private ShippingUnit shippingUnit;
}
