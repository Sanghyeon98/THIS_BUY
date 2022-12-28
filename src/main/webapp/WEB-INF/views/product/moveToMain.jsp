<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
  <script src="${CP_RES}/js/jquery-1.12.4.js"></script>
</head>

<script>
  $(document).ready(function() {
	  alert('관리자가 아닙니다. 접근불가!');
	  move();
  });
  
  function move() {
	  window.location.href = "${CP}/main/main_page.do";
  }
</script>

<body>
  <p>move!</p>
  <%-- <jsp:forward page="/WEB-INF/views/main/main_page.jsp" /> --%>
</body>
</html>
</fmt:bundle>