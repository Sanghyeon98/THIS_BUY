 <%--
 /**
 ????Class Name:
 ????Description:
 ????Modification information
 ????
 ????수정일     수정자      수정내용
     -----   -----  -------------------------------------------
     2022. 12. 12        최초작성 
     
     author eclass 개발팀
     since 2020.11.23
     Copyright (C) by KandJang All right reserved.
 */
  --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath}"></c:set>  
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap css -->
<!--  합쳐지고 최소화된 최신CSS -->
<link rel="shortcut icon" type="image/x-icon" href="${CP }/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${CP}/resources/css/bootstrap.min.css">

<script src="${CP_RES }/js/jQuery1_12_4.js"></script>

<script src="${CP_RES }/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script >
$(document).ready(function(){
	console.log("document.ready");
});
</script>
</head>
<body>
  ${cursor}
</body>
</html>