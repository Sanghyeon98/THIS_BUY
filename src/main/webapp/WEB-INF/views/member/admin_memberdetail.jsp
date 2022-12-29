<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">

  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
  
    
  <title>제품 목록</title>
  
  <!-- javascript -->
  <script>
  $(document).ready(function(){
      
      
      // 수정 취소 버튼
      $("#prod_cancel_bt").on("click", function() {
    	  window.location.href= "${CP}/admin/member.do";
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
          <p>관리자 > 회원 관리 > 상세 정보</p>
        </div>
        <div class="content_body">
          <form action="#" method="post" enctype="multipart/form-data">
            <input type="hidden" name="memberid" id="memberid" value="${vo.memberid}"> 
            <table>
              <tr>
                <td class="table_left"><label for="memberid">계정</label></td>
                <td><input type="text" id="memberid" name="memberid" value="memberid"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="name">이름</label></td>
                <td><input type="text" id="name" name="name" value="name"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="email">email</label></td>
                <td><input type="text" id="email" name="email" value="email"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="PHONE">전화번호</label></td>
                <td><input type="number" id="PHONE" name="PHONE" value="PHONE"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="ADDRESS">주소</label></td>
                <td><input type="text" id="ADDRESS" name="ADDRESS" value="ADDRESS"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="GENDER">성별</label></td>
                <td><input type="number" id="GENDER" name="GENDER" value="GENDER"></td>
              </tr>
               <tr>
                <td class="table_left"><label for="BIRTHDATE">생년월일</label></td>
                <td><input type="text" id="BIRTHDATE" name="BIRTHDATE" value="BIRTHDATE"></td>
              </tr>
               <tr>
                <td class="table_left"><label for="GENDER">등록일</label></td>
                <td><input type="text" id="REG_DT" name="REG_DT" value="REG_DT"></td>
              </tr>
            </table>
            
          </form>
        </div>
        <div class="bt_area">
          <button id="prod_cancel_bt">취소</button>
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