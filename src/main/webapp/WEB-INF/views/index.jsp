
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
	<jsp:include page="MainHeader.jsp" />
	<!-- Header Section End -->
	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="hero__slider owl-carousel">
			<div class="hero__items set-bg"
				data-setbg="/static/img/hero/hero-1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-5 col-lg-7 col-md-8">
							<div class="hero__text">
								<h6>Summer Collection</h6>
								<h2>Fall - Winter Collections 2030</h2>
								<p>A specialist label creating luxury essentials. Ethically
									crafted with an unwavering commitment to exceptional quality.</p>
								<a href="./shop" class="primary-btn">Shop now <span
									class="arrow_right"></span></a>
								<div class="hero__social">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hero__items set-bg"
				data-setbg="/static/img/hero/hero-2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-5 col-lg-7 col-md-8">
							<div class="hero__text">
								<h6>Summer Collection</h6>
								<h2>Fall - Winter Collections 2030</h2>
								<p>A specialist label creating luxury essentials. Ethically
									crafted with an unwavering commitment to exceptional quality.</p>
								<a href="./shop" class="primary-btn">Shop now <span
									class="arrow_right"></span></a>
								<div class="hero__social">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Banner Section Begin -->
	<section class="banner spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 offset-lg-4">
					<div class="banner__item">
						<div class="banner__item__pic">
							<img src="/static/img/banner/banner-1.jpg" alt="">
						</div>
						<div class="banner__item__text">
							<h2>Clothing Collections 2030</h2>
							<a href="./shop">Shop now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="banner__item banner__item--middle">
						<div class="banner__item__pic">
							<img src="/static/img/banner/banner-2.jpg" alt="">
						</div>
						<div class="banner__item__text">
							<h2>Accessories</h2>
							<a href="./shop">Shop now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="banner__item banner__item--last">
						<div class="banner__item__pic">
							<img src="/static/img/banner/banner-3.jpg" alt="">
						</div>
						<div class="banner__item__text">
							<h2>Shoes Spring 2030</h2>
							<a href="./shop">Shop now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="filter__controls">
						<li class="active" data-filter="*">Best Sellers</li>
						<li data-filter=".New">New Arrivals</li>
						<li data-filter=".Sale">Hot Sales</li>
					</ul>
				</div>
			</div>
			<div class="row product__filter">
				<c:forEach items="${products}" var="p">
					<div
						class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix ${p.status}">
						<div class="product__item">
							<c:forEach var="i" items="${img}">
								<%-- <li><a href="/asm/shop-details/${p.productId}"><img class="text-dark" ${ } alt=""> --%>
								<c:if test="${p.productId == i.product.productId }">

									<div class="product__item__pic set-bg"
										data-setbg="/img/product/${i.nameImg}">
										<span class="label">New</span>
										<ul class="product__hover">
											<li><a href="#"><img
													src="/static/img/icon/heart.png" alt=""></a></li>
											<li><a href="#"><img
													src="/static/img/icon/search.png" alt=""></a></li>
										</ul>
									</div>
								</c:if>
							</c:forEach>

							<div class="product__item__text">
								<h6>${p.name}</h6>
								<a href="/asm/shop-details/${p.productId}" class="add-cart"><i class="fa fa-eye" aria-hidden="true"></i> View Detail</a>
								<div class="rating">
									<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<h5>$${p.price}</h5>
								<div class="product__color__select">
									<label for="pc-4"> 
										<input type="radio" id="pc-4">
									</label> 
									<label class="active black" for="pc-5"> 
										<input type="radio" id="pc-5">
									</label> 
									<label class="grey" for="pc-6"> 
										<input type="radio" id="pc-6">
									</label>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
	</section>
	<!-- Product Section End -->

	<!-- Categories Section Begin -->
	<section class="categories spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="categories__text">
						<h2>
							Clothings Hot <br /> <span>Shoe Collection</span> <br />
							Accessories
						</h2>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="categories__hot__deal">
						<img src="/static/img/product-sale.png" alt="">
						<div class="hot__deal__sticker">
							<span>Sale Of</span>
							<h5>$29.99</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-1">
					<div class="categories__deal__countdown">
						<span>Deal Of The Week</span>
						<h2>Multi-pocket Chest Bag Black</h2>
						<div class="categories__deal__countdown__timer" id="countdown">
							<div class="cd-item">
								<span>3</span>
								<p>Days</p>
							</div>
							<div class="cd-item">
								<span>1</span>
								<p>Hours</p>
							</div>
							<div class="cd-item">
								<span>50</span>
								<p>Minutes</p>
							</div>
							<div class="cd-item">
								<span>18</span>
								<p>Seconds</p>
							</div>
						</div>
						<a href="#" class="primary-btn">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Instagram Section Begin -->
	<section class="instagram spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="instagram__pic">
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-1.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-2.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-3.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-4.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-5.jpg"></div>
						<div class="instagram__pic__item set-bg"
							data-setbg="/static/img/instagram/instagram-6.jpg"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="instagram__text">
						<h2>Instagram</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
						<h3>#Male_Fashion</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->
	<section class="latest spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>Latest News</span>
						<h2>Fashion New Trends</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="/static/img/blog/blog-1.jpg"></div>
						<div class="blog__item__text">
							<span><img src="/static/img/icon/calendar.png" alt="">
								16 February 2020</span>
							<h5>What Curling Irons Are The Best Ones</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="/static/img/blog/blog-2.jpg"></div>
						<div class="blog__item__text">
							<span><img src="/static/img/icon/calendar.png" alt="">
								21 February 2020</span>
							<h5>Eternity Bands Do Last Forever</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="/static/img/blog/blog-3.jpg"></div>
						<div class="blog__item__text">
							<span><img src="/static/img/icon/calendar.png" alt="">
								28 February 2020</span>
							<h5>The Health Benefits Of Sunglasses</h5>
							<a href="#">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Blog Section End -->
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
							<li><a href="#">Delivary</a></li>
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
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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

	<!-- Js Plugins -->
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