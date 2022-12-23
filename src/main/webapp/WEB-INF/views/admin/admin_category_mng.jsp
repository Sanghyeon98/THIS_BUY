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
  <link rel="shortcut icon" type="images/x-icon" href="${CP_RES}/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_category_mng.css">

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
  
  <title>카테고리 관리</title>
  
  <!-- javascript --> 
  <script>
    $(document).ready(function() {
    	
    	// 1차 분류 클릭 이벤트 (누르면 2차분류 보이도록_토글)
    	$("#cate_list>li").on("click", function() {
    		console.log("click!!");
    		console.log("$('#cate2').val() : " + $("#cate2").val());
    		console.log("$(this).val() : " + $(this).val());
    		
    		if($("#cate2").val() == $(this).val()) {
    			console.log("zzz");
    			$("#cate2").toggle();
    		}
    	});
    	
    	
    }); // document.ready END --------------------------------------------------
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
      
        <!-- content_nav -->
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 카테고리 관리</p>
        </div>
        <!-- content_nav ------------------------------------------------------>
        
        
        <!-- content_body --> 
        <div class="content_body">
          <div class="cate_list" id="cate_list">
            <c:choose>
              <c:when test="${list.size() > 0 }">
              
                <c:forEach var="vo" items="${list }">
                  <c:choose>
                    <c:when test="${vo.topNo == 0 }"> <!-- 1차분류 -->
			                <li name="cate1" id="cate1" value="${vo.categoryNo}"><c:out value="${vo.categoryNm }"/></li>
                    </c:when>
                    <c:otherwise> <!-- 2차 분류 -->
			                <li style="display: none;" name="cate2" id="cate2" value="${vo.topNo}">
			                  └<c:out value="${vo.categoryNm }"/>
			                </li>
                    </c:otherwise>
                  </c:choose>
                  
                </c:forEach>
              </c:when>
              <c:otherwise>
                <li>No Categories.</li>
              </c:otherwise>
            </c:choose>
          </div>
          <div class="cate_create clear">
            <p>분류 생성/수정/삭제</p>
          </div>
        </div>
        <!-- content_body ----------------------------------------------------->
        
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -->
    
    <footer>
    </footer>
  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>