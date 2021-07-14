<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>S h o p</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%-- 전체 목록 출력을 위한 테스트 by jaehoon --%>
전체 목록 출력 
<div class="container">
데이터 가져다 쓰기~
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
	<c:forEach items="${postVOList}" var="list">
		<tr>
			<td>${list.productNo}</td>
			<td>${list.postImage}</td>
			<td>${list.title}</td>
			<td>${list.productName}</td>
			<td>${list.nowPrice}</td>
			<td>에러</td>
			<td>${list.memberVO.memberId}</td>
			<td>${list.memberVO.name}</td>
		</tr>
	</c:forEach>
	</table> 
</div>
<br>
<div>
	페이지당<br>
	<a href="${pageContext.request.contextPath}/user/showAll?perPage=3" style="color: black;"> 3 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?perPage=6" style="color: black;"> 6 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?perPage=12" style="color: black;"> 12 </a><br> 
	카테고리(일단 제품명으로)<br>
	<a href="${pageContext.request.contextPath}/user/showAll?category=" style="color: black;"> 초기화 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?category=나" style="color: black;"> 나 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?category=롤" style="color: black;"> 롤 </a><br>
	정렬<br>
	<a href="${pageContext.request.contextPath}/user/showAll?sortBy=product_up_time desc" style="color: black;"> 등록순 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?sortBy=now_price asc" style="color: black;"> 가격 오름차순 </a>
	<a href="${pageContext.request.contextPath}/user/showAll?sortBy=now_price desc" style="color: black;"> 가격 내림차순 </a><br>	
	
</div>
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">
            <div class="container">
	            <div class="row product-btn justify-content-between mb-40">
	                    <div class="properties__button">
	                        <!--Nav Button  -->
	                        <nav>                                                      
	                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
	                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">등록일순</a>
	                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">낮은 가격순</a>
	                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">높은 가격순</a>
	                            </div>
	                        </nav>
	                        <!--End Nav Button  -->
	                    </div>
	                    <!-- Grid and List view -->
	                    <div class="grid-list-view">
	                    </div>
	                    <!-- Select items -->
	                    <div class="select-this">
	                        <form action="#">
	                            <div class="select-itms">
	                                <select name="select" id="select1">
	                                    <option value="6">6 per page</option>
	                                    <option value="12">12 per page</option>
	                                    <option value="18">18 per page</option>
	                                    <option value="24">24 per page</option>
	                                </select>
	                            </div>
	                        </form>
	                    </div>
	                </div>
<!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="row">
                        
                        <c:forEach items="${postVOList}" var="list">
	                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
	                                <div class="single-popular-items mb-50 text-center">
	                                    <div class="popular-img">
	                                        <img src="${pageContext.request.contextPath}/myweb/assets/img/gallery/popular1.png" alt="">
	                                        <div class="img-cap">
	                                        	<div>
	                                            	<span style="float: left; width: 50%; background-color: pink;" >sub1</span>
	                                            	<span style="float: left; width: 50%">sub22</span>
	                                            </div>
	                                        </div>
	                                        <div class="favorit-items">
	                                            <span class="flaticon-heart"></span>
	                                        </div>
	                                    </div>
	                                    <div class="popular-caption">
	                                        <h3><a href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">${list.title}</a></h3>
	                                        <span> ${list.nowPrice} 원</span>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
             </div>
						<%-- 페이징 처리 --%>
					<%-- ${requestScope.pagingBean} --%>
					<c:set var="pb" value="${pagingBean}"></c:set>
					<div class="pagingArea" style="background-color: gray;">
						<ul class="pagination">
						<c:if test="${pb.previousPageGroup}">
						<li><a href="${pageContext.request.contextPath}/user/showAll?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
						</c:if>
							<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${pb.nowPage==page}">
								<li class="active"><a href="${pageContext.request.contextPath}/user/showAll?pageNo=${page}">${page}</a></li>
								</c:when>
								<c:otherwise>
								<li href="sdsd"><a href="${pageContext.request.contextPath}/user/showAll?pageNo=${page}">${page}</a></li>
								</c:otherwise>
							</c:choose>		
							</c:forEach>
						<c:if test="${pb.nextPageGroup}">
						<li><a href="${pageContext.request.contextPath}/user/showAll?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:if>	
						</ul>
					</div>
	</div>
	</section>
