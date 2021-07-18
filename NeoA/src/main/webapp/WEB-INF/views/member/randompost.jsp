<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<script type="text/javascript">
$(document).ready(function() {
	//alert($("#memberId").val());
	<%--모든 post ajax 에 대해서 csrf 토큰 첨부하기--%>
	$.ajaxPrefilter(function(options) {
		let headerName = '${_csrf.headerName}';
		let token = '${_csrf.token}';
		if (options.type.toLowerCase() === 'post') {
		options.headers = {};
		options.headers[headerName] = token;
		}
	});
	
	//페이지 로딩시 qna 보여주기
	$.ajax({
		type:"GET",
		data:"productNo="+$("#productNo").val(),
		dataType:"json",
		url:"/user/getQnAList",
		success:function(qna){
			showQnAList(qna);
		}//callback
	});//ajax 
	
	//질문 등록 및 qna 새로 띄워주기
	$("#registerQuestion").click(function() {
		$(".comments-area").children().remove();
		$.ajax({
			type:"POST",
			url:"/registerQuestion",
			data:"qnaContent="+$("#qnaContent").val()+"&"+"productNo="+$("#productNo").val(),
			dataType:"json",
			success:function(qna){
				showQnAList(qna);
			}//callback
		});//ajax
		document.getElementById("qnaContent").value='';
	});//click
})//ready

<%--답변하기, 답변하기 form 을 동적 생성했더니 $(document).ready(function() 에선 작동 안함--%>	
function registerAnswer(qnaNo){
	answerContent = document.getElementById("answerContent").value;
	$(".comments-area").children().remove();
	$.ajax({
		type:"POST",
		url:"/registerAnswer",
		data:"qnaContent="+answerContent+"&productNo="+$("#productNo").val()+"&qnaNo="+qnaNo,
		dataType:"json",
		success:function(qna){
			showQnAList(qna);
			//$("#reply_"+qna[i].qnaNo+"_"+qna[i].qnaType).empty();
		}//callback
	});//ajax
}	

<%--답변하기 폼--%>
function replyForm(qnaNo,qnaType){
	$(".reply-form").remove();
	var reply = $(
			'<div class="reply-form">'
			+'<div class="row">'
				+'<div class="col-12">'
					+'<div class="form-group">'
						+'<textarea class="form-control w-100" id="answerContent" cols="30" rows="3" placeholder="답변을 작성하세요"></textarea>'
					+'</div>'
				+'</div>'
			+'</div>'
			+'<div>'
				+'<button id="registerAnswer" onclick="registerAnswer('+qnaNo+')" class="button button-contactForm btn_1 boxed-btn">답변하기</button>'
			+'</div></div>'
		);
	$("#qna_"+qnaNo+"_"+qnaType).append(reply);
}

<%--QnA 리스트 보여주는 함수--%>
function showQnAList(qna){
	for(let i=0;i<qna.length;i++){
		let qnaId = "qna_"+qna[i].qnaNo+"_"+qna[i].qnaType;
		let replyId = "reply_"+qna[i].qnaNo+"_"+qna[i].qnaType;
		qnaDetails=null;
		<%--질문일 경우 div 배경색 없음--%>
		if(qna[i].qnaType==0){
			qnaDetails = $(
				'<div class="comment-list" id="'+qnaId+'">'
				+'<div class="single-comment justify-content-between d-flex">'
					+'<div class="user justify-content-between d-flex">'
						+'<div class="desc"><p class="comment">'+qna[i].qnaContent+'</p>'
							+'<div class="d-flex justify-content-between">'
								+'<div class="d-flex align-items-center">'
									+'<h5><a href="#">'+qna[i].memberId+'</a></h5>'
									+'<p class="date">'+qna[i].qnaTime+'</p></div>'
								+'<div class="reply-btn">'
								+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" id="'+replyId+'" class="btn-reply text-uppercase">reply</a>'
								+'</div></div></div></div></div></div>'
		);
		<%--답변일 경우 div 배경색 회색--%>
		}else{
			qnaDetails = $(
				'<div style="background-color: #F0F8FF" class="comment-list" id="'+qnaId+'">'
					+'<div class="single-comment justify-content-between d-flex">'
						+'<div class="user justify-content-between d-flex">'
							+'<div class="desc"><p class="comment">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].qnaContent+'</p>'
								+'<div class="d-flex justify-content-between">'
										+'<div class="d-flex align-items-center">'
										+'<h5><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].memberId+'</a></h5>'
										+'<p class="date">'+qna[i].qnaTime+'</p></div>'
									+'<div class="reply-btn">'
									+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" id="'+replyId+'" class="btn-reply text-uppercase">reply</a>'
									+'</div></div></div></div></div></div>'
			);
		}
		$(".comments-area").append(qnaDetails);
	}
	$("#QnAListSize").html("QnA ["+qna.length+"]");
}

function bid() {
	var data=$("#input").val();
	var messageDTO={
	    result:data
	    };
    $.ajax({
        url: "${pageContext.request.contextPath}/bid",
        data: messageDTO,
        type:"POST",
        beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(
					"${_csrf.headerName}",
					"${_csrf.token}");
					},
		success : function(data) {
					if (data == "fail") {
						alert("아이디가 중복됩니다");
						$("#idCheckView").html(id+ " 사용불가!").css("color","red");
						checkResultId = "";
					} else {
						$("#idCheckView").html(id+ " 사용가능!").css("color","blue");
						checkResultId = id;
					}
		}//callback
	});
}
</script>
<input type="hidden" id="productNo" value="${random.productNo }">
<input type="hidden" id="memberId"
		value="${random.memberVO.memberId }">
<div class="slider-area ">
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h2>상품 상세</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--================Single Product Area =================-->
<div class="product_image_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="product_img_slide owl-carousel">
					<div class="single_product_img">
						<img src="../myweb/images/${random.postImage}" alt=""
							class="img-fluid">
					</div>
				</div>
					<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="assets/img/gallery/popular3.png" alt="" style="width: 300px;">
						</div>
							<div class="blog_details">
							<%--제목 --%>
							<h2>${random.title }</h2>
							<%--내용 --%>
							<div style="white-space:pre;"><c:out value="${productDetails.detail}" /></div>
						</div>
					</div>
					<%--Qna 시작 --%>
					<sec:authorize access="isAuthenticated()">
						<h4 id="QnAListSize">QnA</h4>
						<div class="comments-area"></div>
					</sec:authorize>
					<%--QnA 끝 --%>
					<%--Qna 시작 --%>
					<sec:authorize access="isAnonymous()">
						<h4 id="QnAListSize">QnA</h4>
						<h5 style="color: #a0a0a0">로그인 하시면 QnA 를 보실수 있어요</h5>
						<div class="comments-area" style="display: none"></div>
					</sec:authorize>
					<%--QnA 끝 --%>
					<%--Qna 로그인유저 질문하기 폼 시작 --%>
					<sec:authorize access="isAuthenticated()">
						<div class="comment-form">
							<h4>질문하기</h4>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" id="qnaContent" cols="30" rows="9" placeholder="질문을 작성하세요"></textarea>
									</div>
								</div>
							</div>
							<div>
								<button id="registerQuestion" class="button button-contactForm btn_1 boxed-btn">질문하기</button>
							</div>
						</div>
					</sec:authorize>
					<%--Qna 로그인유저 질문하기 폼 끝 --%>
					<%--Qna 비로그인유저 질문하기 폼 시작 --%>
					<sec:authorize access="isAnonymous()">
						<div class="comment-form">
							<h4>질문하기</h4>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" disabled id="qnaContent" cols="30" rows="9" placeholder="로그인을 하시면 질문을 작성하실 수 있어요"></textarea>
										<input type="hidden" id="productNo" value="${random.productNo }">
									</div>
								</div>
							</div>
							<div>
								<button id="registerQuestion" style="background-color: #808080" class="button button-contactForm btn_1 boxed-btn" disabled>질문하기</button>
							</div>
						</div>
					</sec:authorize>
					<%--Qna 비로그인유저 질문하기 폼 끝 --%>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<%--입찰하기 --%>
						<div class="add_to_cart">
							<input type="text" value="${random.nowPrice+productDetails.unitPrice }" size="12"> 원으로 <a href="#" class="btn_3"
								onclick="startBid()">입찰하기</a>
						</div>
						<%--제품 정보들 --%>
						<aside class="single_sidebar_widget post_category_widget">
							<%--현재가격 --%>
							 <!-- 하트 로그인 유저만 -->
	                                        <sec:authorize access="isAuthenticated()">
		                                        <div class="favorit-items" style="font-size: 30px;" align="right">
		                                        	<span id="pick-switch-range">
			                                        	<c:choose>
			                                        		<c:when test="${random.pickVO.memberId != null}">
					                                            	<a id="pick-switch" value="${random.productNo}"><span class="fas fa-heart" style="color: red;"/></a>
			                                        		</c:when>
			                                        		<c:otherwise>
		                                        					<a id="pick-switch" value="${random.productNo}"><span class="far fa-heart"/></a>
			                                        		</c:otherwise>
			                                        	</c:choose>
		                                        	</span>
		                                   		</div>
	                                        </sec:authorize>
							<span>현재가격 ${random.nowPrice }</span>
							
							<%--기타 정보들 --%>
							<hr>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>시작가&nbsp&nbsp&nbsp</p>
										<p>${random.startPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>즉구가&nbsp&nbsp&nbsp</p>
										<p>${random.giveMeThatPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매시작시간&nbsp&nbsp&nbsp</p>
										<p>${random.productUpTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매종료시간&nbsp&nbsp&nbsp</p>
										<p>${random.bidEndTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>남은 시간&nbsp&nbsp&nbsp</p>
										<p id="remainTime"></p>
										<script>
											function remainTime(){
												var stDate = new Date().getTime();
												var edDate = new Date("${random.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
												if(RemainDate<0){
													document.getElementById("remainTime").innerHTML= "경매시간 만료, 역경매 시작";
												}else{
													var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
													var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
													var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
													m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
													document.getElementById("remainTime").innerHTML=m;
												}
											}
											function startInterval(seconds, remainTime){
												remainTime();
												return setInterval(remainTime, seconds * 1000);
											};
											startInterval(1, remainTime);
										</script>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>총 입찰자 수&nbsp&nbsp&nbsp</p>
										<p>ajax 로 구현할 부분</p>
								</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">최근 입찰 내역</h3>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 25000원</h3>
									</a>
									<p>January 12, 2019</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_2.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>B 님 24000원</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_3.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>C 님 20000원</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 10000원</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
						</aside>
						<aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">판매자 신용도</h4>
							<ul class="list">
								<li><a href="#">project</a></li>
								<li><a href="#">love</a></li>
								<li><a href="#">technology</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">restaurant</a></li>
								<li><a href="#">life style</a></li>
								<li><a href="#">design</a></li>
								<li><a href="#">illustration</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget instagram_feeds">
							<h4 class="widget_title">이런 상품도 있어요~</h4>
							<ul class="instagram_row flex-wrap">
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_5.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_6.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_7.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_8.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_9.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_10.png" alt="">
								</a></li>
							</ul>
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
	<div id="map"  style="width:500px;height:400px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59a14a97db6460297c9b90217b7b1059"></script>
		<script type="text/javascript">
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script>
