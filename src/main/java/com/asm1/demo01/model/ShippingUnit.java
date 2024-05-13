package com.asm1.demo01.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "orders")
@Entity
@Table(name = "ShippingUnits")
public class ShippingUnit implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shippingUnitId;

    private String name;
    private double price;

    private int deliveryTime;
    private String description;

    private String iconUrl;
    private String customerSupportPhone;
    private String customerSupportEmail;
    private String otherInformation;

    @OneToMany(mappedBy = "shippingUnit", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Order> orders;
}
