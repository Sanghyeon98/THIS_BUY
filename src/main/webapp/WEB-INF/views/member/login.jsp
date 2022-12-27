<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
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
  <link rel="shortcut icon" type="images/x-icon"  href="${CP_RES}/favicon.ico">
  <link rel="stylesheet" href="${CP_RES}/css/signup.css">
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
<title>로그인</title>

<script >
$(document).ready(function(){
	console.log("document.ready");
});
</script>
<style type="text/css">
.login{
width:340px;
}
</style>
</head>
<body>
<h3 class="text-center">로그인</h3>
<form class="login form-inline">

      <input type="text" class="form-control" id="uId" name="uId" placeholder="아이디를 입력해주세요">

      <input type="password"  class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
        
<div class="text-right">아이디 찾기 ｜ 비밀번호 찾기</div>
      <button type="button" class="btn btn-default btn-block text-center btn-block" value="아이디 중복" id="Login">로그인</button>
      <button type="button" class="btn btn-default btn-block text-center btn-block" value="아이디 중복" id="signup">회원가입</button>

</form>


</body>
</html>
</fmt:bundle>