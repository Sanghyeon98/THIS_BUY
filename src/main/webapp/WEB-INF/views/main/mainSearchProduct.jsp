<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>
<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${CP_RES}/css/main.css">

<title>제목</title>

<script>
	$(document).ready(function(){
		//console.log('Hello, world!');
	});
</script>

</head>
<body>
	<!-- 미들 -->
	<div style="position:relative; z-index:-1;" id="wrap">
	  <div class= "goods_list">
	    <div class="goods">
	      <c:forEach var="vo" items="${list}">
		      <figure class="itemList">
		        <a href="${CP}/detail/view.do?itemNo=${vo.itemNo}"><img alf="이미지" width="170" src="${CP}${vo.viewPath}/${vo.saveName}"></a>
		        <a href="${CP}/detail/view.do?itemNo=${vo.itemNo}"><figcaption>${vo.name} &#124; ${vo.price}</figcaption></a>
		      </figure> 
	        
	      </c:forEach> 
	       

	    </div>
	  </div>
	</div>
</body>
</html>
</fmt:bundle>