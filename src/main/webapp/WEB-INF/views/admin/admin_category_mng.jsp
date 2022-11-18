<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="pcwk html" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <meta charset="UTF-8">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="/PC_HTML/thisbuy/css/admin_category_mng.css">
  <style>
  </style>

  <title>제목</title>
  
  <script src="/PC_HTML/assets/js/jquery-3.6.1.js"></script>
  <script src="/PC_HTML/assets/js/jquery-ui.js"></script>
  
  <!-- javascript --> 
  <script>
    $(document).ready(function(){
      
    });
  </script>
</head>

<body>
  <!-- wrap -->
  <div id="wrap">
    <header>
    </header>
    <!-- container -->
    <div id="container" class="clear">
      <!-- lnb -->
      <div class="lnb">
        <jsp:include page="/WEB-INF/views/cmn/admin_left_menu.jsp"></jsp:include>
      </div>
      <!-- lnb END -------------------------------------------------------->
      <!-- content --> 
      <div class="content">
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 카테고리 관리</p>
        </div>
        <div class="content_body">
          <div class="cate_list">
            <p>- 식품</p>
            <p>  L 채소, 과일</p>
            <p>  L 수산, 해산, 건어물</p>
            <p>  L 정육, 계란</p>
          </div>
          <div class="cate_create clear">
            <p>분류 생성/수정/삭제</p>
          </div>
        </div>
      </div>
      <!-- content END ---------------------------------------------------------->
    </div>
    <!-- container END -->
    <footer>
    </footer>
  </div>
  <!-- wrap END ------------------------------------------------------------->
</body>
</html>
</fmt:bundle>