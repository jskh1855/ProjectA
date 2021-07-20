<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <main>
   <script type="text/javascript">
   
   $(document).on("click", "#pick-switch-range", function() {
		var productNo = $(this).children().attr('value');
		$.ajax({
			headers:{"${_csrf.headerName}":"${_csrf.token}"}, 
			type:"post",
			data:{ data : productNo },
			dataType:"json",
			url:"/updatePick",
			context : this, 
			success:function(result){
				if(result.pick == '0'){
					$(this).children("#pick-switch").html("<span class='far fa-heart'/>");
				}else if(result.pick == '1'){
					$(this).children("#pick-switch").html("<span class='fas fa-heart' style='color: red;'/>");
				}
			}
		});
	}); 
   </script>
        <!--? slider Area Start -->
        <div class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center slide-bg">
                    <div class="container">
                        <div class="row justify-content-between align-items-center">
                            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">What's new today?</h1>
                                    <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">오늘의 물건들을 옥션으로 만나보세요, Project_a는 고객님들을 위한 쉬운 옥션 서비스를 제공합니다. </p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s" data-duration="2000ms">
                                        <a href="${pageContext.request.contextPath}/user/showAll" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="${pageContext.request.contextPath}/myweb/assets/img/hero/watch.png" alt="" class=" heartbeat">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center slide-bg">
                    <div class="container">
                        <div class="row justify-content-between align-items-center">
                            <div class="col-sm-5">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">Keep in touch with your a_uction</h1>
                                    <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">조심하세요, 순간의 방심으로 당신 물건은 남에게 돌아갈지도..? </p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s" data-duration="2000ms">
                                        <a href="${pageContext.request.contextPath}/user/showAll" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="${pageContext.request.contextPath}/myweb/assets/img/jhk/auction2.png" alt="" class=" heartbeat">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            
            </div>
        </div>
        
        
        <!-- slider Area End-->
        <!-- ? New Product Start -->
        <section class="new-product-area section-padding30">
            <div class="container">
                <!-- Section tittle -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section-tittle mb-70">
                            <h2>방금 올라왔어요!</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                      <c:forEach items="${recentThree }" var="three">
                
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6" style="border:inactiveborder;">
                        <div class="single-new-pro mb-30 text-center">
                            <div class="product-img">
                                <a href="/user/productDetails?productNo=${three.productNo }"><img src="${pageContext.request.contextPath}/myweb/images/${three.productNo }/${three.postImage }" alt="" style="height: 300px;"></a>
                            </div>
                            <div class="product-caption">
                                <h3><a href="/user/productDetails?productNo=${three.productNo }">${three.title }</a></h3>
                                <span> Now! ${three.nowPrice }</span>
                            </div>
                                                              <sec:authorize access="isAuthenticated()">
		                                        <div class="favorit-items">
		                                        	<span id="pick-switch-range">
			                                        	<c:choose>
			                                        		<c:when test="${three.pickVO.memberId != null}">
					                                            	<a id="pick-switch" value="${three.productNo}"><span class="fas fa-heart" style="color: red;"/></a>
			                                        		</c:when>
			                                        		<c:otherwise>
		                                        					<a id="pick-switch" value="${three.productNo}"><span class="far fa-heart"/></a>
						                                            <%-- <a href="${pageContext.request.contextPath}/addPick?productNo=${list.productNo}" style="color:black;"><span class="flaticon-heart"></span></a> --%>
			                                        		</c:otherwise>
			                                        	</c:choose>
		                                        	</span>
		                                   		</div>
	                                        </sec:authorize>
                        </div>
                    </div>
                    <!-- 하트 로그인 유저만 -->
	      
                    
               </c:forEach>
                </div>
            </div>
        </section>
        <!--  New Product End -->
        <!--? Gallery Area Start -->
        <div class="gallery-area">
            <div class="container-fluid p-0 fix">
                <div class="row">
                    <div class="col-xl-6 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-gallery mb-30">
                            <div class="gallery-img big-img" style="background-image: url(${pageContext.request.contextPath}/myweb/assets/img/gallery/gallery1.png);"></div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-gallery mb-30">
                            <div class="gallery-img big-img" style="background-image: url(${pageContext.request.contextPath}/myweb/assets/img/gallery/gallery2.png);"></div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-12">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-6 col-sm-6">
                                <div class="single-gallery mb-30">
                                    <div class="gallery-img small-img" style="background-image: url(${pageContext.request.contextPath}/myweb/assets/img/gallery/gallery3.png);"></div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12  col-md-6 col-sm-6">
                                <div class="single-gallery mb-30">
                                    <div class="gallery-img small-img" style="background-image: url(${pageContext.request.contextPath}/myweb/assets/img/gallery/gallery4.png);"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Gallery Area End -->
        <!--? Popular Items Start -->
        <div class="popular-items section-padding30">
            <div class="container">
                <!-- Section tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-70 text-center">
                            <h2>인기상품!!</h2>
                            <p>지금 가장 치열한 가격 싸움이 진행중인 상품들이에요!</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<c:forEach var="product" items="${pList }" begin="0" end="5">
	                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
	                        <div class="single-popular-items mb-50 text-center">
	                            <div class="popular-img">
	                                <img src="/myweb/images/${product.productNo }/${product.postImage}" alt="" height="300">
	                                <div class="img-cap">
	                                    <span>Add to cart</span>
	                                </div>
	                                <div class="favorit-items">
	                                    <span class="flaticon-heart"></span>
	                                </div>
	                            </div>
	                            <div class="popular-caption">
	                                <h3><a href="/user/productDetails?productNo=${product.productNo }">${product.title}</a></h3>
	                                 <span> <span style="font-style: italic; color: red;">Hot!</span>${product.nowPrice}원</span>
	                            </div>
	                        </div>
	                    </div>							
					</c:forEach>
                </div>
                <!-- Button -->
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="${pageContext.request.contextPath}/user/showAll" class="btn view-btn1">View More Products</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Popular Items End -->
        <!--? Video Area Start -->
        <div class="video-area">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                    <div class="video-wrap">
                        <div class="play-btn "><a class="popup-video" href="https://www.youtube.com/watch?v=uxQZVGU72lE"><i class="fas fa-play"></i></a></div>
                    </div>
                    </div>
                </div>
                <!-- Arrow -->
                <div class="thumb-content-box">
                    <div class="thumb-content">
                        <h3>Next Video</h3>
                        <a href="https://www.youtube.com/watch?v=6GgkySMKwUs"> <i class="flaticon-arrow"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Video Area End -->
        <!--? Watch Choice  Start-->
        <div class="watch-area section-padding30">
            <div class="container">
                <div class="row align-items-center justify-content-between padding-130">
                    <div class="col-lg-5 col-md-6">
                        <div class="watch-details mb-40">
                            <h2>product of Choice</h2>
                            <a href="${pageContext.request.contextPath}/user/showAll" class="btn">Show More Product</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-10">
                        <div class="choice-watch-img mb-40">
                            <img src="/myweb/images/${pList[0].productNo }/${pList[0].postImage}" alt="">
                        </div>
                    </div>
                </div>
                <div class="row align-items-center justify-content-between">
                    <div class="col-lg-6 col-md-6 col-sm-10">
                        <div class="choice-watch-img mb-40">
                            <img src="/myweb/images/${pList[1].productNo }/${pList[1].postImage}" alt="">
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="watch-details mb-40">
                            <h2>product of Choice</h2>
                            <a href="${pageContext.request.contextPath}/user/showAll" class="btn">Show More Product</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Watch Choice  End-->
        <!--? Shop Method Start-->
        <div class="shop-method-area">
            <div class="container">
                <div class="method-wrapper">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-package"></i>
                                <h6>고객센터</h6>
                                <p>거래상품이 마음에 들지 않으세요?</p>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-unlock"></i>
                                <h6>안전한 거래 요망</h6>
                                <p>거래시 발생하는 사건들에 대한 책임은 본인이!</p>
                            </div>
                        </div> 
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-reload"></i>
                                <h6>a하러가기</h6>
                                <p>당신의 물건의 가치는 얼마일까요?</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Method End-->
    </main>