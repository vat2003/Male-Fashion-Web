<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/static/css/bootstrap.min.css"
	type="text/css">
</head>
<style>
body {
	text-align: center;
	padding: 40px 0;
	background: #EBF0F5;
}

h1 {
	color: #88B04B;
	font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
	font-weight: 900;
	font-size: 40px;
	margin-bottom: 10px;
}

p {
	color: #404F5E;
	font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
	font-size: 20px;
	margin: 0;
}

i {
	color: #9ABC66;
	font-size: 100px;
	line-height: 200px;
	margin-left: -15px;
}

.card {
	background: white;
	padding: 60px;
	border-radius: 4px;
	box-shadow: 0 2px 3px #C8D0D8;
	display: inline-block;
	margin: 0 auto;
}
</style>
<body>
	<div class="card">
		<div
			style="border-radius: 200px; height: 200px; width: 200px; background: #F8FAF5; margin: 0 auto;">
			<i class="checkmark">✓</i>
		</div>
		<h1>Order Successfully!</h1>
		<p>
			Your order will be delivered soon (in about 3-4 days).<br /> Thank
			you!
		</p>
		<form action="/asm/index">
		<button class="btn btn-success" formaction="/asm/index">Continue Shopping</button>
		</form>

	</div>
	<script src="/static/js/jquery-3.3.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
</body>
</html>