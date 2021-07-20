<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/myweb/assets/js/jquery.nice-select.min.js"></script>
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
	$(document)
			.on(
					"click",
					"#pick-switch-range",
					function() {
						var productNo = $(this).children().attr('value');
						//alert(productNo);
						//alert("부모 : "+$(this).html());
						//$(this).children("#pick-switch").html("123123");
						//alert("자식 : "+$(this).children("#pick-switch").html());
						$
								.ajax({
									headers : {
										"${_csrf.headerName}" : "${_csrf.token}"
									},
									type : "post",
									data : {
										data : productNo
									},
									dataType : "json",
									url : "/updatePick",
									context : this, // success callback 에서 this 쓰기 위해 
									success : function(result) {
										if (result.pick == '0') {
											//alert("찜ㄴㄴ");
											$(this)
													.children("#pick-switch")
													.html(
															"<span class='far fa-heart'/>");
										} else if (result.pick == '1') {
											//alert("찜했음");
											$(this)
													.children("#pick-switch")
													.html(
															"<span class='fas fa-heart' style='color: red;'/>");
										}
									}
								});
					});
</script>
<script type="text/javascript">
	let pageNo = null;
	let perPage = null;
	let sortBy;

	$(document).ready(function() {

		$(".nav-item").click(function() {
			//alert($(this).attr('value'));
			sortBy = $(this).attr('value');
			searchByTitle();
		});

		$("#select1").change(function() {
			//alert($(this).val());
			perPage = $(this).val();
			searchByTitle();
		});

		$("#page-num1, #page-num2, #page-num3, #page-num4").click(function() {
			//alert("이게왜?"+$(this).attr('value'));
			pageNo = $(this).attr('value');
			searchByTitle();
		});

	});

	function searchByTitle() {
		//alert("show all get 전송");
		perPage = $("#select1").val();
		if (sortBy == null) {
			sortBy = $(".nav-tabs .active").attr('value');
		}
		//alert(pageNo);

		//${pageContext.request.contextPath} 써야하는데.. 
		let contextPath = getContextPath();
		//alert(contextPath);

		if (pageNo == null) {
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송1");
			location.href = "/user/searchByTitle?sortBy=" + sortBy
					+ "&perPage=" + perPage;
		} else {
			//alert("  "+sortBy+"   "+perPage+"   "+pageNo+"   "+"전송2");
			location.href = "/user/searchByTitle?sortBy=" + sortBy
					+ "&perPage=" + perPage + "&pageNo=" + pageNo;
		}
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
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


<br>

<!-- Latest Products Start -->
<section class="popular-items latest-padding">
	<div class="container">
		
		<!-- Nav Card -->
		<div class="tab-content" id="nav-tabContent">
			<!-- card one -->
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">
				<div class="row">

					<c:forEach items="${searchResult}" var="list">
						<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
							<div class="single-popular-items mb-50 text-center">
								<div class="popular-img" style="height:252.63px">
									<a href="/user/productDetails?productNo=${list.productNo }"><img
										style="height: 240px; width: auto"
										src="/myweb/images/${list.productNo }/${list.postImage }"
										alt=""></a>

									<div class="img-cap">
										<a href="/user/productDetails?productNo=${list.productNo }"><span>상세보기</span></a>
									</div>

									<!-- 하트 로그인 유저만 -->
									<sec:authorize access="isAuthenticated()">
										<div class="favorit-items" style="font-size: 30px;"
											align="right">
											<span id="pick-switch-range"> <c:choose>
													<c:when test="${list.pickVO.memberId != null}">
														<a id="pick-switch" value="${list.productNo}"><span
															class="fas fa-heart" style="color: red;" /></a>
													</c:when>
													<c:otherwise>
														<a id="pick-switch" value="${list.productNo}"><span
															class="far fa-heart" /></a>
													</c:otherwise>
												</c:choose>
											</span>
										</div>
									</sec:authorize>
								</div>
								<div class="popular-caption">
									<h3>
										<a
											href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">${list.title}</a>
									</h3>
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
		<div class="center">
			<ul class="pagination">
				<c:if test="${pb.previousPageGroup}">
					<a id="page-num3" value="${pb.startPageOfPageGroup-1}">&laquo;</a>
				</c:if>
				<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage==page}">
							<a class="active" id="page-num1" value="${page}">${page}</a>
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
</section>			</div>
	</div>
	</section>
