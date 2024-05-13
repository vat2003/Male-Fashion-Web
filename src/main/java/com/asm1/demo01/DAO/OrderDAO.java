package com.asm1.demo01.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm1.demo01.model.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {
}
