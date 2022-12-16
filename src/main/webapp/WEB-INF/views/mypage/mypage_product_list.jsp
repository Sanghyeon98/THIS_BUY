<%--
/**
  Class Name:
  Description:
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 13        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">

<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>

<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>제목</title>
<script >
  $(document).ready(function(){
	  console.log("document.ready");
	  
  });
</script>

</head>
<body>
	<div>
		<ul>
			<li>
				<p>사용자님</p>
			</li>
			<li>
				<p>적립 5%</p>
			</li>
			<li>
				<p>최초 1회 배송비무료</p>
			</li>
		</ul>
	</div>

	<div class="body">

		<div>
			<ul>
				<li class="tag">주문내역</li>
				<li class="tag">상품문의</li>
				<li class="tag">개인정보수정</li>
			</ul>
		</div>
		<div>


			<div class="title">
				<div>

					<span class="sp_head">상품문의</span> <span class="sp_font">-상품에
						대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span>

					<hr>

					<div>
						<table>
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>ㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
									<td>2022/11/14</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>ㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
									<td>2022/11/12</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>ㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
									<td>2022/11/15</td>
									<td>답변미완료</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>