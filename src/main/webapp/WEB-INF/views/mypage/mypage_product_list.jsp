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


<title>mypage</title>

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
<script>
   $(document).ready(function(){
      console.log('Hello, world!');
      
      
      $("#doRetrieve").on("click",function(){
          console.log('doRetrieve');
   
          
        
         

          
        //doRetrive
        });        
      
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
				<li id="doRetrieve" class="tag">주문내역</li>
				<li class="tag">상품문의</li>
				<li class="tag">개인정보수정</li>
			</ul>
		</div>
		<div>
		
		${list }
			<div class="title">
				<div>
					<span class="sp_head">주문내역 </span> <span class="sp_font"></span>
					 <!-- 제목 ------------------------------------------------------------------->
    <!-- 검색 : 검색구분(select) 검색어(input) 페이지 사이즈(select)--> 
    <form action="#" class="form-inline text-right" >
      <input type="hidden" name="div" id="div" value="${divValue}" >  
      <div class="form-group">
        <select class="form-control input-sm" name="searchDiv" id="searchDiv">
          <c:forEach var="code" items="${ORDER_SEARCH}">
            <option value='<c:out value="${code.detCode }"/>' >
              <c:out value="${code.detName }" />
            </option>
          </c:forEach>
        </select>
          <c:forEach var="code" items="${PAGE_SIZE}">
            <option value='<c:out value="${code.detCode }"/>'>
              <c:out value="${code.detName }" />
            </option>
          </c:forEach>            
      </div>
    </form> 
    <!-- 검색 ------------------------------------------------------------------->
					<hr>
				<div>
			<div class="table-responsive">
    <table id="boardTable" class="table table-striped table-bordered table-hover">
      <thead class="bg-primary">
        <tr>
          <th class="text-center col-sm-1 col-md-1 col-lg-1">3개월</th>
          <th class="text-center col-sm-6 col-md-6 col-lg-8">6개월</th>
          <th class="text-center col-sm-2 col-md-2 col-lg-1">1년</th>
          <th class="text-center col-sm-2 col-md-2 col-lg-1">2년</th>
          <th class="text-center col-sm-1 col-md-1 col-lg-1">5년</th>
          <th style='display:none;'>SEQ</th>
        </tr>
      </thead>
					</div>
				</div>
		
</body>
</html>
</fmt:bundle>