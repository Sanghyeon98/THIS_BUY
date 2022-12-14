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
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="pcwk html" >
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/PC_HTML/favicon.ico">
<!-- jquery ui -->
<link rel="stylesheet" href="/PC_HTML/assets/css/jquery-ui.css">
<style> 
      
.side{
  display: flex;
}

.content2{
  position: relative;
  width: 284px;  
}

.side1{
  float: center;
  height: 1000px;
  margin: 0px 150px 50px 150px;
  background-color: pink;
}

.side2{
  display: flex;
  width: 550px;
  margin: 0px auto;
  padding-bottom: 10px;
  float: center;
  justify-content: space-between;   
}

.side{
  display: flex;
  width: 550px;
  margin: 0px auto;
  padding-bottom: 80px;
  float: center;
  justify-content: space-between;
}

.address{
  margin : 5px 20px 5px 20px;
  display: block;
  padding: 0px 10px;
  text-align: center;
  overflow: hidden;
  width: 80%;
  height: 30px;
  border-radius: 3px;
  color: rgb(95, 0, 128);
  background-color: rgb(255, 255, 255);
  border: 1px solid rgb(95, 0, 128);
}

.tag{
  margin-left:150px; 
}

</style>

<title>상품 상세</title>
  <script src="/PC_HTML/assets/js/jquery-3.6.1.js"></script>
  <script src="/PC_HTML/assets/js/jquery-ui.js"></script>
  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	//console.log('Hello, world!');
    });  
  </script>
</head>
<body>
  <div>  
    <div class="side">
      <div><img alt="이미지" src="/PC_HTML/assets/imgs/spring.png"></div>
    <div class= "content2">
      <div>
        <table>
          <tr>
            <td>상품 번호</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>상품명</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>상품 가격</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>생산지</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>수량</td>
            <td><input class="amount" type="number" min="1" value="1"></td>
          </tr>
          <tr>
            <td>중량/용량</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>최종 가격</td>
            <td><input type="text"></td>
          </tr>
        </table>
      </div>

      <div>
        <button class="address"><span class="css-ymwvow e4nu7ef1">장바구니</span></button>
      </div>
      <div>
        <button class="address"><span class="css-ymwvow e4nu7ef1">상품주문</span></button>
      </div>            
    </div>
  </div>
    <div class="side2">
      <p><a href="#">상품상세</a><span class="tag"><a href="#">상품후기</a></span><span class="tag"><a href="#">상품Q&A</a></span></p>
    </div>
     <div class="side1">
     <p>상세 정보를 입력</p>
     </div>  
  </div>
</body>
</html>
</fmt:bundle>