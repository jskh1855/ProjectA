<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/myweb/assets/js/jquery.nice-select.min.js"></script>

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
<script type="text/javascript">
$(document).on("click", "#pick-switch-range", function() {
	var productNo = $(this).children().attr('value');
	//alert(productNo);
	//alert("부모 : "+$(this).html());
	//$(this).children("#pick-switch").html("123123");
	//alert("자식 : "+$(this).children("#pick-switch").html());
	$.ajax({
		headers:{"${_csrf.headerName}":"${_csrf.token}"}, 
		type:"post",
		data:{ data : productNo },
		dataType:"json",
		url:"/updatePick",
		context : this,   // success callback 에서 this 쓰기 위해 
		success:function(result){
			if(result.pick == '0'){
				//alert("찜ㄴㄴ");
				$(this).children("#pick-switch").html("<span class='far fa-heart'/>");
			}else if(result.pick == '1'){
				//alert("찜했음");
				$(this).children("#pick-switch").html("<span class='fas fa-heart' style='color: red;'/>");
			}
		}
	});
});

</script>


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
	                                            <a href="/user/productDetails?productNo=${item.productNo }"><span>상세보기</span></a>
	                                        </div>
	                                        
	                                        <!-- 하트 로그인 유저만 -->
	                                        <sec:authorize access="isAuthenticated()">
		                                        <div class="favorit-items">
		                                        	<span id="pick-switch-range">
			                                        	<c:choose>
			                                        		<c:when test="${list.pickVO.memberId != null}">
					                                            	<a id="pick-switch" value="${list.productNo}"><span class="fas fa-heart" style="color: red;"/></a>
			                                        		</c:when>
			                                        		<c:otherwise>
		                                        					<a id="pick-switch" value="${list.productNo}"><span class="far fa-heart"/></a>
						                                            <%-- <a href="${pageContext.request.contextPath}/addPick?productNo=${list.productNo}" style="color:black;"><span class="flaticon-heart"></span></a> --%>
			                                        		</c:otherwise>
			                                        	</c:choose>
		                                        	</span>
		                                   		</div>
	                                        </sec:authorize>
	                                        
	                                    </div>
	                                    
	                                    <div class="popular-caption">
	                                        <h3><a href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">${list.title}</a></h3>
	                                        <span>시작가 ${list.startPrice} 원</span>
	                                        <span>현재가 ${list.nowPrice} 원</span>
	                                        <span>입찰자수 <c:out value="${fn:length(list.bidLogVOList) }" /> 명</span>
	                                        
		                                    <span id="${list.productNo}">남은시간</span>
		                                    
		                                    <script>
													var stDate = new Date().getTime();
													var edDate = new Date("${list.bidEndTime}").getTime(); // 종료날짜
													var RemainDate = edDate - stDate;
													if(RemainDate<0){
														document.getElementById(${list.productNo}).innerHTML= "만료";
													}else{
													var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
													var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
													var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
													m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
													document.getElementById(${list.productNo}).innerHTML= "남은시간 " + m;
													}
											</script>
											
											<script>
												var timer = setInterval(function(){
													var stDate = new Date().getTime();
													var edDate = new Date("${list.bidEndTime}").getTime(); // 종료날짜
													var RemainDate = edDate - stDate;
													if(RemainDate<0){
														document.getElementById(${list.productNo}).innerHTML= "만료";
													}else{
													var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
													var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
													var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
													m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
													document.getElementById(${list.productNo}).innerHTML= "남은시간 " + m;
													}
												}, 1000);
											</script>  
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
             </div>