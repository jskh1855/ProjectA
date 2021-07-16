<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="slider-area ">
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h2>상품 상세</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--================Single Product Area =================-->
<div class="product_image_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="product_img_slide owl-carousel">
					<div class="single_product_img">
						<img src="../myweb/images/${random.postImage}" alt=""
							class="img-fluid">
				</div>
			</div>
			<div class="col-lg-12">
				<div class="single_product_text text-center">
					<h3>${random.title}</h3>
					<p>${random.productName}</p>
					
					<div>
						<h3>${random.nowPrice}</h3>
					</div>
					<div>
						<h4>${random.detail }</h4>
					</div>
					
					<div class="bid_start">
						<input type="button" value="입찰하기" onclick= " ">
						<!-- <a href="#" class="btn_3">입찰하기</a> -->
					</div>
				
						<div class="add_to_cart">
							<a href="${pageContext.request.contextPath}/addCart?productNo=${random.productNo}">add to cart</a>
						</div>
					
				</div>
			</div>

			<!-- <div class="card_area">
				<div class="product_count_area">
					<p>Bid!</p>
					<div class="product_count d-inline-block">
						<span class="product_count_item inumber-decrement"> <i
							class="ti-minus"></i></span> <input
							class="product_count_item input-number" type="text" value="1"
							min="0" max="10"> <span
							class="product_count_item number-increment"> <i
							class="ti-plus"></i></span>
					</div>
				</div>

			</div> -->
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->
<!-- subscribe part here -->
<section class="subscribe_part section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="subscribe_part_content">
					<h2>Get promotions & updates!</h2>
					<p>Seamlessly empower fully researched growth strategies and
						interoperable internal or “organic” sources credibly innovate
						granular internal .</p>
					<div class="subscribe_form">
						<input type="email" placeholder="Enter your mail"> <a
							href="#" class="btn_1">Subscribe</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="container">
	<table border="1">
		<tr>
			<th>넘버</th>
			<th>제품사진</th>
			<th>제목</th>
			<th>제품명</th>
			<th>현재가</th>
			<th>종료시간</th>
			<th>판매자아이디</th>
			<th>판매자이름</th>
		</tr>
		<tr>
			<td>${random.productNo}</td>
			<td>${random.postImage}</td>
			<td>${random.title}</td>
			<td>${random.productName}</td>
			<td>${random.nowPrice}</td>
			<td>${random.bidEndTime}</td>
			<td>${random.memberVO.memberId}</td>
			<td>${random.memberVO.name}</td>
		</tr>
	</table>
</div>
