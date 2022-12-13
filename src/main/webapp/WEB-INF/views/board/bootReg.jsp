<%--
/**
  Class Name:
  Description:
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 11. 28        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">

<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>

<!-- callAjax.js -->
<script src="${CP_RES}/js/callAjax.js"></script>

<!-- eUtil.js  String,Number,date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>   
    
<!-- bootpag js -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>

<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>부트스트랩_등록</title>
<script >
  $(document).ready(function(){
	  console.log("document.ready");
	  
  });
</script>

</head>
<body>
  <!-------------------------------------- div container -->
  <div class="container">
    <!----------------------------------- 제목 -->
    <div class="page-header">
      <h2>게시등록</h2>
    </div>
    <!------------------------------------ 제목 -->
    <!------------------------------------- 버튼 -->
    <div class="row text-right">
       <input type="button" class="btn btn-primary btn-sm" value="수정">
       <input type="button" class="btn btn-primary btn-sm" value="삭제">
       <input type="button" class="btn btn-primary btn-sm" value="목록">
    </div>
    <!------------------------------------- 버튼 -->
    
    <!--------------------------------------------------------- 폼 -->
    <form action="#" class="form-horizontal">
	    <div class="form-group">
	      <label for="title">제목</label>
	      <input type="text" class="form-control" id="title" name="title" placeholder="제목 입력하세요" maxlength="100">
	    </div>
	    <div class="form-group">
        <label for="regId">등록자</label>
        <input type="text" class="form-control" id="regId" name="regId" placeholder="등록자 입력하세요" maxlength="100">
      </div>
      <div class="form-group">
        <label for="contents">내용</label>
        <textarea class="form-control" rows="10" id="contents" name="contents"></textarea>
      </div>
    </form>
    <!--------------------------------------------------------- 폼 -->
  
  
  
  
  
  </div>
  <!--------------------------------------- div container --->
</body>
</html>