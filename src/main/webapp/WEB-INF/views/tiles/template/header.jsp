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
    background-color:#B8C9DF;
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
    padding-top : 10px;
    position: absolute;
    right: 0px;
    top: 0px;
    z-index: 100;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 12px;
  }
  
  .top1 > a {
    margin-right: 10px;
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
    border: 2px solid #B8C9DF; 
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
    background:url(${CP_RES}/img/common/searchicon.png) 60px 60px;
  }
  
  .like_bnt {
    width: 30px;
    height: 30px;
    line-height:30px;
    background: url(${CP_RES}/image/like_icon.png);
  }
  
  .cart_bnt {
    width: 30px;
    height: 30px;
    line-height:30px;
    background: url(${CP_RES}/image/cart_icon.png);
  }
  
  .top3 {
    background-color: #F6F6F6;
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
  
  .hide {
    display:none;
  }
  
  #categoryMenu {
    padding-top: 17px;
    padding-left: 5px; 
  }
  
  #catelist {
    margin-top: 18px;
  }
  
  /* 1차 카테고리 */
  .cate01list {
    background-color: #D9E5FF;
    padding: 5px;
    width: 200px;
  }
  
  .cate01list:hover {
    background-color: #C4DEFF;
  }
 
  /* 2차 카테고리 */
  .cate02list {
    background-color: #FFFFFF;
    padding: 3px; 
  }
  
  .cate02list:hover {
    background-color: #F6F6F6;
  }
  
  
 
   

</style>
<title>제목</title>

<script>
	$(document).ready(function(){
		
		// 페이지 로딩 시 최초 한 번 카테고리 목록 가져오기
		$.ajax({ 
			type: "GET",
			url: "${CP}/main/mainTop.do",
			asyn: "true",
			dataType: "html",
			data: {},
			success:function(data){ //통신 성공
				console.log("success");
				
				let parsedJson = JSON.parse(data);
				
				console.log("parsedJson : " + parsedJson);
				
				$("#catelist").empty();
				
				let htmlData = "";
				
				$.each(parsedJson, function(index, value) {
				    // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
				  if(value.topNo == 0) {
				    htmlData += "<li class='cate01list hide' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
				  } else {
				    htmlData += "<li class='cate02list hide cateTop" + value.topNo + "' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
				  }
				});
				
				console.log("htmlData : " + htmlData);
				
				$("#catelist").append(htmlData);
				
			},
			error:function(data){//실패
			  console.log("error");
			},
			complete:function(data){//성공, 실패 관계 없이 출력
			  console.log("complete");
			}
		});
		
		
		// 2차분류 클릭 이벤트
		$("#categoryMenu").on("click", '.cate02list', function() {
			console.log("2차 분류..");
		});
		
		
		
		// 1차 분류 선택 시, 해당 카테고리에 맞는 2차 분류 보여주기
//		$("#categoryMenu").on("mouseenter",'.cate01list', function() {
		$("#categoryMenu").on("click",'.cate01list', function() {
	    
	    let cate01No = $(this).val();
	    console.log("cate01No : " + cate01No);
	    
	    // 2차 분류에 cateTopX 클래스를 갖고있으면 (X값은 현재 선택된 1차분류 cateNo)
			if($(".cate02list").hasClass("cateTop"+cate01No)) {
				$(".cateTop"+cate01No).toggle();
			}
	    
		})/*.on("mouseleave",'.cate01list', function() {
      $(".cate02list").hide();
		})*/;
		
	  
		// 메인메뉴-카테고리 메뉴 보이기
		$("#categoryMenu").hover(function() {
			console.log("마우스오버");
			
			$(".cate01list").show();
		}, function(){
			//이부분은 마우스가 요소에서 나갈떄 실행할 수 있는 이벤트 입니다.
			$(".cate01list").hide();
			$(".cate02list").hide();
		});
		
	});
</script>
</head>

<body>
  <!-- 메인페이지 전체 -->
  <div>
    <!-- 상단 -->
    <div class="top"></div>
    <!-- 로고, 메뉴 -->
    <div>
      <div class="top1">
        <a href="${CP}/signup/signup.do" id="singup">회원가입</a>
        <div class="css-1qgm48u eo7pjfk0""></div>
        <a href="${CP}/login/login.do" id="login">로그인</a>
        <div class="css-1qgm48u eo7pjfk0""></div>
        <a class="c_center">고객센터</a>
      </div>
      <div class="top2">
        <div>
          <img src="${CP_RES}/image/logo.png" alt="로고" class="logo">
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
        <div class="category">
          <ul>
            <li id="categoryMenu">
              <a href="#">〓 카테고리</a>
              <ul id="catelist">
              </ul>
            </li>
          </ul>
        </div>
        <div class="top3_1">
          <span class="menu"><a href="#">신상품</a></span>
          <span class="menu"><a href="#">베스트</a></span>
          <span class="menu"><a href="#">특가상품</a></span>
        </div>
      </div>
    </div>

  </div>
</body>
</html>
</fmt:bundle>