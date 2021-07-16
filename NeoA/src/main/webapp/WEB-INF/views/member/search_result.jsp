<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	let sortBy;
	
	$(document).ready(function(){
		
		$(".nav-item").click(function(){
			//alert($(this).attr('value'));
			sortBy = $(this).attr('value');
			searchByTitle();
		});
		
		$("#select1").change(function(){
			//alert($(this).val());
			perPage = $(this).val();
			searchByTitle();
		});
		
		$("#page-num1, #page-num2, #page-num3, #page-num4").click(function(){
			//alert("이게왜?"+$(this).attr('value'));
			pageNo = $(this).attr('value');
			searchByTitle();
		});			
		
	});
	
	
	function searchByTitle(){
		//alert("show all get 전송");
		perPage = $("#select1").val();
		if(sortBy==null){
			sortBy = $(".nav-tabs .active").attr('value');
		}
		//alert(pageNo);
		
		
		//${pageContext.request.contextPath} 써야하는데.. 
		let contextPath = getContextPath();
		//alert(contextPath);
		
		if(pageNo == null){
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송1");
			location.href="/user/searchByTitle?sortBy="+sortBy+"&perPage="+perPage;
		}else{
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송2");
			location.href="/user/searchByTitle?sortBy="+sortBy+"&perPage="+perPage+"&pageNo="+pageNo;
		}
	}	
	
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	

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
	                    <div class="select-this">
	                        <form action="#">
	                            <div class="select-itms">
	                                <select name="select" id="select2">
	                                	<option value="" >category</option>
	                                    <option value="" >가전</option>
	                                    <option value="" >가구</option>
	                                    <option value="" >기타</option>
	                                </select>
	                            </div>
	                        </form>
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
                        
                        <c:forEach items="${searchResult}" var="list">
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
	                                            <a href="${pageContext.request.contextPath}/addPick?productNo=${list.productNo}" style="color:black;"><span class="flaticon-heart"></span></a>
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
