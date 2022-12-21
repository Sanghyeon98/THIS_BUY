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

  <title>제목</title>
  
  <!-- javascript -->
  <script>
    $(document).ready(function(){

    	
    	// 1차 분류 변경 시, 2차 분류 표출
      $(".cate01List").on("change", function() {
        console.log(".cate01List");
        console.log("$(this).val() : " + $(this).val());
        
        // 선택된 1차 분류 value 값
        let currentCateNo = $(this).val();
        
        $(".cate02List").empty();
        
        let cate02ListJson = JSON.parse('${cate02ListJson}');
        console.log("cate02ListJson : " + cate02ListJson);
        
        let htmlData = "";
        console.log("htmlData length : " + htmlData.length);
        
        htmlData += "<option value='none'>==선택==</option>";
        
        $.each(cate02ListJson, function(index, value) {
            // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
          if(value.topNo == currentCateNo) {
              htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
            }
          });
        
        /* // 2차 분류에 값이 없으면 '==선택==' 표출
        if(htmlData.length == 0) {
          htmlData += "<option value='none'>==선택==</option>";
        }
         */
        $(".cate02List").append(htmlData);
      });  // 1차 분류 변경 시, 2차 분류 표출 -------------------------------------------
        
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
                  <select class="cate01List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="vo" items="${cate01List}">
                        <option value='<c:out value="${vo.categoryNo}"/>'>
                            <c:out value="${vo.categoryNm}"/>
                        </option>
                    </c:forEach>
                  </select>
                  <select class="cate02List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="vo" items="${cate02List}">
                      <c:choose>
                          <c:when test="${vo.topNo == 1 }">
                            <option value='<c:out value="${vo.categoryNo}"/>'>
                                <c:out value="${vo.categoryNm}"/>
                            </option>
                          </c:when>
                      </c:choose>
                    </c:forEach>
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