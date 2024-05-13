<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${cartItem}" var="cartItem">
		<h6 class="text-truncate">${cartItem.product.name}</h6>
		<p>Price: ${cartItem.price * cartItem.quantity}</p>
		<p>Quantity: ${cartItem.quantity}</p>
		<p>ID: ${cartItem.product.productId}</p>

		<%-- Display the associated image for this cartItem --%>


		<c:forEach var="i" items="${img}">
			<c:if test="${cartItem.product.productId == i.product.productId }">
				<img src="../img/product/${i.nameImg}" alt="Product Image"
					width="90" height="90">
			</c:if>
		</c:forEach>
	</c:forEach>





</body>
</html>