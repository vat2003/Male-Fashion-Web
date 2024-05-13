<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</head>

<body>
	<jsp:include page="MainHeader.jsp"></jsp:include>
	<!-- Header Section End -->

	<!-- Shop Details Section Begin -->
	<section class="shop-details">
		<div class="product__details__pic">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__breadcrumb">
							<a href="/asm/index">Home</a> <a href="./shop">Shop</a> <span>Product
								Details</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-3">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab">
									<div class="product__thumb__pic set-bg"
										data-setbg="/img/product/${imgThumb}"></div>
							</a></li>
							<c:forEach items="${imgs}" var="img" varStatus="status">
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-${status.index+2}" role="tab">
										<div class="product__thumb__pic set-bg"
											data-setbg="/img/product/${img.nameImg}"></div>
								</a></li>
							</c:forEach>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-4" role="tab">
									<div class="product__thumb__pic set-bg"
										data-setbg="/static/img/shop-details/thumb-4.png">
										<i class="fa fa-play"></i>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="col-lg-6 col-md-9">
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__pic__item">
									<img src="/img/product/${imgThumb}" alt="">
								</div>
							</div>
							<c:forEach var="img" items="${imgs}" varStatus="status">
								<div class="tab-pane" id="tabs-${status.index+2}"
									role="tabpanel">
									<div class="product__details__pic__item">
										<img src="/img/product/${img.nameImg}" alt="">
									</div>
								</div>
							</c:forEach>

							<div class="tab-pane" id="tabs-4" role="tabpanel">
								<div class="product__details__pic__item">
									<img src="/static/img/shop-details/product-big-4.png" alt="">
									<a
										href="https://www.youtube.com/watch?v=8PJ3_p7VqHw&list=RD8PJ3_p7VqHw&start_radio=1"
										class="video-popup"><i class="fa fa-play"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product__details__content">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<div class="product__details__text">
							<h4>${product.name}</h4>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i> <span> - 5 Reviews</span>
							</div>
							<h3>
								${product.price - ( product.price * product.discount / 100)} <span>${product.price}</span>
							</h3>
							<form action="">
								<div class="product__details__option">
									<div class="product__details__option__size">
										<span>Size:</span>

										<c:forEach items="${sizes}" var="size">
											<label for="${size.name}"> ${size.name} <input
												type="radio" name="sizes" value="${size.sizeId}"
												id="${size.name}"
												onclick="updateAddToCartLink(${product.productId})">
											</label>
											<input type="hidden" name="sizeID" id="sizeIDInput" value="">
										</c:forEach>

									</div>

									<!-- .product__item__text .product__color__select label.active:after {
													opacity: 1;
												} -->
								</div>
								<div class="product__details__cart__option">
									<div class="quantity">
										<div class="pro-qty">
											<span class="fa fa-angle-up des qtybtn"
												onclick="updateQuantity('increase', ${product.productId} )"></span>
											<input value="1" type="text" id="quantityInput"> <span
												class="fa fa-angle-down inc qtybtn"
												onclick="updateQuantity('decrease', ${product.productId})"></span>
										</div>
									</div>

									<!-- <a href="/asm/shop/addToCart/${product.productId}?sizeId=&qty=" class="primary-btn" id="addToCartLink">add to cart</a> -->
									<a href="/asm/shop/addToCart/${product.productId}?sizeId=&qty="  class="primary-btn" onmousedown="addToCart(${product.productId})" id="addToCartLink" >Add to cart</a>
												<div class="modal fade" id="sizeErrorModal" tabindex="-1" role="dialog" aria-labelledby="sizeErrorModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
													  <div class="modal-content">
														<div class="modal-header">
														  <h5 class="modal-title" id="sizeErrorModalLabel">Lỗi chọn kích thước</h5>
														  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														  </button>
														</div>
														<div class="modal-body">
														  Bạn phải chọn một kích thước trước khi thêm vào giỏ hàng.
														</div>
														<div class="modal-footer">
														  <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
														</div>
													  </div>
													</div>
												  </div>

								</div>
								<div class="product__details__btns__option">
									<a href="#"><i class="fa fa-heart"></i> add to wishlist</a> <a
										href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
								</div>
								<div class="product__details__last__option">
									<h5>
										<span>Guaranteed Safe Checkout</span>
									</h5>
									<img src="/static/img/shop-details/details-payment.png" alt="">
									<ul>
										<li><span>SKU:</span> 3812912</li>
										<li><span>Categories:</span> Clothes</li>
										<li><span>Tag:</span> Clothes, Skin, Body</li>
									</ul>
								</div>
							</form>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__tab">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#tabs-5" role="tab">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-6" role="tab">Customer Previews(5)</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-7" role="tab">Additional information</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										${product.description}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Details Section End -->

	<!-- Related Section Begin -->
	<section class="related spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="related-title">Related Product</h3>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${products}" var="p">
					<div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
						<div class="product__item">
							<c:forEach var="i" items="${img}">
								<%-- <li><a href="/asm/shop-details/${p.productId}"><img
															class="text-dark" ${ } alt=""> --%>
								<c:if test="${p.productId == i.product.productId }">

									<div class="product__item__pic set-bg"
										data-setbg="/img/product/${i.nameImg}">
										<span class="label">New</span>
										<ul class="product__hover">
											<li><a href="#"><img
													src="/static/img/icon/heart.png" alt=""></a></li>
											<li><a href="/asm/shop-details/${p.productId}"><img
													class="text-dark" src="/static/img/icon/show.png" alt=""><span>View</span></a></li>
											<li><a href="#"><img
													src="/static/img/icon/search.png" alt=""></a></li>
										</ul>
									</div>
								</c:if>
							</c:forEach>
							<div class="product__item__text">
								<h6>${p.name}</h6>
								<a href="#" class="add-cart">+ Add To Cart</a>
								<div class="rating">
									<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<h5>${p.price}$</h5>
								<div class="product__color__select">
									<label for="pc-1"> <input type="radio" id="pc-1">
									</label> <label class="active black" for="pc-2"> <input
										type="radio" id="pc-2">
									</label> <label class="grey" for="pc-3"> <input type="radio"
										id="pc-3">
									</label>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>




			</div>
		</div>
	</section>
	<!-- Related Section End -->

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
								class="fa fa-heart-o" aria-hidden="true"></i> by <a href=""
								target="_blank">Alaxed</a>
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
	<script src="/js/modal.js"></script>
	


</body>

</html>