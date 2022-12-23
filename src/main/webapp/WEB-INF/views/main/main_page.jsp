<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="pcwk html" >
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<meta charset="UTF-8">
<!-- favicon -->
<link rel= "shortcut icon" type= "image/x-icon" href= "/PC_HTML/thisbuy.ico">

<!-- jquery ui -->
<link rel= "stylesheet" href= "/PC_HTML/assets/css/jquery-ui.css">

<style>       
  div {
    margin:0;
    padding:0;
    display : block;
    box-sizing: border-box;
  }
  
  ul {
    list-style-type: none;
  }
  
  .top {
    width:100%;
    height:40px;
    line-hieght:40px;
    text-align:center;
    background-color:#5B6D5B;
    color:white;
    margin: 0 auto;
    top: 0px;
    left: 0px;
  }
  
  a {
    background-color: transparent;
    text-decoration: none;
    color: inherit;
  }
  
  .top1 {
    position: absolute;
    right: 0px;
    top: 0px;
    z-index: 100;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 12px;
  }
  
  .top2 {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    height: 63px;
    width:1050px;
    margin: 0 auto;
  }
  
  .search {
    display: flex;
    align-items: center;
    margin: 0 auto;
    justify-content: space-between;
    left: 325px;
    top: -55px;
    width: 400px;
    height: 48px;
    padding-left: 14px;
    border: 2px solid #E2BCB7;
    border-radius: 6px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgb(247 247 247) 0px 0px 0px 1px inset;
  }
  
  .search_input {
    width: 300px;
    background-color: inherit;
    border: none;
    outline: none;
    font-size: 16px;
    letter-spacing: -0.33px;
  }
  
  .search_bnt {
    position: relative;
    width: 30px;
    height: 30px;
    margin: 10px;
    bottom: 3px;
    line-height:30px;
    background:url(/PC_HTML/THIS_BUY/image/search_icon.png) 60px 60px;
  }
  
  .like_bnt {
    width: 30px;
    height: 30px;
    line-height:30px;
    background: url(/PC_HTML/THIS_BUY/image/like_icon.png);
  }
  
  .cart_bnt {
    width: 30px;
    height: 30px;
    line-height:30px;
    background: url(/PC_HTML/THIS_BUY/image/cart_icon.png);
  }
  
  .top3 {
    background-color: #CA8A8B;
    border-radius: 6px;
    position: relative;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    width: 1050px;
    height: 56px;
    margin: 0px auto;
    margin-bottom:10px;
  }
  
  .categori {
    color: white;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    height: 63px;
  }
  
  
  .top3_1 {
    display: flex;
    margin-left: 30px;
  }
  
  .menu {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    width: 150px;
    height: 55px;
    padding-top: 18px;
    line-height: 20px;
    text-align: center;
    color: white;
  }
  
  .menu2{
    min-width: 1050px;
    letter-spacing: -0.3px;
    background-color: #CA8A8B;
    border-radius: 6px;
    position: relative;
    box-shadow: rgb(0 0 0 / 7%) 0px 3px 4px 0px;
    width: 100%;
    position: fixed;
    z-index: 101;
    top: 0px;
    left: 0px;
    
  }
  
  .logo a{
    color : white;
  }
  
  .middle {
    width:100%;
    height:2000px;
  }
  
  .goods{
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
  }

  .list{
    width: 1050px;
    margin: 0 auto;
    padding: 50px 0 48px;
    font-weight: 500;
    font-size: 28px;
    line-height: 35px;
    align-items: center;
  }

  .button_left{
    float: left;
  }
  .button_right{
     float: right;
  }
  
  .title{
    margin: 0 auto;
  }
  .goods_list{
    width: 1050px;
    margin: 0px auto;
    padding: 50px 0 48px;
    font-weight: 500;
    font-size: 16px;
    line-height: 35px;
    text-align: center;
  }
  
  .bottom {
    width:100%;
    background-color:#5B6D5B;
    position: relative;
    height:500px;
  }

</style>
<title>제목</title>
  <!-- javascript -->
  <script src= "/PC_HTML/assets/js/jquery-3.6.1.js"></script>
  <script src= "/PC_HTML/assets/js/jquery-ui.js"></script>
  <script>
    $(document).ready(function(){
      //console.log('Hello, world!');
    });
  </script>
</head>

<body>
  <!-- 메인페이지 전체 -->
  <div>
    <!-- 상단 -->
    <div class="top">이 웹페이지는 교육용입니다.</div>
    
    <!-- 로고, 메뉴 -->
    <div>
      <div class="top1">
        <a class="sub">회원가입</a>
        <div class="css-1qgm48u eo7pjfk0"></div>
        <a class="login">로그인</a>
        <div class="css-1qgm48u eo7pjfk0"></div>
        <a class="c_center">고객센터</a>
      </div>
      <div class="top2">
        <div>
          <img src="/PC_HTML/THIS_BUY/image/logo.png" alt="로고" class="logo">
        </div>
        <div class="search">
          <input id="gnb_search" class="search_input" placeholder="검색어를 입력해주세요" required="required">
          <button type="submit" class="search_bnt"></button>
        </div>
        <div>
          <button class="like_bnt"></button>
          <button class="cart_bnt"></button>
        </div>
      </div>
      <div class="top3">
        <div class="categori">
          <ul>
            <li><span><a href="#">〓</a></span></li>
            <li><span><a href="#">카테고리</a></span></li>
          </ul>
        </div>
        <div class="top3_1">
          <span class="menu"><a href="#">신상품</a></span>
          <span class="menu"><a href="#">베스트</a></span>
          <span class="menu"><a href="#">특가상품</a></span>
        </div>
      </div>
    </div>
    <!-- 미들 -->
    <div class="middle">
      <div class= "goods_list">
        <div>
          <h2 class= "title">이 상품 어때요?</h2>
        </div>
        <div class="goods">
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
  
        <div class= "title">
          <h2>놓치면 후회할 가격</h2>
        </div>
        <div class="goods">
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption><span>10&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption><span>15&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption><span>13&#37;</span> 상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
        <div class= "title">
          <h2>지금 핫한 상품</h2>
        </div> 
        <div class="goods">
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption> 상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
          
          <figure>
           <img alf="이미지" src="/PC_HTML/THIS_BUY/image/spring.png">
           <figcaption>상품 이름 &#124; 가격</figcaption>
          </figure>
        </div>
        
      </div>
      
    </div>
    
    <!-- 하단 -->
    <div class="bottom">
    </div>
  </div>
</body>
</html>
</fmt:bundle>