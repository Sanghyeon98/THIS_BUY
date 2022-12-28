<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>
<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${CP_RES}/css/main.css">

<title>제목</title>
  <!-- javascript -->

  <script>
    $(document).ready(function(){
      //console.log('Hello, world!');
    });
  </script>
</head>

<body>
  <!-- 메인페이지 전체 -->
  <div>  
    <!-- 미들 -->
    <div class="middle">
      <div class= "goods_list">
        <div>
          <h2 class= "title">이 상품 어때요?</h2>
        </div>
        <div class="goods">
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
  
        <div class= "title">
          <h2>놓치면 후회할 가격</h2>
        </div>
        <div class="goods">
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption><span>10&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption><span>15&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption><span>13&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
        <div class= "title">
          <h2>지금 핫한 상품</h2>
        </div> 
        <div class="goods">
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="${CP_RES}/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
        
      </div>
      
    </div>

  </div>
</body>
</html>
</fmt:bundle>