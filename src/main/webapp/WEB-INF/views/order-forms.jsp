<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/styles.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
</head>

</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<aside class="left-sidebar">
			<!-- Sidebar scroll-->
			<jsp:include page="aside.jsp"></jsp:include>
			<!-- End Sidebar scroll-->
		</aside>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<jsp:include page="header.jsp"></jsp:include>
			</header>
			<!--  Header End -->
			<div class="container-fluid">
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title fw-semibold mb-4">ORDER MANAGEMENT</h5>
							<div class="card">
								<div class="card-body">
									<form:form modelAttribute="order" method="POST"
										action="/dashboard/order">
										<form:hidden path="orderId" />
										<form:hidden path="user.userID" />
										<div class="mb-3">
											<label for="fullname" class="form-label">Customer:</label>
											<form:input path="fullname" id="fullname"
												class="form-control" placeholder="Leonardo Dicaprio" required="true" />
										</div>
										<div class="mb-3">
											<label for="address" class="form-label">Address:</label>
											<form:input path="address" id="address" class="form-control"
												placeholder="Ho Chi Minh city"  required="true"/>
										</div>
										<div class="mb-3">
											<label for="phoneNum" class="form-label">Phone
												Number:</label>
											<form:input path="phoneNum" id="phoneNum"
												class="form-control" placeholder="0328996485" required="true" />
										</div>
										<div class="mb-3">
											<label for="email" class="form-label">Email:</label>
											<form:input path="email" id="email" class="form-control"
												placeholder="abc123@gmail.com" />
										</div>
										<div class="mb-3">
											<label for="note" class="form-label">Note:</label>
											<form:input path="note" id="note" class="form-control"
												placeholder="10" />
										</div>
										<div class="mb-3">
											<label for="items" class="fw-bolder text-dark">Items:
												${ordId.countItems}</label>
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
										<button type="submit" class="btn btn-primary" formaction="/dashboard/order/update">Update</button>
<!-- 										<button type="submit" class="btn btn-danger" formaction="/dashboard/order/delete">Delete</button> -->
									</form:form>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title fw-semibold mb-4">LIST ORDERS</h5>
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table text-nowrap mb-0 align-middle">
											<thead class="text-dark fs-4">
												<tr>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Id</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">FullName</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Address</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Delivery</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Price</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Total items</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Created Date</h6>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orders}" var="order">
													<tr>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0">${order.orderId}</h6>
														</td>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-1">${order.fullname}</h6> <span
															class="fw-normal">${order.email}</span>
														</td>
														<td class="border-bottom-0">
															<p class="mb-0 fw-normal">${order.address}</p>
														</td>
														<td class="border-bottom-0">
															<div class="d-flex align-items-center gap-2">
																<span
																	class="<c:choose>
    <c:when test="${order.shippingUnit.name == 'Standard Shipping'}">badge bg-primary rounded-3 fw-semibold</c:when>
    <c:otherwise>badge bg-warning rounded-3 fw-semibold</c:otherwise>
</c:choose>">
																	${order.shippingUnit.name} </span>

															</div>
														</td>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0 fs-4">${order.totalAmount}</h6>
														</td>
														
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0 fs-4 text-start">
															<c:forEach var="ci" items="${cItems}">
																<c:if test="${order.orderId == ci.orders}">${ci.countItems}</c:if>
															</c:forEach>
															</h6>
														</td>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0 fs-4">${order.dateOrder}</h6>
														</td>
														
														<td class="border-bottom-0"><td class="border-bottom-0"><a
															class="btn btn-outline-primary fw-semibold mb-0 fs-4"
															href="/dashboard/order/edit/${order.orderId}">Detail</a></td></td>


													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/libs/jquery/dist/jquery.min.js"></script>
	<script src="/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/sidebarmenu.js"></script>
	<script src="/js/app.min.js"></script>
	<script src="/libs/simplebar/dist/simplebar.js"></script>

</body>

</html>