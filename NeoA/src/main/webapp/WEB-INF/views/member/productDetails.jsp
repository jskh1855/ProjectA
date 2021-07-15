<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajaxPrefilter(function(options) {
			let headerName = '${_csrf.headerName}';
			let token = '${_csrf.token}';
			if (options.type.toLowerCase() === 'post') {
			options.headers = {};
			options.headers[headerName] = token;
			}
		});
		
		$.ajax({
			url: "demo_test.txt", 
			success: function(result){
			    $("#div1").html(result);
		}});
		
	})
</script>

<main>
	<!-- Hero Area Start-->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>상품 상세페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
${productDetails }

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="assets/img/gallery/popular3.png" alt="" style="width: 300px;">
						</div>
						
						<div class="blog_details">
							<%--제목 --%>
							<h2>${productDetails.title }</h2>
							<%--내용 --%>
							<p class="excert">${productDetails.detail }</p>
						</div>
					
					</div>

					<%--Qna 시작 --%>
					<div class="comments-area">
						<h4>QnA</h4>
						
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="assets/img/comment/comment_2.png" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser</p>
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>
											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">질문하기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="assets/img/comment/comment_3.png" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser</p>
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>
											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">reply</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%--QnA 끝 --%>
					
					<%--Qna 폼 시작 --%>
					<div class="comment-form">
						<h4>질문하기</h4>
						<form class="form-contact comment_form" action="${pageContext.request.contextPath}/registerQuestion" method="post" id="commentForm">
							<sec:csrfInput/>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" name="qnaContent" id="comment" cols="30" rows="9" placeholder="질문을 작성하세요"></textarea>
										<input type="hidden" name="productNo" value="${productDetails.productNo }">
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="button button-contactForm btn_1 boxed-btn">질문하기</button>
							</div>
						</form>
					</div>
					<%--QnA 폼 끝 --%>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<%--입찰하기 --%>
						<div class="add_to_cart">
							<input type="text" value="26000" size="12"> 원으로 <a href="#" class="btn_3">입찰하기</a>
						</div>
						<%--제품 정보들 --%>
						<aside class="single_sidebar_widget post_category_widget">
							<%--현재가격 --%>
							<h4 class="widget_title">현재가격 25000</h4>
							<%--기타 정보들 --%>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>시작가</p>
										<p>${productDetails.startPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>즉구가</p>
										<p>${productDetails.giveMeThatPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매시작시간</p>
										<p>${productDetails.productUpTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매종료시간</p>
										<p>${productDetails.bidEndTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>남은 시간</p>
										<p id="remainTime"></p>
										<script>
												var stDate = new Date().getTime();
												var edDate = new Date("${productDetails.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
												if(RemainDate<0){
													document.getElementById(${item.productNo}).innerHTML= "만료";
												}else{
												var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
												var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
												var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
												m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
												document.getElementById("remainTime").innerHTML= m;
												}
										</script>
										<script>
											var timer = setInterval(function(){
												var stDate = new Date().getTime();
												var edDate = new Date("${productDetails.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
												if(RemainDate<0){
													document.getElementById(${item.productNo}).innerHTML= "만료";
												}else{
												var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
												var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
												var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
												m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
												document.getElementById("remainTime").innerHTML=m;
												}
											}, 1000);
										</script>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>총 입찰자 수</p>
										<p>ajax 로 구현할 부분</p>
								</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">최근 입찰 내역</h3>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 25000원</h3>
									</a>
									<p>January 12, 2019</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_2.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>B 님 24000원</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_3.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>C 님 20000원</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 10000원</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
						</aside>
						<aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">판매자 신용도</h4>
							<ul class="list">
								<li><a href="#">project</a></li>
								<li><a href="#">love</a></li>
								<li><a href="#">technology</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">restaurant</a></li>
								<li><a href="#">life style</a></li>
								<li><a href="#">design</a></li>
								<li><a href="#">illustration</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget instagram_feeds">
							<h4 class="widget_title">이런 상품도 있어요~</h4>
							<ul class="instagram_row flex-wrap">
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_5.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_6.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_7.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_8.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_9.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_10.png" alt="">
								</a></li>
							</ul>
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
</main>