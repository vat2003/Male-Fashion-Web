package com.asm1.demo01.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm1.demo01.model.Image;
import com.asm1.demo01.model.Product;
import com.asm1.demo01.model.Report;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	List<Product> findByStatus(String status);

	List<Image> findImgByProductId(Integer product);

	Page<Product> findAll(Pageable pageable);

	@Query("SELECT p FROM Product p WHERE " + "(?1 IS NULL OR p.category.id LIKE ?1) AND "
			+ "(?2 IS NULL OR p.brand.id LIKE ?2) AND" + "(?3 IS NULL OR p.price >= ?3) AND "
			+ "(?4 IS NULL OR p.price <= ?4) AND "
			+ "(?5 IS NULL OR EXISTS (SELECT s FROM Sizes s WHERE s.sizeId = ?5 AND s MEMBER OF p.sizes)) AND "
			+ "(?6 IS NULL OR EXISTS (SELECT c FROM Color c WHERE c.colorId = ?6 AND c MEMBER OF p.colors)) AND "
			+ "(?7 IS NULL OR p.name LIKE %?7%)")
	Page<Product> filterProducts(String category, String brand, Double minPrice, Double maxPrice, Integer sizes,
			Integer color, String name, Pageable pageable);

//	 @Query("SELECT p FROM Product p WHERE " +
//	            "(?1 IS NULL OR p.category.id = ?1) AND " + 
//			 	"(?2 IS NULL OR p.brand.id = ?2) AND" +
//	 			"(?3 IS NULL OR p.price >= ?3) AND " +
//	            "(?4 IS NULL OR p.price <= ?4)")
//	 Page<Product> filterProducts(String category, String brand, Double minPrice, Double maxPrice, Pageable pageable);
	@Query("SELECT new Report(o.category.name, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category.name"
			+ " ORDER BY sum(o.price) DESC")
			List<Report> getInventoryByCategory();
	
	@Query("SELECT new Report(o.createDate, sum(o.price), count(o)) " +
		       "FROM Product o " +
		       "GROUP BY o.createDate " +
		       " ORDER BY sum(o.price) DESC"
		       
		       )
		List<Report> getInventoryByDate();
	
	@Query(value = "SELECT TOP 4  * FROM Products ORDER BY NEWID()", nativeQuery = true)
	List<Product> findRandomProducts();
	
	@Query(value = "SELECT TOP 4  * FROM Products ORDER BY createDate DESC", nativeQuery = true)
	List<Product> find4ProductsByNewestDate();
}
