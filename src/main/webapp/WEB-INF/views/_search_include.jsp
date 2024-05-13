<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form" action="./shop?category=${not empty categoryId ? categoryId : ''}&brand=${not empty brandId ? brandId : ''}&price=${not empty priceId ? priceId : ''}&size=${not empty sizeId ? sizeId : ''}&color=${not empty colorId ? colorId : ''}&p=${page}"
								method="post">
				<input type="text" id="search-input" name="search" value="${nameProduct}" placeholder="Search here.....">
			</form>
		</div>
	</div>