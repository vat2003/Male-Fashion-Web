package com.asm1.demo01;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.asm1.demo01.DAO.ShippingUnitDAO;
import com.asm1.demo01.model.ShippingUnit;

@RestController
@RequestMapping("/api")
public class kha_shippingunit {
	 @Autowired
	    private ShippingUnitDAO shippingUnitDAO;

	    @GetMapping("/getShippingUnitPrice")
	    public Double getShippingUnitPrice(@RequestParam Integer shippingUnitId) {
	    	Optional<ShippingUnit> ship = shippingUnitDAO.findById(shippingUnitId);
	        return ship.get().getPrice();
	    }
}
