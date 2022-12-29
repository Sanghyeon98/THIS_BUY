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
</style>

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
  <!-- 미들 -->
  <div id="wrap">
    <div class= "goods_list">
      <div>
        <div>
          <h3>채소<br><small>금주에 가장많이 팔린 제품!</small></h3>
        </div>
        <div class="goods">
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
          <h3>채소</h3>
        </div>
        <div class="goods">
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
          <h3>채소</h3>
        </div>
        <div class="goods">
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
          <h3>채소</h3>
        </div>
        <div class="goods">
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
          <h3>채소</h3>
        </div>
        <div class="goods">
          <c:forEach var="vo5" items="${list5}">
            <figure class="main_itemList">
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><img alf="이미지" width="170" src="${CP}${vo5.viewPath}/${vo5.saveName}"></a>
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><figcaption>${vo5.name}</figcaption></a>
              <a href="${CP}/detail/view.do?itemNo=${vo5.itemNo}"><figcaption class="price_font">${vo5.price}원</figcaption></a>
            </figure>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
</fmt:bundle>