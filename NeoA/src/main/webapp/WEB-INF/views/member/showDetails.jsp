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
						<img src="myweb/images/"+${viewDetailPost.postImage} alt="#"
							class="img-fluid">
					</div>
					<div class="single_product_img">
						<img src="assets/img/gallery/gallery01.png" alt="#"
							class="img-fluid">
					</div>
					<div class="single_product_img">
						<img src="myweb/assets/img/gallery/gallery1.png" alt="#"
							class="img-fluid">
					</div>
				</div>
			</div>


			<div class="col-lg-8">
				<div class="single_product_text text-center">
					<h3>${viewDetailPost.title}</h3>
					<p>${viewDetailPost.productName}</p>
					
					<div>
						<h3>${viewDetailPost.nowPrice}</h3>
					</div>
					<div>
						<h4>${viewDetailPost.detail }</h4>
					</div>
					
					<div class="bid_start">
						<input type="button" value="입찰하기" onclick= " ">
						<!-- <a href="#" class="btn_3">입찰하기</a> -->
					</div>
					<form action="addCart" method="get">
						<div class="add_to_cart">
							<button>add to cart</button>
						</div>
					</form>
				</div>
			</div>

			<div class="card_area">
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
					<p>$5</p>
				</div>

			</div>
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
			<td>${viewDetailPost.productNo}</td>
			<td>${viewDetailPost.postImage}</td>
			<td>${viewDetailPost.title}</td>
			<td>${viewDetailPost.productName}</td>
			<td>${viewDetailPost.nowPrice}</td>
			<td>${viewDetailPost.bidEndTime}</td>
			<td>${viewDetailPost.memberVO.memberId}</td>
			<td>${viewDetailPost.memberVO.name}</td>
		</tr>
	</table>
</div>
