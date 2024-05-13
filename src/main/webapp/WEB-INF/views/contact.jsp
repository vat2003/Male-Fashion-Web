<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

	<!-- Map Begin -->
	<div class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4439805400566!2d106.62348867342372!3d10.853796757765101!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b684ce076f3%3A0x4da1cf0078f423fa!2zRlBUIFBvbHl0ZWNobmljIEjhu5MgQ2jDrSBNaW5oIC0gVG_DoCBU!5e0!3m2!1svi!2s!4v1695635877775!5m2!1svi!2s"
			height="500" style="border: 0;" allowfullscreen=""
			aria-hidden="false" tabindex="0"></iframe>
	</div>
	<!-- Map End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="contact__text">
						<div class="section-title">
							<span>Information</span>
							<h2>Contact Us</h2>
							<p>As you might expect of a company that began as a high-end
								interiors contractor, we pay strict attention.</p>
						</div>
						<ul>
							<li>
								<h4>America</h4>
								<p>
									195 E Parker Square Dr, Parker, CO 801 <br />+43 982-314-0958
								</p>
							</li>
							<li>
								<h4>France</h4>
								<p>
									109 Avenue LÃ©on, 63 Clermont-Ferrand <br />+12 345-423-9893
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="contact__form">
						<form action="#">
							<div class="row">
								<div class="col-lg-6">
									<input type="text" placeholder="Name">
								</div>
								<div class="col-lg-6">
									<input type="text" placeholder="Email">
								</div>
								<div class="col-lg-12">
									<textarea placeholder="Message"></textarea>
									<button type="submit" class="site-btn">Send Message</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

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