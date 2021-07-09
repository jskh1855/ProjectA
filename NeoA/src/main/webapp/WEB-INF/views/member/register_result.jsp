<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="slider-area ">
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h2>${requestScope.memberVO.name}님 안녕하세요</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<h3>가입정보</h3> 
<table>
	<tr>
	<td>${requestScope.memberVO.memberId}</td>
	</tr>
	<tr>
	<td>${requestScope.memberVO.name} </td>
	</tr>
	<tr>
	<td>${requestScope.memberVO.address}</td>
	</tr>
</table>
