<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="UTF-8">
  <title>Insert title here</title>
  
  <script>
          $(document).ready(function(){
              
          });
  </script>
</head>
<body>
	<ul>
	  <li><a href="#">상품 관리 목록</a></li>
	  <li><a href="#">카테고리 관리</a></li>
	  <li><a href="#">상품 등록</a></li>
	  <li><a href="#">상품 Q&A</a></li>
	</ul>
</body>
</html>
</fmt:bundle>