<%--
/**
  Class Name: mypage_question
  Description: 목록조회
  
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>

<style>
ul {
	border: 1px solid crimson;
	margin: 10px 110px; /* 바깥여백 */
	padding: 10px; /* 안여백 */
	list-style: none;
}

.txt_center {
	text-align: center; /* 가운데 정렬 */
}

.body {
	display: flex;
}

.title {
	display: flex;
}

.sp_select {
	margin-left: 950px;
}

.sp_font {
	margin-left: 100px;
	font-size: 8px;
}

.sp_head {
	font-size: 24px;
}

.tag {
	margin: 50px 10px 50px;
}

.button {
	height: 500px;
	line-height: 500px;
	text-align: center;
	margin: 0 auto;
}
</style>


<title>주문내역</title>
<!-- 뷰포트(반응형 웹)  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project product list">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<!-- favicon -->
<link rel="shortcut icon" type="images/x-icon"
  href="/PC_HTML/favicon.ico">
<!-- jquery ui -->
<link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- String, Number, Date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>
<!-- paging -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>
<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>
<!-- javascript -->
<script>
   $(document).ready(function(){
      console.log('Hello, world!');
   
      /*  doSelecte(); */
      
      //paging
     
      
      
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

		<div class="list_body">
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
</fmt:bundle>