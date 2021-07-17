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
<br>
<br>
<br>
<h3 align="center" class="display-3">가입정보</h3> 
<br>
<table class="table">
	<tr>
	<td scope="col">ID</td>
	<td scope="col">${requestScope.memberVO.memberId}</td>
	</tr>
	<tr>
	<td scope="col">Name</td>
	<td scope="col">${requestScope.memberVO.name} </td>
	</tr>
	<tr>
	<td scope="col">Address</td>
	<td scope="col">${requestScope.memberVO.address}</td>
	</tr>
</table>
