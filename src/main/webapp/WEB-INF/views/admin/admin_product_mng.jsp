<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="resources" value="/resources/css"/>
<c:set var="CP_RES" value="${CP}${resources}"/>

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
  <link rel="stylesheet" href="${CP_RES}/admin_product_mng.css">
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
          <p>관리자 > 상품 관리 > 상품 관리 목록</p>
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
                <td class="table_left"><label>검색어</label></td>
                <td><input type="text" placeholder="상품명"></td>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="search_bt_area">
          <button>검색</button>
        </div>
        <div class="search_option">
          <select id="search_option" name="search_option">
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="50">50</option>
            <option value="100">100</option>
          </select>
        </div>
        <div class="search_list">
          <form action="#">
            <table> 
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox"></th>
                  <th width="8%">번호</th>
                  <th width="45%">상품명</th>
                  <th width="15%">판매가</th>
                  <th width="10%">재고</th> 
                  <th width="17%">등록일</th>
                </tr>
              </thead>
              <tbod>
                <tr>
                  <td class="td_center"><input type="checkbox"></td>
                  <td class="td_center">2</td>
                  <td>삼다수</td>
                  <td class="td_center">1,150</td>
                  <td class="td_center">100</td>
                  <td class="td_center">2022.11.06</td>
                </tr>
                <tr>
                  <td class="td_center"><input type="checkbox"></td>
                  <td class="td_center">1</td>
                  <td>아리수</td>
                  <td class="td_center">1,050</td> 
                  <td class="td_center">200</td>
                  <td class="td_center">2022.11.06</td>
                </tr>
              </tbod>
            </table>
          </form>
        </div>
        <div class="page_area">
          <p>&lt;&lt;&nbsp;&nbsp;&lt;&nbsp;1 2 3 4 5&nbsp;&gt;&nbsp;&nbsp;&gt;</p>
        </div>
        <div class="bottom_bt_area">
          <button>선택상품 삭제</button>
          <button>선택상품 품절처리</button>
          <button id="prod_reg_bt">상품 등록</button>
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