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
	  
	  // 장바구니
	  $(".cart_bnt").on("click", function() {
		  window.location.href= "${CP}/cart/view.do";
	  });    
	  
    
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
      console.log("검색어 : " + $("#gnb_search").val());
      
      let gnb_search = $("#gnb_search").val();
       
      // div가 10이면 검색어로 검색, 없으면 메인/카테고리 목록 표출
      window.location.href= "${CP}/main/mainSearchProduct.do?div=10&searchWord=" + gnb_search;
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
            htmlData += "<li style='position:relative; z-index:51;' class='cate01list hide' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
          } else {
            htmlData += "<li style='position:relative; z-index:50;' class='cate02list hide cateTop" + value.topNo + "' value='" + value.categoryNo + "'>" + value.categoryNm + "</li>";
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
//    $("#categoryMenu").on("mouseenter",'.cate01list', function() {
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
    
  function doLogout() {
    if(confirm('로그아웃 하시겠습니까?')==false)return;
    window.location.href= "${CP}/login/doLogout.do";
  }
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
        <ul class="mainMenu">
          <c:choose>
            <c:when test="${null != sessionScope.memberInfo || not empty sessionScope.memberInfo }">   <!-- session 값이 있으면 -->
              <li>
                <a href="#">${sessionScope.memberInfo.name} 님</a>
                <ul class="loginInfoList">
                  <c:choose>
                    <c:when test="${sessionScope.memberInfo.auth != '1'}">
		                  <li><a href="${CP}/order/orderView.do?memberId=${sessionScope.memberInfo.memberid}">주문내역</a></li>
		                  <li><a href="#">상품문의</a></li>
		                  <li><a href="${CP}/memberupdate/memberCheck.do">개인정보수정</a></li>
                    </c:when>
                    <c:otherwise>
                      <li><a href="${CP}/product/productView.do">관리메뉴</a></li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </li>
              <li>
                <a href="javascript:doLogout();" id="loginout">로그아웃</a>
              </li>
            </c:when>
            <c:otherwise>
              <li>
                <a href="${CP}/signup/signup.do" id="singup">회원가입</a>
              </li>
              <li>
                <a href="${CP}/login/login.do" id="login">로그인</a>
              </li>
            </c:otherwise> 
          </c:choose>
          <li>
            <a class="c_center">고객센터</a>
            <ul class="loginInfoList">
              <li><a href="${CP}/board/boardView.do?gubun=10">공지사항</a></li>
              <li><a href="${CP}/board/boardView.do?gubun=30">자주하는질문</a></li>
              <li><a href="${CP}/board/questionView.do?gubun=20">일대일문의</a></li>
            </ul> 
          </li>
        </ul>
      </div>
      <div class="top2"> 
        <div>
          <a href="${CP}/main/main_page.do"><img src="${CP_RES}/img/common/thisbuy_logo.png" width="150" alt="로고" class="logo"></a>
        </div>
        <div class="search">
          <input id="gnb_search" class="search_input" placeholder="검색어를 입력해주세요">
          <a id="search_bnt"><img width="25" alt="장바구니" src="${CP_RES}/img/common/searchicon_back.png"></a>
          <!-- <button id="search_bnt"></button> -->
        </div>
        <div>
          <button class="like_bnt"></button>
          <a href="${CP}/cart/view.do"><img width="28" alt="장바구니" src="${CP_RES}/img/common/cartlogo.png"></a>
          <!-- <button class="cart_bnt"></button> -->
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
          <span class="menu"><a href="${CP}/main/latestProductPage.do">신상품</a></span>
          <span class="menu"><a href="#">베스트</a></span>
          <span class="menu"><a href="#">특가상품</a></span>
        </div>
      </div>
    </div>

  </div>
</body>
</html>
</fmt:bundle>