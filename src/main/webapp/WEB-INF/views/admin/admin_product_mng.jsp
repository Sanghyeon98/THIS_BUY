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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
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
	
  <title>제품 목록</title>
  
  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	
    	// '상품 등록' 버튼 클릭 시, 상품등록 페이지로 이동
    	$("#prod_reg_bt").on("click", function() {
    		console.log("#prod_reg_bt");
    		
    		window.location.href = "${CP}/product/moveToReg.do";
    	});
      
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
      <!-- lnb END ------------------------------------------------------------>
      
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
        
        <!-- 테이블 목록 -->
        <div class="search_list">
          <form action="#">
            <table id="productTable">
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox"></th>
                  <th width="8%">번호</th>
                  <th width="45%">상품명</th>
                  <th width="15%">판매가</th>
                  <th width="10%">재고</th> 
                  <th width="17%">등록일</th>
                  <th style="display: none;">SEQ</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${list.size() > 0 }">
                    <c:forEach var="vo" items="${list }">
                      <tr>
                        <td class="td_center"><input type="checkbox"></td>
                        <td class="td_center"><c:out value="${vo.num }"/></td>
                        <td><c:out value="${vo.name }"/></td>
                        <td class="td_center"><c:out value="${vo.price }"/></td>
                        <td class="td_center"><c:out value="${vo.weight }"/></td>
                        <td class="td_center"><c:out value="${vo.modDt }"/></td>
                        <td style="display: none;"><c:out value="${vo.itemNo }"/></td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
				              <td class="text-center col-sm-12 col-md-12 col-lg-12" colspan="99">
				                  No data found
				              </td>
				            </tr>
                  </c:otherwise>
                </c:choose>

              </tbody>
            </table>
          </form>
        </div>
        <!-- 테이블 목록 ----------------------------------------------------------->
        
        <div class="page_area">
          <p>&lt;&lt;&nbsp;&nbsp;&lt;&nbsp;1 2 3 4 5&nbsp;&gt;&nbsp;&nbsp;&gt;</p>
        </div>
        <div class="bottom_bt_area">
          <button>선택상품 삭제</button>
          <button>선택상품 품절처리</button>
          <button id="prod_reg_bt">상품 등록</button>
        </div>
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -------------------------------------------------------->
    <footer>
    </footer>
  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>