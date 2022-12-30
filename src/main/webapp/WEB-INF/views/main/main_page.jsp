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
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="${CP_RES}/css/main.css">

<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- slick -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<meta charset="UTF-8">
<style>
  .catefont {
    margin-top: 100px;
  }
  .main_itemList {
    width : 186px;
    margin-left: 36px;
    align-items: center;
    font-weight: 500;
    font-size: 16px;
    line-height: 35px;
    /* margin: 0 auto; */
  }

  .price_font {
    font-weight: bold;
    font-size: 16px;
  }
  
  .slick-prev{
    left: 25px;
    background-color: #CA8A8B;
    z-index: 1;
  }
  .slick-next{
    right: 45px;
    background-color: #CA8A8B;
    z-index: 1;
  }
</style>


<title>제목</title>
  <!-- javascript -->

  <script>
    $(document).ready(function(){
    	$('.responsive').slick({
    		  dots: true,
    		  infinite: false,
    		  speed: 300,
    		  slidesToShow: 4,
    		  slidesToScroll: 4,
    		  responsive: [
    		    {
    		      breakpoint: 1024,
    		      settings: {
    		        slidesToShow: 3,
    		        slidesToScroll: 3,
    		        infinite: true,
    		        dots: true
    		      }
    		    },
    		    {
    		      breakpoint: 600,
    		      settings: {
    		        slidesToShow: 2,
    		        slidesToScroll: 2
    		      }
    		    },
    		    {
    		      breakpoint: 480,
    		      settings: {
    		        slidesToShow: 1,
    		        slidesToScroll: 1
    		      }
    		    }
    		    // You can unslick at a given breakpoint now by adding:
    		    // settings: "unslick"
    		    // instead of a settings object
    		  ]
    		});
  });
  </script>
</head>

<body>
  <!-- 미들 -->
  <div id="wrap">
    <div class= "goods_list">
      <div>
        <div>
          <h3>채소 | 과일</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo1" items="${list1}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo1.itemNo}"><img alf="이미지" width="170" src="${CP}${vo1.viewPath}/${vo1.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo1.itemNo}"><figcaption>${vo1.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo1.itemNo}"><figcaption class="price_font">${vo1.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
      <div>
        <div>
          <h3 class="catefont">수산 | 해산 | 건어물</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo2" items="${list2}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo2.itemNo}"><img alf="이미지" width="170" src="${CP}${vo2.viewPath}/${vo2.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo2.itemNo}"><figcaption>${vo2.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo2.itemNo}"><figcaption class="price_font">${vo2.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
      <div>
        <div>
          <h3 class="catefont">정육 | 계란</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo3" items="${list3}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo3.itemNo}"><img alf="이미지" width="170" src="${CP}${vo3.viewPath}/${vo3.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo3.itemNo}"><figcaption>${vo3.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo3.itemNo}"><figcaption class="price_font">${vo3.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
      <div>
        <div>
          <h3 class="catefont">생수 | 음료 | 우유 | 커피</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo4" items="${list4}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo4.itemNo}"><img alf="이미지" width="170" src="${CP}${vo4.viewPath}/${vo4.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo4.itemNo}"><figcaption>${vo4.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo4.itemNo}"><figcaption class="price_font">${vo4.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
      <div>
        <div>
          <h3 class="catefont">국 | 반찬 | 메인요리</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo5" items="${list5}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><img alf="이미지" width="170" src="${CP}${vo5.viewPath}/${vo5.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><figcaption>${vo5.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><figcaption class="price_font">${vo5.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
      <div>
        <div>
          <h3 class="catefont">간식 | 과자 | 떡</h3>
        </div>
        <div class="goods responsive">
          <c:forEach var="vo6" items="${list6}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo6.itemNo}"><img alf="이미지" width="170" src="${CP}${vo6.viewPath}/${vo5.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo6.itemNo}"><figcaption>${vo6.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo6.itemNo}"><figcaption class="price_font">${vo6.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
</fmt:bundle>