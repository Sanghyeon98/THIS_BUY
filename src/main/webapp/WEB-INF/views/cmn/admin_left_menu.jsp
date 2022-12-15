<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  
  <title>Insert title here</title>
  
  <script>
		$(document).ready(function(){
		    
		});
  </script>
</head>
<body>
	<ul>
	  <li><a href="${CP}/product/productView.do">상품 관리 목록</a></li>
	  <li><a href="${CP}/category/categoryView.do">카테고리 관리</a></li>
	  <li><a href="${CP}/product/moveToReg.do">상품 등록</a></li>
	  <li><a href="#">상품 Q&A</a></li>
	</ul>
</body>
</html>
</fmt:bundle>