<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: red;
	color: white;
	border: 1px solid red;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pagination a:first-child {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

.pagination a:last-child {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}
</style>

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
							<a class="nav-item nav-link active" id="nav-home-tab" href="${pageContext.request.contextPath}/mypage" role="tab" aria-controls="nav-home" aria-selected="true"> 판매 목록</a> 
							<a class="nav-item nav-link" id="nav-profile-tab" href="${pageContext.request.contextPath}/myBidList" role="tab" aria-controls="nav-profile" aria-selected="false"> 입찰 목록</a> 
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="false"> pick 목록 </a> 
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageMyInfo" role="tab" aria-controls="nav-userInfo" aria-selected="false"> 나의 정보 </a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
				<!-- Grid and List view -->
				<div class="grid-list-view"></div>
				<!-- Select items -->
			</div>

			<%-- ${list }
			<hr> --%>

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
										<span>시작가 <c:out value="${item.startPrice}" /></span> <span>현재가 <c:out value="${item.nowPrice}" /></span> <span>입찰자수 <c:out value="" /> 명
										</span> <span id="${item.productNo}"> 남은시간 </span>
										<script>
											var timer = setInterval(function(){
												var stDate = new Date().getTime();
												var edDate = new Date("${item.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
										 
												var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
												var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
												var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
												m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
											  
												document.getElementById(${item.productNo}).innerHTML= "남은시간 " + m;
											}, 1000);
										</script>
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

	<%-- 페이징 처리 --%>
	<%-- 	${requestScope.pagingBean}<hr> --%>
	<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
	<div class="center">
		<div class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<a href="/mypage?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</c:if>
			<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage==page}">
						<a class="active" href="/mypage?pageNo=${page}">${page}</a>
					</c:when>
					<c:otherwise>
						<a href="/mypage?pageNo=${page}">${page}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<a href="/mypage?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</c:if>
		</div>
	</div>
</main>