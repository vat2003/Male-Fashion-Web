<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="../css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body>
	<jsp:include page="MainHeader.jsp"></jsp:include>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./index">Home</a> <a href="./shop">Shop</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Sale</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cartItem}">
									<tr>
										<td class="product__cart__item">
											<div class="product__cart__item__pic">
												<c:forEach var="i" items="${img}">
													<c:if
														test="${item.product.productId == i.product.productId }">
														<img src="../img/product/${i.nameImg}" alt="Product Image"
															width="90" height="90">
													</c:if>
												</c:forEach>
											</div>
											<div class="product__cart__item__text">
												<h6 class="text-truncate">${item.product.name}</h6>
												<div class="d-inline-flex align-items-center">

													<%-- <h6 class="mr-2">
																		Color: <span class="dotColor"
																			style="width: 20px; height: 20px; background-color: ${item.product.Fcolor}; border-radius: 50%; border: 1px solid gray; display: inline-block; margin-right: 5px; margin-left: 3px"></span>
																		</h6> --%>
													<h6>Size: ${item.size}</h6>
												</div>
												<h6>$ ${item.product.price}</h6>
											</div>
										</td>
										<td class="cart__price">$${item.price -
											(item.price*item.product.discount/100)}</td>
										<td class="quantity__item">
											<div class="quantity">
												<div class="pro-qty-2">
													<a href="/asm/cart/update/${item.cartItemId}/minus"><span
														class="fa fa-angle-left dec qtybtn"> </span></a> <input
														type="text" value="${item.quantity}"> <a
														href="/asm/cart/update/${item.cartItemId}/plus"><span
														class="fa fa-angle-right inc qtybtn"></span></a>


												</div>
											</div>
										</td>
										<td class="cart__price"><fmt:formatNumber
												value="${((item.price - (item.price*item.product.discount/100))) * item.quantity}"
												type="currency" /></td>

										<td class="cart__close"><a
											href="/asm/cart/remove/${item.cartItemId}"><i
												class="fa fa-close"></i></a></td>
									</tr>
								</c:forEach>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6"></div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn update__btn">
								<a href="/asm/shop">Continue Shopping</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__discount">
						<h6>Discount codes</h6>
						<form action="#">
							<input type="text" placeholder="Coupon code">
							<button type="submit">Apply</button>
						</form>
					</div>
					<div class="cart__total">
						<hr>
						<h6>Cart total</h6>
						<ul>
							<li>Quantity total <span>${count}</span></li>
							<li>Subtotal <span><fmt:formatNumber
										value="${subtotal}" type="currency" /></span>
							</li>
							<li>Discount total <span> <fmt:formatNumber
										value="${subtotal-endOfDiscount}" type="currency" />
							</span></li>

						</ul>

						<hr>
						<ul>
							<li>Total <span>${endOfDiscount}</span></li>
						</ul>
						<a href="/asm/paymentMethod" class="primary-btn">Proceed to
							checkout</a>
						<!-- 						<a href="/asm/shopping-cart/detail-invoice" class="primary-btn">Proceed
							to checkout</a> -->
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="MainFooter.jsp" />
	<!-- Footer Section End -->



	<!-- Modal -->
	<div class="">
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Cash on delevery method</h4>
					</div>
					<div class="modal-body">This is the modal content.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Credit Card Account</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="cardNumber">Card Number:</label> <input type="text"
									class="form-control" minlength="10" min="0" maxlength="16"
									id="cardNumber" name="cardNumber" required>
							</div>
							<div class="form-group">
								<label for="cardholderName">Cardholder's name:</label> <input
									type="text" class="form-control" id="cardholderName"
									name="cardholderName" required>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="expirationDate">M/YY</label> <input type="month"
											class="form-control" id="expirationDate"
											name="expirationDate" placeholder="MM/YY" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="cvv">CVV</label> <input type="text"
											class="form-control" id="cvv" name="cvv" required>
									</div>
								</div>
							</div>


							<button type="submit" class="btn btn-primary">Submit
								Payment</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Model end -->

	<!-- Js Plugins -->

	<script>
		$(document).ready(function() {
			$("#selectOption").change(function() {
				var selectedOption = $(this).val();
				if (selectedOption === "option1") {
					$("#myModal").modal("show");
				}
				if (selectedOption === "debitCardPayment") {
					$("#myModal2").modal("show");
				}
				if (selectedOption === "momoEWallet") {
					$("#myModal3").modal("show");
				}
				// Add more conditions for other options if needed
			});
		});
	</script>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.nice-select.min.js"></script>
	<script src="../js/jquery.nicescroll.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/jquery.countdown.min.js"></script>
	<script src="../js/jquery.slicknav.js"></script>
	<script src="../js/mixitup.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/main.js"></script>
</body>

</html>