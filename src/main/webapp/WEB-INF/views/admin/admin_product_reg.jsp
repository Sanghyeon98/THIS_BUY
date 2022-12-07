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
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_reg.css">
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
          <p>관리자 > 상품 관리 > 상품 등록</p>
        </div>
        <div class="content_body">
          <form action="#">
            <table>
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <select>
                    <option>1차 분류</option>
                  </select>
                  <select>
                    <option>2차 분류</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="table_left"><label>상품명</label></td>
                <td><input type="text" placeholder="상품명"></td>
              </tr>
              <tr>
                <td class="table_left"><label>가격</label></td>
                <td><input type="text" placeholder="가격"></td>
              </tr>
              <tr>
                <td class="table_left"><label>상품 설명</label></td>
                <td><textarea rows="" cols=""></textarea></td>
              </tr>
              <tr>
                <td class="table_left"><label>이미지</label></td>
                <td><input type="file"></div>
              </tr>
              <tr>
                <td class="table_left"><label>재고수량</label></td>
                <td><input type="text" placeholder="재고수량"></td>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="bt_area">
          <button>상품 등록</button>
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