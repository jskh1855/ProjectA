<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function remainTime() {
		alert("3");
/* 		// Set the date we're counting down to
		var countDownDate = new Date("Jan 5, 2023 15:37:25").getTime();

		// Update the count down every 1 second
		var x = setInterval(function() {

			// Get today's date and time
			var now = new Date().getTime();

			// Find the distance between now and the count down date
			var distance = countDownDate - now;

			// Time calculations for days, hours, minutes and seconds
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60))
					/ (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);

			// Output the result in an element with id="demo"
			document.getElementById("demo").innerHTML = days + "d " + hours
					+ "h " + minutes + "m " + seconds + "s ";

			// If the count down is over, write some text 
			if (distance < 0) {
				clearInterval(x);
				document.getElementById("demo").innerHTML = "EXPIRED";
			}
		}, 1000); */
	}
</script>

<main>
	<!-- Hero Area Start-->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>마이 페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Hero Area End-->
	<!-- Latest Products Start -->
	<section class="popular-items latest-padding">
		<div class="container">
			<div class="row product-btn justify-content-between mb-40">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab" href="${pageContext.request.contextPath}/user/mypage" role="tab" aria-controls="nav-home" aria-selected="true"> 판매 목록</a> <a class="nav-item nav-link" id="nav-profile-tab" href="${pageContext.request.contextPath}/user/myBidList" role="tab" aria-controls="nav-profile" aria-selected="false"> 입찰 목록</a> <a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/user/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="false"> pick 목록 </a> <a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/user/mypageMyInfo" role="tab" aria-controls="nav-userInfo" aria-selected="false"> 나의 정보 </a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
				<!-- Grid and List view -->
				<div class="grid-list-view"></div>
				<!-- Select items -->
			</div>
			${list }
			<hr>

			<!-- Nav Card -->
			<div class="tab-content" id="nav-tabContent">
				<!-- card one -->
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="row">
						<c:forEach var="item" items="${list}">
							<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
								<div class="single-popular-items mb-50 text-center">
									<div class="popular-img">
										<img src="/myweb/assets/img/gallery/popular1.png" alt="">
										<div class="img-cap">
											<span>상세 보기</span>
										</div>
									</div>
									<div class="popular-caption">
										<h3>
											<a href="product_details.html"> <c:out value="${item.title}" /></a>
										</h3>
										<span>시작가 <c:out value="${item.startPrice}" /></span> 
										<span>현재가 <c:out value="${item.nowPrice}" /></span> 
										<span>입찰자수 <c:out value="${item.title}" /> 명	</span> 
										<span id="demo" onload="remainTime()">남은 시간	</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- End Nav Card -->
		</div>
	</section>
	<!-- Latest Products End -->
	<!--? Shop Method Start-->
	<div class="shop-method-area">
		<div class="container">
			<div class="method-wrapper">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-package"></i>
							<h6>Free Shipping Method</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-unlock"></i>
							<h6>Secure Payment System</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-reload"></i>
							<h6>Secure Payment System</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Method End-->

</main>