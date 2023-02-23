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
  <link rel="stylesheet" href="${CP_RES}/css/signup_address.css">
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
<script>
$(document).ready(function(){
	$('#address_save').click(function() {
		
		var address_final=$('#address').val()
		var address_detail=$('#address_detail').val();
		
		opener.document.getElementById("address_final").value = address_final;
		opener.document.getElementById("address_detail").value = address_detail;
		opener.send();
		window.close();
	});
	
	$('#re').click(function() {
		window.close();
		window.opener.search();
	});
});



<%
String address = request.getParameter("address");
%>

</script>
<style>


.row{
width: 80%; 
margin: 0 auto;
}
.col1{
width: 63%;
display: inline-block;
margin: 0px 0px 10px 0px;
}
.col2{
width: 32%;
display: inline-block;
height: 44px;
margin: 0px 0px 0px 25px;
}
.col3{
margin: 0px 0px 10px 0px;
}

</style>

 
</head>
<body>


<div class="signupaddress"> <h3 class="text-center">나머지 주소를 입력해주세요.</h3>

<hr>

 <div class="row">
    <div class="cc text-centers">
      <input type="text" class="col1 form-control" id="address" name="address" value="<%=address%>" ><button type="button" class="col2 btn btn-default btn-block text-center" value="" id="re" name="re"><img class="searchico" src="${CP_RES}/img/common/search.png" />재검색</button>
    </div>
    </div>
 <div class="row">
    <div class=" text-centers">
      <input type="text"  class="form-control col3" id="address_detail" name="address_detail"  >
    </div>
    </div>
 
<div class="row">
     <div class="text-centers">
      <button  type="submit" style="height: 44px;" class="btn btn-default btn-block btn1" value="" id="address_save">저장</button>
    </div>
    </div>	
</div>    


   




</body>

</html>
</fmt:bundle>

















