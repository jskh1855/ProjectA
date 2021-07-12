<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main>
	<!-- Hero Area Start-->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-10">
						<div class="hero-cap text-center">
							<h2>상품 상세</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<img src="myweb/images/auction2.png">gvgvgvtg
						<c:forEach items="${viewDetailPost}" var="list">
	
	<!-- Hero Area End-->
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="product_img_slide owl-carousel">
						<div class="single_product_img">
							
						</div>
						<div class="single_product_img">
							<img src="assets/img/gallery/gallery01.png" alt="#"
								class="img-fluid">
						</div>
						<div class="single_product_img">
							<img src="assets/img/gallery/gallery1.png" alt="#"
								class="img-fluid">
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-8">
					<div class="single_product_text text-center">
						<h3>
							제목 <br> ${list.title}
						</h3>
						<p>${list.productName}</p>
						<div class="card_area">
							<div class="product_count_area">
								<p>Quantity</p>
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
							<div class="bid_start">
								<a href="#" class="btn_3">입찰하기</a>
							</div>
							<form action="addCart" method="get">
								<div class="add_to_cart">
									<button>add to cart </button>
								</div>
							</form>
						</div>
						</c:forEach>
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
	<!-- subscribe part end -->
</main>