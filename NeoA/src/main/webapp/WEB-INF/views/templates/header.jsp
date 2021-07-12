<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Watch shop | eCommers</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/myweb/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/slicknav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/myweb/assets/css/style.css">
</head>

<body>
	<!--? Preloader Start -->
<!-- 	<div id="preloader-active">
		<div class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/logo.png" alt="">
				</div>
			</div>
		</div>
	</div> -->
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<!-- Logo -->
						<div class="logo">
							<a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/myweb/assets/img/logo/logo.png" alt=""></a>
						</div>
						<!-- Main-menu -->
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="home">Home</a></li>
									<%-- <li><a href="${pageContext.request.contextPath}/shop">shop</a></li> --%>
									<li><a href="${pageContext.request.contextPath}/productUpload">auction</a></li>
									<li class="hot"><a href="#">Latest</a>
										<ul class="submenu">
											<li><a href="${pageContext.request.contextPath}/user/showAll?pageNo=0"> Product list</a></li>
											<li><a href="${pageContext.request.contextPath}/user/showAll?pageNo=0"> Product Details</a></li>
										</ul></li>
									<li><a href="blog.html">Blog</a>
										<ul class="submenu">
											<li><a href="https://iamaway.tistory.com/">Blog-jh</a></li>
											<li><a href="blog-details.html">Blog-hs</a></li>
											<li><a href="https://blog.naver.com/sandeoduk">대월벌꿀 짱</a></li>
										</ul></li>
									<li><a href="#">Pages</a>
										<ul class="submenu">
											<li><a href="${pageContext.request.contextPath}/user/loginPage">Login</a></li>
											<li><a href="cart.html">Cart</a></li>
											<li><a href="elements.html">Element</a></li>
											<li><a href="confirmation.html">Confirmation</a></li>
											<li><a href="checkout.html">Product Checkout</a></li>
										</ul></li>
									<!--  <li><a href="contact.html">Contact</a></li> -->
									<li>
										<%-- <div class="nav-search search-switch" onsubmit="${pageContext.request.contextPath}/searchByTitle">
                                    <span class="flaticon-search">
                                     </span>
                                    </div> --%>
										<form action="${pageContext.request.contextPath}/user/searchByTitle">
											<div>
												<input type="text" name="title" placeholder="검색어를 입력해주세요"> <input type="submit" value="검색">
											</div>
										</form>
									</li>
									<sec:authorize access="isAuthenticated()==false">
										<li><a href="${pageContext.request.contextPath}/user/loginPage"><span class="flaticon-user"></span></a></li>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<li><a href="${pageContext.request.contextPath}/mypage"> <span class="flaticon-user"></span> <sec:csrfInput /></a></li>
										<li><a href="#" id="logoutAction" style="color: black;">logout</a>
											<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
												<sec:csrfInput />
											</form></li>
									</sec:authorize>
								</ul>
							</nav>
						</div>
					</div>
					<!-- Header Right -->
					<div class="header-right"></div>
				</div>

				<!-- Mobile Menu -->
				<div class="col-12">
					<div class="mobile_menu d-block d-lg-none"></div>
				</div>
			</div>
		</div>
		<!-- Header End -->
		<script type="text/javascript">
			$(document).ready(function() {
				$("#logoutAction").click(function() {
					$("#logoutForm").submit();
				});
			});
		</script>
	</header>