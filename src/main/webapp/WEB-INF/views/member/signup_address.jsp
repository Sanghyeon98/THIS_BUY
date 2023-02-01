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
	<!-- 주소 api --> 
    <script src="${CP_RES}/js/postcode.v2.js"></script>
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
<title>회원가입</title>
<script >



</script>


 
</head>
<body >
<div class="signupaddress"> <h2 class="text-center">나머지 주소를 입력해주세요.</h2>

<hr>


 <div class="row">
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" id="" name=""  >
    </div>
     <div class="col-md-3 text-centers">
      <button type="button" class="btn btn-default btn-block" value="" id=""><img class="searchico" src="${CP_RES}/img/common/search.png" />재검색</button>
    </div>
    </div>
 <div class="row">
    <div class="col-md-10 text-centers">
      <input type="text"  class="form-control" id="" name=""  >
    </div>
    </div>
 <div class="row">
    <div class="col-md-10 text-centers">
      <label class="radio-inline">기본 배송지로 설정</label>
           <input type="radio" name="" id="" value="" >
    </div>
    </div>
<div class="row">
     <div class="col-md-10 text-centers">
      <button type="button" class="btn btn-default btn-block" value="" id="">저장</button>
    </div>
    </div>	
</div>    
   











</body>

</html>
</fmt:bundle>

















