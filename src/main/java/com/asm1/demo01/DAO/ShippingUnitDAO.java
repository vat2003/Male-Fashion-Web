package com.asm1.demo01.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm1.demo01.model.ShippingUnit;

public interface ShippingUnitDAO extends JpaRepository<ShippingUnit, Integer> {
}
