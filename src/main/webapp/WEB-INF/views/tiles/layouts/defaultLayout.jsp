<%--
/**
  Class Name: defaultLayout.jsp
  Description: tiles defaultLayout
  Modification information
  
   수정일     수정자      수정내용
  -----   -----  -------------------------------------------
  2022. 12. 13        최초작성 
    
  author eclass 개발팀 : ITSC
  since 2022.11.28
  Copyright (C) by KandJang All right reserved.
*/
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<c:set var="CP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- 뷰포트 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="${CP_RES}/favicon.ico">
  
  <link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css"> 

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
  
  <title><tiles:getAsString name="title"/></title>  <!-- tiles.xml 파일에 <put-attribute name="title" value=""/> 부분 -->
</head>
<body>
  <div class="container-fluid">
  
    <!-- header -->
    <header class="container-fluid text-center">
      <tiles:insertAttribute name="header"/>
    </header> 
    <!-- header --------------------------------------------------------------->
    
    <!-- body -->
    <article class="container-fluid">
      <tiles:insertAttribute name="body"/>
    </article>
    <!-- body ----------------------------------------------------------------->
    
    <!-- footer -->
    <footer class="container-fluid text-center">
      <tiles:insertAttribute name="footer"/>
    </footer>
    <!-- footer --------------------------------------------------------------->
    
  </div>
</body>
</html>