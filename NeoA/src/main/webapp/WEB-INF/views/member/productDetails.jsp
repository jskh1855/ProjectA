<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				+'<button id="registerAnswer" onclick="registerAnswer(\''+qnaNo+'\')" class="button button-contactForm btn_1 boxed-btn">답변하기</button>'
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

function startBid(id,price, unit) {
// 	var data=$("#input").val();
// 	var messageDTO={
// 	    result:data
// 	    };
	console.log("1111");
    $.ajax({
        url: "${pageContext.request.contextPath}/bid",
        data: {"id" : id, "bidPrice" : price },
        type:"POST",
        beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(
					"${_csrf.headerName}",
					"${_csrf.token}");
					},
		success : function(data) {
				var nextPrice = price+unit;
				console.log(nextPrice);
				var numBid = document.getElementById("numBid").innerHTML;
				var newVal = parseInt(numBid,10) + 1;
				document.getElementById("bidPrice").value = nextPrice;
				document.getElementById("nowPrice").innerHTML = price;
				document.getElementById("numBid").innerHTML = newVal;
				
		}//callback
	});
}
</script>
<main>
	<input type="hidden" id="productNo" value="${productDetails.productNo }"> <input type="hidden" id="memberId"
		value="${productDetails.memberVO.memberId }">
	<!-- Hero Area Start-->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>상품 상세페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--${productDetails }--%>
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="assets/img/gallery/popular3.png" alt="" style="width: 300px;">
						</div>
						<%--제품 사진 보여주기 --%>
						<c:forEach var="image" items="${imagesList }"><img src="/myweb/images/${productDetails.productNo }/${image }"></c:forEach>
						<div class="blog_details">
							<%--제목 --%>
							<h2>${productDetails.title }</h2>
							<br>
							<%--내용 --%>
							<div style="white-space:pre;"><c:out value="${productDetails.detail}" /></div>
							<%-- <textarea rows="7" cols="7">${fn:replace(productDetails.detail,br,cn)}</textarea> --%>
						</div>
					</div>
					<br>
					<br>
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
										<input type="hidden" id="productNo" value="${productDetails.productNo }">
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
							<input type="text" value="${productDetails.nowPrice+productDetails.unitPrice }" size="12" id="bidPrice"> 원으로 <a href="#" class="btn_3"
								onclick="startBid(${productDetails.productNo},${productDetails.nowPrice+productDetails.unitPrice}, ${productDetails.unitPrice})">입찰하기</a>
						</div>
						<%--제품 정보들 --%>
						<aside class="single_sidebar_widget post_category_widget">
							<%--현재가격 --%>
							<h4 class="widget_title">현재가격 <div id="nowPrice">${productDetails.nowPrice }</div></h4>
							<%--기타 정보들 --%>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>시작가&nbsp&nbsp&nbsp</p>
										<p>${productDetails.startPrice }원</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>즉구가&nbsp&nbsp&nbsp</p>
										<p>${productDetails.giveMeThatPrice }원</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매시작시간&nbsp&nbsp&nbsp</p>
										<p>${productDetails.productUpTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매종료시간&nbsp&nbsp&nbsp</p>
										<p>${productDetails.bidEndTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>남은 시간&nbsp&nbsp&nbsp</p>
										<p id="remainTime"></p>
										<script>
											function remainTime(){
												var stDate = new Date().getTime();
												var edDate = new Date("${productDetails.bidEndTime}").getTime(); // 종료날짜
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
										<p>총 입찰자 수:&nbsp&nbsp&nbsp</p>
										<fmt:parseNumber var="numBid" integerOnly="true" value="${(productDetails.nowPrice-productDetails.startPrice)/productDetails.unitPrice }"/>
										<div id="numBid">${numBid}</div>명
								</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">최근 입찰 내역</h3>
							<div class="media post_item">
<!-- 								<img src="assets/img/post/post_1.png" alt="post"> -->
								<div class="media-body">
									<a href="single-blog.html">
										<h3>${recentThree[0].memberId} 님 ${recentThree[0].bidPrice}원</h3>
									</a>
									<p>${recentThree[0].bidTime}</p>
								</div>
							</div>
							<div class="media post_item">
<!-- 								<img src="assets/img/post/post_2.png" alt="post"> -->
								<div class="media-body">
									<a href="single-blog.html">
										<h3>${recentThree[1].memberId} 님 ${recentThree[1].bidPrice}원</h3>
									</a>
									<p>${recentThree[1].bidTime}</p>
								</div>
							</div>
							<div class="media post_item">
<!-- 								<img src="assets/img/post/post_3.png" alt="post"> -->
								<div class="media-body">
									<a href="single-blog.html">
										<h3>${recentThree[2].memberId} 님 ${recentThree[2].bidPrice}원</h3>
									</a>
									<p>${recentThree[2].bidTime}</p>
								</div>
							</div>
<!-- 							<div class="media post_item"> -->
<!-- 								<img src="assets/img/post/post_1.png" alt="post"> -->
<!-- 								<div class="media-body"> -->
<!-- 									<a href="single-blog.html"> -->
<!-- 										<h3>A 님 10000원</h3> -->
<!-- 									</a> -->
<!-- 									<p>01 Hours ago</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
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
</main>