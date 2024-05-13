<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Male-Fashion | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/static/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #f4f4f4;
	font-family: Arial, sans-serif;
}

.invoice-container {
	background-color: #fff;
	border: 1px solid #e0e0e0;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin: 20px auto;
	max-width: 600px;
}

.invoice-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.invoice-header h2 {
	color: #333;
}

.invoice-header p {
	font-size: 14px;
}

.shipping-address {
	margin-top: 20px;
	padding-top: 20px;
	border-top: 1px solid #e0e0e0;
}

.shipping-address p {
	margin: 5px 0;
	font-size: 16px;
}

.invoice-table {
	margin-top: 20px;
}

.invoice-table table {
	width: 100%;
}

.invoice-table th, .invoice-table td {
	text-align: left;
	padding: 10px;
}

.invoice-table th {
	background-color: #f4f4f4;
}

.invoice-footer {
	margin-top: 20px;
}

.invoice-footer p {
	font-size: 16px;
}
</style>
</head>

<body>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="#">Sign in</a> <a href="#">FAQs</a>
			</div>
			<div class="offcanvas__top__hover">
				<span>Usd <i class="arrow_carrot-down"></i></span>
				<ul>
					<li>USD</li>
					<li>EUR</li>
					<li>USD</li>
				</ul>
			</div>
		</div>
		<div class="offcanvas__nav__option">
			<a href="#" class="search-switch"><img
				src="/static/img/icon/search.png" alt=""></a> <a href="#"><img
				src="/static/img/icon/heart.png" alt=""></a> <a href="#"><img
				src="/static/img/icon/cart.png" alt=""> <span>0</span></a>
			<div class="price">$0.00</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>Free shipping, 30-day return or refund guarantee.</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<p>Free shipping, 30-day return or refund guarantee.</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<a href="#">Sign in</a> <a href="#">FAQs</a>
							</div>
							<div class="header__top__hover">
								<span>Usd <i class="arrow_carrot-down"></i></span>
								<ul>
									<li>USD</li>
									<li>EUR</li>
									<li>USD</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="./index"><img src="/static/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="./index">Home</a></li>
							<li class="active"><a href="./shop">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="dropdown">
									<li><a href="./about">About Us</a></li>
									<li><a href="./shop-details">Shop Details</a></li>
									<li><a href="./shopping-cart">Shopping Cart</a></li>
									<li><a href="./checkout">Check Out</a></li>
									<li><a href="./blog-details">Blog Details</a></li>
								</ul></li>
							<li><a href="./blog">Blog</a></li>
							<li><a href="./contact">Contacts</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="/static/img/icon/search.png" alt=""></a> <a href="#"><img
							src="/static/img/icon/heart.png" alt=""></a> <a href="#"><img
							src="/static/img/icon/cart.png" alt=""> <span>0</span></a>
						<div class="price">$0.00</div>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">

		<div class="container">
			<div class="invoice-container">
				<div class="invoice-header">
					<h2>Invoice</h2>
					<p>Invoice Number: INV12345</p>
					<p>Invoice Date: October 15, 2023</p>
				</div>
				<div class="shipping-address">
					<h4>Shipping Address:</h4>
					<p>Võ Anh Tài</p>
					<p>0355878578</p>
					<p>109/10 Tô Ngọc Vân, phường Thạnh Xuân, quận 12, TP.HCM</p>
				</div>
				<div class="invoice-table">
					<h4>Cart Total:</h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Product</th>
								<th>Sale</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Product 1</td>
								<td>$90.00</td>
								<td>2</td>
								<td>$180.00</td>
							</tr>
							<tr>
								<td>Product 2</td>
								<td>$60.00</td>
								<td>1</td>
								<td>$60.00</td>
							</tr>
							<tr>
								<td>Product 3</td>
								<td>$40.00</td>
								<td>3</td>
								<td>$120.00</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="invoice-footer">
					<h4>Shipping Service:</h4>
					<p>Express Shipping - $10.00 - 2 Days</p>
					<h4>Payment Method:</h4>
					<p>Debit Card Payment</p>
					<p>Card Owner: John Doe</p>
					<p>Card Number: **** **** **** 1234</p>
					<p>Expiration Date: 12/25</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->


	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="/static/img/footer-logo.png" alt=""></a>
						</div>
						<p>The customer is at the heart of our unique business model,
							which includes design.</p>
						<a href="#"><img src="/static/img/payment.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Clothing Store</a></li>
							<li><a href="#">Trending Shoes</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Sale</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Payment Methods</a></li>
							<li><a href="#">Delivery</a></li>
							<li><a href="#">Return & Exchanges</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
					<div class="footer__widget">
						<h6>NewLetter</h6>
						<div class="footer__newslatter">
							<p>Be the first to know about new arrivals, look books, sales
								& promos!</p>
							<form action="#">
								<input type="text" placeholder="Your email">
								<button type="submit">
									<span class="icon_mail_alt"></span>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<p>
							Copyright Â©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->

<jsp:include page="_search_include.jsp"></jsp:include>

	<!-- Search End -->


	<script src="/static/js/jquery-3.3.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/jquery.nice-select.min.js"></script>
	<script src="/static/js/jquery.nicescroll.min.js"></script>
	<script src="/static/js/jquery.magnific-popup.min.js"></script>
	<script src="/static/js/jquery.countdown.min.js"></script>
	<script src="/static/js/jquery.slicknav.js"></script>
	<script src="/static/js/mixitup.min.js"></script>
	<script src="/static/js/owl.carousel.min.js"></script>
	<script src="/static/js/main.js"></script>
</body>

</html>