<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/myweb/assets/js/jquery.nice-select.min.js"></script>
<!-- 경로 문제인가요? -->

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
	let pageNo = null;
	let perPage = null;
	let sortBy = null;
	
	$(document).ready(function(){
		
		$(".nav-item").click(function(){
			//alert($(this).attr('value'));
			sortBy = $(this).attr('value');
			showAll();
		});
		
		$("#select1").change(function(){
			//alert($(this).val());
			perPage = $(this).val();
			showAll();
		});
		
		$("#page-num1, #page-num2, #page-num3, #page-num4").click(function(){
			//alert("이게왜?"+$(this).attr('value'));
			pageNo = $(this).attr('value');
			showAll();
		});			
		
		$("#categoryButton").click(function(){
			showAll();
		});
		
		
  		$.ajaxSetup({
			success:function(result){
				alert(result);
			},
			error:function(){
				alert("fail");
			}
		});//ajaxSetup 

/* 		// 찜목록 ajax 처리 
		$("#pick-switch").click(function(){
			var productNo = $(this).attr('value');
			alert(productNo);
			$.ajax({
				headers:{"${_csrf.headerName}":"${_csrf.token}"}, 
				type:"post",
				data:{ data : productNo },
				dataType:"json",
				url:"/updatePick",
				success:function(result){
					if(result.pick == '0'){
						alert("찜ㄴㄴ");
						$(this).html("찜ㄴㄴ");
					}else if(result.pick == '1'){
						alert("찜했음");
						$(this).html("찜했음");
					}
				}
			});
		}); */
		// 찜목록 ajax 처리    //on 메소드를 사용해 부모속성을 이용해 처리?
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
						$(this).children("#pick-switch").html("찜ㄴㄴ");
					}else if(result.pick == '1'){
						//alert("찜했음");
						$(this).children("#pick-switch").html("찜했음");
					}
				}
			});
		});
		
	});

	
	
	function showAll(){
		//alert("show all get 전송");
		perPage = $("#select1").val();
		if(sortBy==null){
			sortBy = $(".nav-tabs .active").attr('value');
		}
		
		let ca1 = '';
		if($("#productSelect option:selected").text()!='대분류 선택'){
			ca1 = $("#productSelect option:selected").text()+'a';
		}
		let ca2 = '';
		if($("#mallSelect option:selected").text()!='중분류 선택'){
			ca2 = $("#mallSelect option:selected").text()+'a';
		}
		let category=ca1+ca2;
		
		//alert(category);
		//alert(pageNo);
		
		//${pageContext.request.contextPath} 써야하는데.. 
		let contextPath = getContextPath();
		//alert(contextPath);
		
		if(pageNo == null){
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송1");
			location.href="/user/showAll?sortBy="+sortBy+"&perPage="+perPage+"&category="+category;
		}else{
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송2");
			location.href="/user/showAll?sortBy="+sortBy+"&perPage="+perPage+"&category="+category+"&pageNo="+pageNo;
		}
	}	
	
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	

</script>

<script type="text/javascript">

	var malls = true;
	
	function update_selected() {
	  $("#mallSelect").val(0);
	  $("#mallSelect").find("option[value!=0]").detach();
	
	  $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
	}
	
	$(function() {
	  malls = $("#mallSelect").find("option[value!=0]");
	  malls.detach();
	
	  $("#productSelect").change(update_selected);
	  $("#productSelect").trigger("change");
	});
</script>

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
			<th>pick</th>
			<th>넘버</th>
			<th>제품사진</th>
			<th>제목</th>
			<th>제품명</th>
			<th>현재가</th>
			<th>종료시간</th>
			<th>판매자아이디</th>
			<th>판매자이름</th>
			<th>로그인회원찜유무(아이디로)</th>
		</tr>
	<c:forEach items="${postVOList}" var="list">
	
		<tr>
			<td>
			<div class="favorit-items">
	        <a href="${pageContext.request.contextPath}/addPick?productNo=${list.productNo}" style="color:black;"><span class="flaticon-heart"></span></a>
	        </div>
			</td>
			<td>${list.productNo}</td>
			<td>${list.postImage}</td>
			<td>${list.title}</td>
			<td>${list.productName}</td>
			<td>${list.nowPrice}</td>
			<td>에러</td>
			<td>${list.memberVO.memberId}</td>
			<td>${list.memberVO.name}</td>
			<td>${list.pickVO.memberId}</td>
		</tr>
	</c:forEach>
	</table> 
	
	 <%--<sec:authentication property="principal.name"/>  찜 확인 --%>
	 
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

<sec:authorize access="isAuthenticated()==false">
	로그인 x
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	로그인 ok
	<input type="button" id="testJSONButton" value="4">
	
	<br><br>
	<a id="test-a-tag">응</a> 
</sec:authorize>
	

dd<br>
${pagingBean.ca1}
<br>
${pagingBean.ca2}
<br>
${pagingBean.category}

</div>



        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">
            <div class="container">
	            <div class="row product-btn justify-content-between mb-40">
	                    <div class="select-this">
	                        <form action="#">
	                            <div class="select-itms">
	                                <select id="productSelect" name = "top">
									   <option value="0" >대분류 선택</option>
									   <option value="1" <c:if test="${pagingBean.ca1 eq '전자제품'}">selected</c:if>>전자제품</option>
									   <option value="2" <c:if test="${pagingBean.ca1 eq '패션'}">selected</c:if>>패션</option>
									   <option value="3" <c:if test="${pagingBean.ca1 eq '책'}">selected</c:if>>책</option>
									</select>
	                            </div>
	                        </form>
	                    </div>
	                    <div class="select-this">
	                        <form action="#">
	                            <div class="select-itms">
	                                <select id="mallSelect" name = "mid">
									   <option value="0">중분류 선택</option>
									   <option value="스마트폰" class="mall1" <c:if test="${pagingBean.ca2 eq '스마트폰'}">selected</c:if>>스마트폰</option>
									   <option value="컴퓨터" class="mall1" <c:if test="${pagingBean.ca2 eq '컴퓨터'}">selected</c:if>>컴퓨터</option>
									   <option value="TV" class="mall1" <c:if test="${pagingBean.ca2 eq 'TV'}">selected</c:if>>TV</option>
									   <option value="신발" class="mall2" <c:if test="${pagingBean.ca2 eq '신발'}">selected</c:if>>신발</option>
									   <option value="상의" class="mall2" <c:if test="${pagingBean.ca2 eq '상의'}">selected</c:if>>상의</option>  
									   <option value="하의" class="mall2" <c:if test="${pagingBean.ca2 eq '하의'}">selected</c:if>>하의</option>
									   <option value="악세서리" class="mall2" <c:if test="${pagingBean.ca2 eq '악세서리'}">selected</c:if>>악세서리</option> 
									   <option value="소설" class="mall3" <c:if test="${pagingBean.ca2 eq '소설'}">selected</c:if>>소설</option>
									   <option value="만화책" class="mall3" <c:if test="${pagingBean.ca2 eq '만화책'}">selected</c:if>>만화책</option>
									   <option value="전문서적" class="mall3" <c:if test="${pagingBean.ca2 eq '전문서적'}">selected</c:if>>전문서적</option>
									   <option value="잡지" class="mall3" <c:if test="${pagingBean.ca2 eq '잡지'}">selected</c:if>>잡지</option>
									</select>
	                            </div>
	                        </form>
	                    </div>
	                    <div>
	                    	<input type="button" id="categoryButton" value="카테고리 선택 완료">
	                    </div>
	                    
	                    <div class="properties__button">
	                        <!--Nav Button  -->
	                        <nav>                                                      
	                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
	                                <a class="nav-item nav-link <c:if test="${pagingBean.sortBy eq 'product_up_time desc'}">active</c:if>" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" value="product_up_time desc">등록일순</a>
	                                <a class="nav-item nav-link <c:if test="${pagingBean.sortBy eq 'now_price asc'}">active</c:if>"  id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" value="now_price asc">낮은 가격순</a>
	                                <a class="nav-item nav-link <c:if test="${pagingBean.sortBy eq 'now_price desc'}">active</c:if>"  id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false" value="now_price desc">높은 가격순</a>
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
	                                    <option value="3" <c:if test="${pagingBean.postCountPerPage eq 3}">selected</c:if>>3 per page</option>
	                                    <option value="6" <c:if test="${pagingBean.postCountPerPage eq 6}">selected</c:if>>6 per page</option>
	                                    <option value="12" <c:if test="${pagingBean.postCountPerPage eq 12}">selected</c:if>>12 per page</option>
	                                    <option value="24" <c:if test="${pagingBean.postCountPerPage eq 24}">selected</c:if>>24 per page</option>
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
	                                        
	                                        <!-- 하트 로그인 유저만 -->
	                                        <sec:authorize access="isAuthenticated()">
		                                        <div class="favorit-items">
		                                        	<span id="pick-switch-range">
			                                        	<c:choose>
			                                        		<c:when test="${list.pickVO.memberId != null}">
					                                            	<a id="pick-switch" value="${list.productNo}">찜했음</a>
			                                        		</c:when>
			                                        		<c:otherwise>
		                                        					<a id="pick-switch" value="${list.productNo}">찜ㄴㄴ</a>
						                                            <%-- <a href="${pageContext.request.contextPath}/addPick?productNo=${list.productNo}" style="color:black;"><span class="flaticon-heart"></span></a> --%>
			                                        		</c:otherwise>
			                                        	</c:choose>
		                                        	</span>
		                                   		</div>
	                                        </sec:authorize>
	                                        
	                                    </div>
	                                    <div class="popular-caption">
	                                        <h3><a href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">${list.title}</a></h3>
	                                        <span> ${list.nowPrice} 원</span>
	                                    </div>
	                                    <div class="popular-caption">
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
						<%-- 페이징 처리 --%>
					<%-- ${requestScope.pagingBean} --%>
					<c:set var="pb" value="${pagingBean}"></c:set>
					<div class="center" >
						<ul class="pagination">
						<c:if test="${pb.previousPageGroup}">
							<a id="page-num3" value="${pb.startPageOfPageGroup-1}">&laquo;</a>
						</c:if>
							<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${pb.nowPage==page}">
									<a class="active" id="page-num1"  value="${page}">${page}</a>
								</c:when>
								<c:otherwise>
									<a id="page-num2" value="${page}">${page}</a>
								</c:otherwise>
							</c:choose>		
							</c:forEach>
						<c:if test="${pb.nextPageGroup}">
							<a id="page-num4" value="${pb.endPageOfPageGroup+1}">&raquo;</a>
						</c:if>	
						</ul>
					</div>
	</div>
	</section>
	
	
