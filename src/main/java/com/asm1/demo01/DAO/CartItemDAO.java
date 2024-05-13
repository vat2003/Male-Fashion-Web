package com.asm1.demo01.DAO;

import java.util.List;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm1.demo01.model.Cart;
import com.asm1.demo01.model.CartItem;
import com.asm1.demo01.model.CountProductOrder;
import com.asm1.demo01.model.ListOrders;
import com.asm1.demo01.model.Order;
import com.asm1.demo01.model.Product;

public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	List<CartItem> findByCart(Cart cart); // Tìm kiếm các CartItem bằng Cart
	
	List<CartItem> findByOrder(Order order);
	
	//Kha
//	@Query("SELECT NEW com.asm1.demo01.model.CountProductOrder(COUNT(), c) FROM CartItem c WHERE c.order = :order GROUP BY c.product.productId")
//	List<CountProductOrder> findByOrder(Order order);

	
	void deleteByCart(Cart cart); // Xóa tất cả các CartItem thuộc Cart

	@Query("SELECT COUNT(ci) FROM CartItem ci WHERE ci.cart = :cart")
	int countByCart(Cart cart);

	@Query("SELECT SUM(ci.quantity) FROM CartItem ci WHERE ci.cart = :cart")
	int sumQuantityByCart(Cart cart);

	@Query("SELECT SUM(ci.quantity) FROM CartItem ci WHERE ci.order = :order")
	int sumQuantityByOrder(Order order);
	
	
	@Query("SELECT SUM(ci.price) FROM CartItem ci WHERE ci.cart = :cart")
	Double sumTotalPriceByCart(Cart cart);

//	Optional<CartItem> findByProductIdAndCartId(Integer productId, Integer cartId);
	@Query("SELECT ci FROM CartItem ci WHERE ci.product.id = :productId AND ci.cart.id = :cartId")
	Optional<CartItem> findByProductIdAndCartId(Integer productId, Integer cartId);

//	CartItem findByProductAndCart(Product product, Cart cart);
	@Query("SELECT ci FROM CartItem ci WHERE ci.product = :product AND ci.cart = :cart")
	CartItem findByProductAndCart(Product product, Cart cart);
	
	@Query("SELECT new ListOrders(ci.order.orderId, SUM(ci.quantity)) FROM CartItem ci GROUP BY ci.order.orderId")
	List<ListOrders> countItemsOrders();
	

	@Query("SELECT new ListOrders(ci.order.orderId, SUM(ci.quantity)) FROM CartItem ci WHERE ci.order.orderId = ?1  GROUP BY ci.order.orderId")
	ListOrders countItemsOrdersByOrderId(Integer orderId);
}
