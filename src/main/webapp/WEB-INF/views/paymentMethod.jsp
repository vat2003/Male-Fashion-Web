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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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


	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 centered">
					<div class="cart__total">
						<form:form modelAttribute="shippingUnit" method="POST"
							action="/asm/shopping-cart/processShippingForm">
							<div class="">
								<h6>Shipping address</h6>
								<div class="mb-3">
									<label for="fullname" class="form-label">Customer:</label> <input
										type="text" class="form-control" name="fullname" id="fullname"
										value="${customer.fullname}">
								</div>
								<div class="mb-3">
									<label for="phoneNum" class="form-label">Phone Number:</label>
									<input type="text" class="form-control" name="phoneNum"
										id="phoneNum" value="${customer.phoneNum}">
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Address:</label> <input
										type="text" class="form-control" name="address" id="address"
										value="${customer.address}">
								</div>
								<div class="mb-3">
									<label for="note" class="form-label">Note:</label> <input
										type="text" class="form-control" name="note" id="note">
								</div>
								<div class="table-responsive">
											<table class="table text-nowrap mb-0 align-middle">
												<thead class="text-dark fs-4">
													<tr>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Id</h6>
														</th>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Image</h6>
														</th>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Name</h6>
														</th>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Size</h6>
														</th>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Price</h6>
														</th>
														<th class="border-bottom-0">
															<h6 class="fw-semibold mb-0">Quantity</h6>
														</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${products}" var="pd">
													<tr>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0">${pd.getProduct().productId}</h6>
														</td>
														<th class="border-bottom-0">
															<c:forEach var="i" items="${imgs}">
																<c:if test="${i.product.productId == pd.getProduct().productId  }">
																<img alt="" src="/img/product/${i.nameImg}" width="60px" height="60px">
																</c:if>
															</c:forEach>
														</th>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-1">${pd.getProduct().name}</h6>
														</td>
														
														<td class="border-bottom-0">
															<div class="d-flex align-items-center gap-2">
																<p class="mb-0 fw-normal">${pd.size}</p>

															</div>
														</td>
														<td class="border-bottom-0">
															<p class="mb-0 fw-normal">${pd.getProduct().getPrice()-(pd.getProduct().getPrice()*pd.getProduct().getDiscount()/100)}</p>
														</td>
														<td class="border-bottom-0">
															<div class="d-flex align-items-center gap-2">
																<p class="mb-0 fw-normal">${pd.getQuantity()}</p>

															</div>
														</td>


													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
								<hr>
								<h6>Cart total</h6>
								<ul>
									<li>Subtotal <span>$ ${subtotal}</span></li>
									<li>Count <span>${countTotal}</span></li>
								</ul>
							</div>
							<hr>
							<hr>
							<div class="">
								<h6>Shipping Service</h6>
		<div class="input-group mb-3">

									<div
										class="w-100 d-flex justify-content-between align-items-center ">
										<div class="form-group">
											<form:select path="shippingUnitId" class="form-control"
												id="comboxshippingUnits">
												<form:options items="${shippingUnits}"
													itemValue="shippingUnitId" itemLabel="name" />
											</form:select>
										</div>

										<div>
											<span style="color: red" id="shippingprice"></span>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div class="">
								<h6>Payment methods</h6>
								<div class="input-group">
									<select class="form-control" id="selectOption"
										name="paymentMethod">
										<option value="" selected>Choose method</option>
										<option value="COD">Cash on Delivery</option>
										<option value="option2">Debit Card Payment</option>
									</select>
								</div>
							</div>
							<hr>
							<ul>
								<li>Total <span id="totalAmount">$ ${subtotal}</span></li>
								<input hidden name="totalAmount" value="${subtotal}" />
							</ul>

							<button type="submit" class="form-control btn-dark"
								formaction="/asm/shopping-cart/processShippingForm">Proceed
								to checkout</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Shopping Cart Section End -->
	<!-- Modal -->

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
						<form:form modelAttribute="creditCardAccount" method="POST"
							action="/asm/paymentMethod">
							<div class="form-group">
								<label for="cardNumber">Card Number:</label>
								<form:input path="cardNumber" type="text" class="form-control"
									minlength="10" min="0" maxlength="16" id="cardNumber"
									required="true" />
							</div>

							<div class="form-group">
								<label for="cardHolderName">Cardholder's name:</label>
								<form:input path="cardHolderName" type="text"
									class="form-control" id="cardHolderName" required="true" />
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="expirationDate">M/YY</label>
										<form:input path="expirationDate" type="month"
											class="form-control" id="expirationDate" required="true" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="cvv">CVV</label>
										<form:input path="cvv" type="number" class="form-control"
											id="cvv" required="true" />
									</div>
								</div>
							</div>

							<button type="submit" class="btn btn-primary">Submit
								Payment</button>
						</form:form>

					</div>
				</div>
			</div>
		</div>

		<!-- <div class="modal fade" id="myModal3">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">MoMo E-Wallet</h4>
					</div>
					<div class="modal-body">
						<form action="">
							<label for="">Momo Account Number</label>
							<input type="number" name="" id="" class="form-control" min="0" minlength="10">
							<button type="submit" class="btn btn-primary mt-2">Save</button>
						</form>
					</div>
					<div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
				</div>
			</div>
		</div> -->
	</div>


	<script>
		$(document).ready(function() {
			$("#selectOption").change(function() {
				var selectedOption = $(this).val();
				if (selectedOption === "option1") {
					$("#myModal").modal("show");
				}
				if (selectedOption === "option2") {
					$("#myModal2").modal("show");
				}
				if (selectedOption === "option3") {
					$("#myModal3").modal("show");
				}
				// Add more conditions for other options if needed
			});
		});
		
	</script>
	
	<script>
    var totalAmount = parseFloat('${subtotal}'); // Khởi tạo totalAmount với giá trị subtotal
	var sum ;
    $(document).ready(function() {
        $("#comboxshippingUnits").change(function() {
            var selectedOption = $(this).val();
            $.ajax({
                url: "/api/getShippingUnitPrice",
                data: { shippingUnitId: selectedOption },
                success: function(data) {
                    $("#shippingprice").text('$ ' + data);
                    sum = totalAmount + parseFloat(data); // Cộng dồn giá vào tổng
                    $("#totalAmount").text('$ ' + sum); // Cập nhật tổng giá
                }
            });
        });
    });
</script>
	<!-- Js Plugins -->
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