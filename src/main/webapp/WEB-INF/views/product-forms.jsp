<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/styles.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
        crossorigin="anonymous">
</head>
<body>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical"
        data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <jsp:include page="aside.jsp"></jsp:include>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <jsp:include page="header.jsp"></jsp:include>
            <!--  Header End -->
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-semibold mb-4">PRODUCT MANAGEMENT</h5>
                        <div class="card">
                            <div class="card-body">
                                <form:form action="/dashboard/product" method="post"
                                    modelAttribute="product" enctype="multipart/form-data">
                                    <input type="hidden" name="pr" id="productId" class="form-control"
                                        value="${product.productId != null ? product.productId : -1}" />
                                        
                                        <form:input type="hidden" path="productId" id="productId" class="form-control"/>
                                    
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name:</label>
                                        <form:input path="name" class="form-control"
                                            placeholder="The Brownie T-shirt" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="quantity" class="form-label">Quantity:</label>
                                        <form:input path="quantity"
                                            class="form-control" placeholder="0" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price:</label>
                                        <form:input path="price"
                                            class="form-control" placeholder="0.0" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="discount" class="form-label">Discount(%):</label>
                                        <form:input path="discount"
                                            class="form-control" placeholder="10" />
                                    </div>
                                    <div class="mb-3">
                                        <div class="d-flex justify-content-start">
                                            <label class="form-label">Size:</label>
                                            <div class="form-check ms-4">
                                                <form:checkboxes path="sizes" items="${sizes}"
                                                    itemValue="sizeId" itemLabel="name" class="ms-5" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <div class="d-flex justify-content-start">
                                            <label class="form-label">Color:</label>
                                            <div class="form-check ms-2">
                                                <form:checkboxes path="colors" items="${colors}"
                                                    itemValue="colorId" itemLabel="name" class="ms-5" />
                                            </div>
                                        </div>
                                    </div>
                                    	<div class="mb-3">
											<label for="brand" class="form-label">Brand:</label>
											<form:select path="brand" class="form-select" id="brand"
												aria-label="Brand">
												<form:option value="">Select a Brand</form:option>
												<form:options items="${brand}" itemValue="id"
													itemLabel="name" />
											</form:select>
										</div>

										<div class="mb-3">
											<label for="category" class="form-label">Category:</label>
											<form:select path="category" class="form-select"
												id="category" aria-label="Category">
												<form:option value="">Select a Category</form:option>
												<form:options items="${category}" itemValue="id"
													itemLabel="name" />
											</form:select>
										</div>
                                    <div class="mb-3">
                                        <label for="img1" class="form-label">Image 1</label>
                                        <input class="form-control" type="file" id="img1"
                                            name="img1" >
                                            <%-- <input type="hidden" name="imgId1" id="imgId1" class="form-control"
                                        		value="${images[0].id != null ? images[0] : '' }" /> --%>
                                        		<input type="hidden" name="imgId1" id="imgId1" class="form-control"
                                        		value="${images[0].id != null ? images[0].id : ''}" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="img2" class="form-label">Image 2</label>
                                        <input class="form-control" type="file" id="img2"
                                            name="img2">
                                           <input type="hidden" name="imgId1" id="imgId1" class="form-control"
                                        		value="${images[1].id != null ? images[1].id : ''}" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="img3" class="form-label">Image 3</label>
                                        <input class="form-control" type="file" id="img3"
                                            name="img3">
                                            <input type="hidden" name="imgId1" id="imgId1" class="form-control"
                                        		value="${images[2].id != null ? images[2].id : ''}" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description:</label>
                                        <textarea name="description" id="description" cols="30" rows="10"
                                            class="form-control">${product.description}</textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary"
                                        formaction="/dashboard/save">Save/Update</button>
                                     <button type="submit" class="btn btn-danger"
                                        formaction="/dashboard/delete/${product.productId}">Delete</button>
                                        <button type="submit" class="btn btn-success"
                                        formaction="/dashboard/index">Reset</button>
                                        
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                                                <h5 class="card-title fw-semibold mb-4">PRODUCTS</h5>
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
                                                    <h6 class="fw-semibold mb-0">Name</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Price</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Category</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Brand</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Discount</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Quantity</h6>
                                                </th>
                                                <th class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">Actions</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.productId}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.name}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.price}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.category.name}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.brand.name}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.discount}</h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">${product.quantity}</h6>
                                                    </td>
                                                    <td class="border-bottom-0"><a
                                                        class="btn btn-outline-primary fw-semibold mb-0 fs-4"
                                                        href="/dashboard/edit/${product.productId}">Edit</a></td>
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
    <script src="/libs/jquery/dist/jquery.min.js"></script>
    <script src="/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sidebarmenu.js"></script>
    <script src="/js/app.min.js"></script>
    <script src="/libs/simplebar/dist/simplebar.js"></script>
</body>
</html>

