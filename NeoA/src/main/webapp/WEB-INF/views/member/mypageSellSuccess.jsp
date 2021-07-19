<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<!-- 	<div class="slider-area ">
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
	</div> -->
	<!-- Hero Area End-->
	<!-- Latest Products Start -->
	<section class="popular-items latest-padding">
		<div class="container">
			<div class="row product-btn justify-content-between mb-40">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link" id="nav-home-tab" href="${pageContext.request.contextPath}/mypage" role="tab" aria-controls="nav-home" aria-selected="false"> 판매 목록</a>
							<a class="nav-item nav-link" id="nav-profile-tab" href="${pageContext.request.contextPath}/myBidList" role="tab" aria-controls="nav-profile" aria-selected="false"> 입찰 목록</a>
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="false"> pick 목록 </a>
							<a class="nav-item nav-link active" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageSellSuccess" role="tab" aria-controls="nav-contact" aria-selected="true"> 판매 완료 목록 </a>
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageBidSuccess" role="tab" aria-controls="nav-contact" aria-selected="false"> 입찰 성공 목록 </a>
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageMyInfo" role="tab" aria-controls="nav-userInfo" aria-selected="false"> 나의 정보 </a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
				<!-- Grid and List view -->
				<div class="grid-list-view"></div>
				<!-- Select items -->
			</div>
	<!--  ${list}<br>${buyerMemberVO }-->
			<!-- Nav Card -->
			<div class="tab-content" id="nav-tabContent">
				<!-- card one -->
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="row">
						<c:forEach var="item" items="${list}">
							<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
								<div class="single-popular-items mb-50 text-center">
									<div class="popular-img" style="height: 252.63px">
										<a href="/user/productDetails?productNo=${item.productNo }">
											<img style="height: 240px; width: auto" src="/myweb/images/${item.productNo }/${item.postImage }" alt="">
										</a>
										<div class="img-cap">
											<a href="/user/productDetails?productNo=${item.productNo }">
												<span>상세 보기</span>
											</a>
										</div>
									</div>
									<div class="popular-caption">
										<h3>
											<a href="/user/productDetails?productNo=${item.productNo }">
												<c:out value="${item.title}" />
											</a>
										</h3>
										<span>낙찰가 <c:out value="${item.nowPrice}" /></span> 
										<span>총 입찰 수 <c:out value="${fn:length(item.bidLogVOList) }" /> 명				</span> 
										<div style="background-color: #ed6f63;">
											<span style="color: white">구매자 성명 : ${buyerMemberVO.name } </span>
											<span style="color: white">구매자 연락처 : ${buyerMemberVO.phoneNo }</span>
											<span style="color: white">구매자 주소 : ${buyerMemberVO.address }</span>
										</div>
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