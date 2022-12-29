<%--
/**
  Class Name: mypage_question
  Description: 목록조회
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 13        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>

<style>

.css-1v4whg {
    height: 75px;
    padding: 5px 0px 35px 1px;
    font-weight: 500;
    font-size: 28px;
    line-height: 35px;
    color: rgb(51, 51, 51);
    letter-spacing: -1px;
}

ul {
  border: 1px solid crimson;
  margin: 10px 110px; /* 바깥여백 */
  padding: 10px; /* 안여백 */
  list-style: none;
}

.txt_center {
  text-align: center; /* 가운데 정렬 */
}

.body {
  display: flex;
}

.title {
  display: flex;
}

.sp_select {
  margin-left: 950px;
}

.sp_font {
  margin-left: 100px;
  font-size: 8px;
}

.sp_head {
  font-size: 24px;
}

.tag {
  margin: 50px 10px 50px;
}

.button {
  height: 500px;
  line-height: 500px;
  text-align: center;
  margin: 0 auto;
}
</style>


<title>주문내역</title>
<!-- 뷰포트(반응형 웹)  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project product list">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<!-- favicon -->
<link rel="shortcut icon" type="images/x-icon"
  href="/PC_HTML/favicon.ico">
<!-- jquery ui -->
<link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- String, Number, Date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>
<!-- paging -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>
<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>
<!-- javascript -->
<script>
   $(document).ready(function(){
      console.log('Hello, world!');
   
    
     //개인정보 수정화면으로 이동
     $("#moveToLogin").on("click",function(){
    	 
     })
      
      
    });
  </script>
</head>
<body>
  <div>
    <ul>
      <li>
        <p>사용자님</p>
      </li>
      <li>
        <p>적립 5%</p>
      </li>
      <li>
        <p>최초 1회 배송비무료</p>
      </li>
    </ul>
  </div>

    <div class="list_body">

 
      <div class="css-1v4whg ecbxmj3">마이컬리
      </div>
      <ul class="css-1x9bshx ecbxmj2">  
          <li class="css-0 ecbxmj1">
            <a class=" css-pi3u6r ecbxmj0">주문 내역
              <span class="css-e41glx e1x0rfoo0"></span>
            </a>
          </li>
        
          <li class="css-0 ecbxmj1">
            <a class=" css-pi3u6r ecbxmj0">상품 문의
              <span class="css-e41glx e1x0rfoo0"></span>
            </a>
          </li>
          
          <li class="css-0 ecbxmj1">
            <a class="active css-pi3u6r ecbxmj0">개인 정보 수정
            <span class="css-e41glx e1x0rfoo0"></span>
            </a>
          </li>
       </ul>
        <a href="/mypage/inquiry/list" class="css-17gln34 e19l01ug3">
        
          <div>
            <span class="css-1sdidca e19l01ug1">도움이 필요하신가요 ?</span>
            <span class="css-rnnx2x e19l01ug0">1:1 문의하기</span>
          </div>
          <span class="css-1wkaywz e1x0rfoo0"></span>
        </a>
   
     
    </div>
    <div>
      <div class="title">
      
            <table>
              <tbody>
       
              </tbody>
            </table>
          </div>
        </div>
      </div>
</body>
</html>
</fmt:bundle>