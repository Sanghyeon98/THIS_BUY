<%--
/**
  Class Name: bootList.jsp
  Description: 목록조회
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 11. 28        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
     //공지사항(10)/자유게시판 구분(20)
     String divValue = request.getParameter("gubun");
     String title = "";
     String gubun1 = "";
     String gubun2 = "";
     if("20".equals(divValue)){
       title = "1:1문의";
       gubun1 = "작성일";
       gubun2 = "답변상태";
       
     }else{
       title = "공지사항";
       gubun1 = "작성자";
       gubun2 = "작성일";
     }
     
     request.setAttribute("title", title);
     request.setAttribute("gubun1", gubun1);
     request.setAttribute("gubun2", gubun2);
     request.setAttribute("divValue", divValue);
%>
<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>

<style>       
 *, :after, :before {
    box-sizing: border-box;
    margin: 0;
}
*, :after, :before, legend, td, th {
    padding: 0;
}
div {
    display: block;
}
body, button, input, select, textarea {
    font-size: 14px;
    color: #333;
}
body {
    margin: 0;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: #fff;
    -webkit-tap-highlight-color: transparent;
}
:root {
    --swiper-theme-color: #007aff;
}
html, button, input, select, textarea {
    font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum, sans-serif;
}
html {
    touch-action: manipulation;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
html {
    line-height: 1.15;
    -webkit-tap-highlight-color: transparent;
}
*, :after, :before {
    box-sizing: border-box;
    margin: 0;
}
*, :after, :before, legend, td, th {
    padding: 0;
}

*, :after, :before, legend, td, th {
    padding: 0;
}

.css-1 {
    display: flex;
    width: 1050px;
    padding: 50px 0px 80px;
    margin: 0px auto;
    flex-direction: row;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.css-2 {
    width: 200px;
}
.css-3 {
    height: 75px;
    padding: 5px 0px 35px 1px;
    font-weight: 500;
    font-size: 28px;
    line-height: 35px;
    color: rgb(51, 51, 51);
    letter-spacing: -1px;
}
.css-4 {
    border: 1px solid rgb(242, 242, 242);
}
ol, ul {
    list-style-type: none;
}

.css-5 {
    width: 820px;
}
.css-6 {
    display: flex;
    flex-direction: row;
    width: 100%;
    padding-bottom: 27px;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.css-7 {
    display: flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
}
.css-8 {
    font-weight: 500;
    font-size: 24px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.5px;
    line-height: 48px;
}
.css-9 {
    padding-left: 11px;
    font-size: 14px;
    letter-spacing: -0.3px;
    color: rgb(153, 153, 153);
    line-height: 20px;
}
.css-10 {
    display: flex;
    width: 100%;
    padding: 20px 0px;
    border-bottom: 1px solid rgb(51, 51, 51);
    border-top: 2px solid rgb(51, 51, 51);
}
.css-11 {
    flex-basis: 50px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
.css-12 {
    -webkit-box-flex: 1;
    flex-grow: 1;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
.css-13 {
    flex-basis: 100px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
.css-13 {
    flex-basis: 100px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
.css-14 {
    display: flex;
    flex-direction: column;
}
.css-15 {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid rgb(244, 244, 244);
}
.css-16 {
    text-align: center;
    padding: 20px 0px;
    color: rgb(76, 76, 76);
    flex-basis: 50px;
}
.css-17 {
    padding: 20px 0px 20px 20px;
    color: rgb(76, 76, 76);
    flex: 1 1 0%;
    text-align: left;
}
.css-18 {
    text-align: center;
    padding: 20px 0px;
    color: rgb(76, 76, 76);
    flex-basis: 100px;
}
.css-19 {
    text-align: center;
    padding: 20px 0px;
    flex-basis: 100px;
    color: rgb(153, 153, 153);
}

.css-20 {
    cursor: pointer;
    border-bottom: 1px solid #f2f2f2;
    padding: 14px 20px 16px 20px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    line-height: 19px;
    letter-spacing: -.3px;
    font-size: 14px;
    color: #666;
}

.css-20.active, .css-20:hover {
    background-color: #fafafa;
    font-weight: 500;
}

.css-button {
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
}

  .css-Button {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 120px;
    height: 44px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: blue;
    border: 0px none;
}
</style>
  
<head> 
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
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
<meta charset="UTF-8">
<title>목록</title>
<script >
  $(document).ready(function(){
  
	  
	  //등록화면으로 이동
	    $("#moveToReg").on("click",function(){
	      
	      console.log('moveToReg');
	      
	      window.location.href = "${CP}/board/questionreq.do";
	      
	    //moveToReg
	    });
	  
  });
  
 
</script>

</head>

<body>

 <div id="__next" data-reactroot="">
  <div>
   <div>
    <div >
     <div class="css-1 "> 
     <div class="css-2 ">
     <div class="css-3 ">고객센터</div>
     <ul class="css-4 ">
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/boardView.do">공지사항</a></li>
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/questionView.do">1:1 문의</a></li>
     </ul>
   </div>
    
    
     <div class="css-5 ">
      <div class="css-6 ">
       <div class="css-7 ">
         <h2 class="css-8 ">공지사항</h2>
       </div>
      </div>
        <div class="css-10 ">
         <div width="50" class="css-11">번호</div>
         <div class="css-12 ">제목</div>
         <div width="100" class="css-13">작성자</div>
         <div width="100" class="css-13 ">작성일</div>
        </div>
     <c:choose>
        <c:when test="${list.size()>0 }">
          <c:forEach var="vo" items="${list }">
           <ul class="css-14 ">
            <li><a href="#">
              <div class="css-15">
              <div class="css-16 "><c:out value="${vo.seq }"></c:out></div>
              <div class="css-17 "><c:out value="${vo.title }"></c:out></div>
              <div class="css-18 "><c:out value="${vo.regId }"></c:out></div>
              <div class="css-19 "><c:out value="${vo.regDt }"></c:out></div>
            </div></a></li> </ul>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div>
            <div class="text-center col-sm-12 col-dm-12 col-lg-12" colspan="99">
             No data found
            </div>
          </div>
        </c:otherwise>
      </c:choose> 
      
     <div >
      <button class="css-Button" type="button" width="120" height="44" radius="3" id="moveToReg"> 등록  </button>
     </div>
 

    
    <!-- ----------------------------------페이징  -->
        <div class="text-center col-sm-12 col-dm-12 col-lg-12">
      <div id="page-selection" class="text-center page"></div>
    </div>
    <!-- ----------------------------------페이징  끝-->
    
    </div></div>
    </div></div></div></div>
  
</body>
</html>