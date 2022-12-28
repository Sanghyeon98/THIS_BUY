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

<script>
	$(document).ready(function(){
		
		// 검색어 엔터
		$("#gnb_search").on("keypress", function(e) {
			if(13==e.which){
        e.preventDefault();
        //event trigger발생
        $('#search_bnt').trigger('click');
      }
		});
		
		
		// 검색어 버튼 클릭
		$("#search_bnt").on("click", function() {
			console.log("검색어 버튼");
			
	  });
		
		
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
				
				//console.log("parsedJson : " + parsedJson);
				
				$("#catelist").empty();
				
				let htmlData = "";
				
				$.each(parsedJson, function(index, value) {
				    // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
				  if(value.topNo == 0) {
				    htmlData += "<li style='position:relative; z-index:3;' class='cate01list hide' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
				  } else {
				    htmlData += "<li style='position:relative; z-index:2;' class='cate02list hide cateTop" + value.topNo + "' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
				  }
				});
				
				//console.log("htmlData : " + htmlData);
				
				$("#catelist").append(htmlData);
				
			},
			error : function(request,status,error){
			  console.log("error");
				//alert("@@code:"+request.status+"\n"+"@@message:"+request.responseText+"\n"+"@@error:"+error);
			},
			complete:function(data){//성공, 실패 관계 없이 출력
			  console.log("complete");
			}
		});
		
		
		// 2차분류 클릭 이벤트
		$("#categoryMenu").on("click", '.cate02list', function() {
			console.log("2차 분류..");
			
			console.log("2차분류 카테고리 ID : " + $(this).val());
			
			let cate02Id = $(this).val();
			
			// searchDiv = 20이면 2차분류
			window.location.href= "${CP}/main/mainSearchProduct.do?searchDiv=20&cateId=" + cate02Id;
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
          <a href="${CP}/main/main_page.do"><img src="${CP_RES}/image/logo.png" alt="로고" class="logo"></a>
        </div>
        <div class="search">
          <input id="gnb_search" class="search_input" placeholder="검색어를 입력해주세요">
          <button id="search_bnt"></button>
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