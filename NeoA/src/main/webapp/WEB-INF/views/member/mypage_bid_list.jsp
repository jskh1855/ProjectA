<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	<!--         <div class="slider-area ">
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
							<a class="nav-item nav-link active" id="nav-profile-tab" href="${pageContext.request.contextPath}/myBidList" role="tab" aria-controls="nav-profile" aria-selected="true"> 입찰 목록</a>
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="false"> pick 목록 </a>
							<a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageSellSuccess" role="tab" aria-controls="nav-contact" aria-selected="false"> 판매 완료 목록 </a>
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
			<%-- ${list }
                <hr> --%>
			<!-- Nav Card -->
			<div class="tab-content" id="nav-tabContent">
				<!-- Card two -->
				<div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					<div class="row">
						<c:forEach var="item" items="${list}">
							<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
								<div class="single-popular-items mb-50 text-center">
									<div class="popular-img" style="height: 252.63px">
										<a href="/user/productDetails?productNo=${item.productNo }">
											<img style="height: 240px; width: auto" src="/myweb/images/${item.productNo }/${item.postImage }" alt="">
										</a>
										<div class="img-cap">
											<span>상세보기</span>
										</div>
									</div>
									<div class="popular-caption">
										<h3>
											<a href="product_details.html">
												<c:out value="${item.title}" />
											</a>
										</h3>
										<span>상품명 <c:out value="${item.productName}" /></span> <span>현재가 <c:out value="${item.nowPrice}" /></span>
										<c:set var="last" value="${fn:length(item.bidLogVOList )-1}" />
										<sec:authentication var="currMemberId" property='principal.memberId' />
										<%-- ${last }
										${item.bidLogVOList[last].memberId }--%>
										<c:choose>
											<c:when test="${item.bidLogVOList[last].memberId ==currMemberId}">
												최상위 입찰 중
											</c:when>
											<c:otherwise>
												최상위 입찰자 아님
											</c:otherwise>
										</c:choose>
										<span id="${item.productNo}"> 남은시간 </span>
										<c:choose>
											<c:when test="${item.state eq 2}">
												<script>
													document.getElementById(${item.productNo}).innerHTML="낙찰완료";
											</script>
											</c:when>
											<c:otherwise>
											<%--시간 계산 스크립트 --%>
											<script>
												function remainTime(){
													var stDay = new Date().getDate();
													var edDay = new Date("${item.bidEndTime}").getDate(); // 종료날짜
													var stDate = new Date().getTime();
													var edDate = new Date("${item.bidEndTime}").getTime(); // 종료날짜
													var RemainDate = edDate - stDate;
													if(RemainDate<0){
														document.getElementById(${item.productNo}).innerHTML= "경매시간 만료, 역경매 시작";
													}else{
														var day = edDay-stDay;
														var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
														var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
														var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
														m = day +"일 " + hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
														document.getElementById(${item.productNo}).innerHTML="남은시간 " + m;
													}
												}
												function startInterval(seconds, remainTime){
													remainTime();
													return setInterval(remainTime, seconds * 1000);
												};
												startInterval(1, remainTime);
											</script>
											</c:otherwise>
										</c:choose>
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
				<a href="/myBidList?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</c:if>
			<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage==page}">
						<a class="active" href="/myBidList?pageNo=${page}">${page}</a>
					</c:when>
					<c:otherwise>
						<a href="/myBidList?pageNo=${page}">${page}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<a href="/myBidList?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</c:if>
		</div>
	</div>
</main>