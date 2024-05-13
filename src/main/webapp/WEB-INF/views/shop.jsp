<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>

<body>
	
		<jsp:include page="MainHeader.jsp"></jsp:include>
	
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shop</h4>
						<div class="breadcrumb__links">
							<a href="./index">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop__sidebar">
						<div class="shop__sidebar__search">
							<form
								action="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=${not empty priceId ? priceId : ''}&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&p=${page}"
								method="post">
								<input type="text" placeholder="Search..." name="search"
									value="${nameProduct}">
								<button type="submit">
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<div class="shop__sidebar__accordion">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
									</div>
									<div id="collapseOne" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__categories">
												<ul class="nice-scroll">
													<c:forEach var="item" items="${categories}">
														<li><a
															href="./shop?category=${item.id}&brand=${not empty brandId ? brandId : ''}&price=${not empty priceId ? priceId : ''}&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">${item.name}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
									</div>
									<div id="collapseTwo" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__brand">
												<ul>
													<c:forEach var="item" items="${brands}">
														<li><a
															href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${item.id}&price=${not empty priceId ? priceId : ''}&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">${item.name}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseThree">Filter
											Price</a>
									</div>
									<div id="collapseThree" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__price">
												<ul>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=0to50&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$0.00
															- $50.00</a></li>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=50to100&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$50.00
															- $100.00</a></li>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=100to150&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$100.00
															- $150.00</a></li>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=150to200&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$150.00
															- $200.00</a></li>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=200to250&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$200.00
															- $250.00</a></li>
													<li><a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=up250&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">$250.00+</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseFour">Size</a>
									</div>
									<div id="collapseFour" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__size">
												<c:forEach var="item" items="${sizes}">
													<a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=${not empty priceId ? priceId : ''}&size=${item.sizeId}&color=${not empty colorId ? colorId : ''}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">
														<label>${item.name}</label>
													</a>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseFive">Colors</a>
									</div>
									<div id="collapseFive" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__color">
												<c:forEach var="item" items="${colors}">
													<a
														href="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=${not empty priceId ? priceId : ''}&size=${not empty sizeId ? sizeId : ''}&color=${item.colorId}&search=${not empty nameProduct ? nameProduct : ''}&p=${page}">
														<label
														class="c-${item.colorId == 1 ? '8' : ''}${item.colorId == 2 ? '5' : ''}${item.colorId == 3 ? '2' : ''}${item.colorId == 4 ? '6' : ''}${item.colorId == 5 ? '1' : ''}${item.colorId == 6 ? '9' : ''}"></label>
													</a>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseSix">Tags</a>
									</div>
									<div id="collapseSix" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__tags">
												<a href="#">Product</a> <a href="#">Bags</a> <a href="#">Shoes</a>
												<a href="#">Fashio</a> <a href="#">Clothing</a> <a href="#">Hats</a>
												<a href="#">Accessories</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__left">
									<p>Showing ${products.numberOfElements} of
										${products.totalElements} results</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<form action="${fullUrl}" method="post">
										<p>Sort by Price:</p>
										<select name="sortSelect" onchange="this.form.submit()">
											<option disabled selected>Choose</option>
											<option value="asc" ${sort.equals("asc")?"selected":""}>Low
												To High</option>
											<option value="desc" ${sort.equals("desc")?"selected":""}>High
												To Low</option>
										</select>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${products.content}" var="p">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<c:forEach var="i" items="${img}">
										<c:if test="${p.productId == i.product.productId}">
											<div class="product__item__pic set-bg"
												data-setbg="/img/product/${i.nameImg}">
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
					<div class="row">
						<div class="col-lg-12">
							<div class="product__pagination">
								<c:forEach var="item" begin="0"
									end="${products.totalPages == 0 ? 0 : products.totalPages -1}"
									step="1">
									<a class="${item == p ? 'active' : ''}" href="${subUrl}${item}">${item +1}</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

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