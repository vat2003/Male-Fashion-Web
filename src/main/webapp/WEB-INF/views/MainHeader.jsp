
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion</title>
<!-- fontawsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="/asm/login">Sign in</a> <a href="/asm/login">FAQs</a>
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
				src="/static/img/icon/cart.png" alt=""> <span>${dem}</span></a>
			<div class="price">$ ${endOfDiscount}</div>
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
							<p>${welcome}</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<!-- <a href="/asm/login">Sign in</a> <a href="#">FAQs</a> -->
								<%-- Kiểm tra xem người dùng đã đăng nhập hay chưa bằng cách kiểm tra biến session --%>
								<c:choose>
									<c:when test="${sessionScope.email ne null}">
										<a href="/asm/logout">Logout</a>
										<a href="#">Change Password</a>
									</c:when>
									<c:otherwise>
										<a href="/asm/login">Sign in</a>
										<a href="#">FAQ</a>
									</c:otherwise>
								</c:choose>


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
						<a href="/asm/index"><img src="/static/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li class=""><a href="/asm/index">Home</a></li>
							<li><a href="/asm/shop">Shop</a></li>
							<!-- <li><a href="#">Pages</a>
								<ul class="dropdown">
									<li><a href="./about">About Us</a></li>
									<li><a href="./shop-details">Shop Details</a></li>
									<li><a href="./shopping-cart">Shopping Cart</a></li>
									<li><a href="./checkout">Check Out</a></li>
									<li><a href="./blog-details">Blog Details</a></li>
								</ul></li> -->
							<li><a href="./blog">Blog</a></li>
							<li><a href="./contact">Contacts</a></li>
							<c:choose>
								<c:when test="${sessionScope.email.role == true}">
									<li><a href="/dashboard/index">Dashboard</a></li>
								</c:when>
							</c:choose>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="/static/img/icon/search.png" alt=""></a> <a href="#"><img
							src="/static/img/icon/heart.png" alt=""></a> <a
							href="/asm/shopping-cart"> <img
							src="/static/img/icon/cart.png" alt=""> <span>${dem}</span></a>
						<div class="price">$ ${endOfDiscount}</div>

						<a href="/asm/profile"
							style="text-decoration: nonel; color: black; margin-left: 20px">
							<i class="fa-regular fa-user"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->
</body>