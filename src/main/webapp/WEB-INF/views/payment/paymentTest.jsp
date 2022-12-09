<%--
/**
  Class Name:
  Description:
  Modification information
  
   수정일     수정자      수정내용
  -----   -----  -------------------------------------------
  2022. 12. 9        최초작성 
    
  author eclass 개발팀 : ITSC
  since 2022.11.28
  Copyright (C) by KandJang All right reserved.
*/
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP }${RES }"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>제목</title>
  <!-- 뷰포트 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="${CP }/favicon.ico">
  <!-- bootstrap css -->
  <link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">
  
  <!-- 토스페이먼츠 API 테스트 -->
  <script src="https://js.tosspayments.com/v1/payment"></script>
  
  <!-- JQuery -->
  <script src="${CP_RES}/js/jquery-1.12.4.js"></script>
  <!-- bootstrap js -->
  <script src="${CP_RES}/js/bootstrap.min.js"></script>
  
  <script>
    $(document).ready(function() {
  	  console.log("document.ready");
  	  
      var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
      var tossPayments = TossPayments(clientKey);

      var button = document.getElementById('payment-button'); // 결제하기 버튼

      button.addEventListener('click', function () {
        tossPayments.requestPayment('카드', {
          amount: 15000,
          orderId: 'qYGNIWZ68TzK3CAOBSzAw',
          orderName: '토스 티셔츠 외 2건',
          customerName: '박토스',
          successUrl: 'http://localhost:8089/success',
          failUrl: 'http://localhost:8089/fail',
        });
        
      });
      
    });  //  $(document).ready END
  </script>
</head>
<body>
	<span>총 주문금액</span>
	<span>15,000 원</span>
	<button id="payment-button">15,000원 결제하기</button>  
</body>
</html>