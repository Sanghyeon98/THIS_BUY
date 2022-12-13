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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
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
*, :after, :before {
    box-sizing: border-box;
    margin: 0;
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

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.table-1 {
    width: 820px;
    border-bottom: 1px solid rgb(244, 244, 244);
}

.table-t-tr {
    width: 100%;
    table-layout: fixed;
    border-bottom: 1px solid rgb(51, 51, 51);
    border-top: 2px solid rgb(51, 51, 51);
}

.table-t-th {
    width: 100px;
    padding: 20px 0px;
    text-align: center;
    font-size: 14px;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}

.table-b td:first-of-type {
    width: 620px;
    padding: 20px;
    text-align: left;
}

.table-b td {
    width: 100px;
    text-align: center;
    font-size: 14px;
    line-height: 22px;
}
.css-1 {
    overflow: hidden;
    display: block;
    width: 580px;
    cursor: pointer;
}

.css-2 {
    width: 100%;
}
</style>
  
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">

<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>

<!-- callAjax.js -->
<script src="${CP_RES}/js/callAjax.js"></script>

<!-- eUtil.js  String,Number,date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>   
    
<!-- bootpag js -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>

<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>목록</title>
<script >
  $(document).ready(function(){
	  console.log("document.ready");
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
         <div class="css-2">
        <table class="table-1">
          <thead>
           <tr class = "table-t-tr">
            <th class = "table-t-th">제목</th>
            <th class = "table-t-th">작성일</th>
            <th class = "table-t-th">답변상태</th>
           </tr>
          </thead>
          <tbody>
           <tr class = "table-b"> 
            <td>
             <div class = "css-1">주문취소</div>
            </td>
             <td>
             <div class = "css-1">2022.12.09</div>
            </td>
             <td>
             <div class = "css-1">답변완료</div>
            </td>
           </tr>
          </tbody>
        </table>
        </div>
        </div>
          <li class="css-0 "><a class=" css-20 " href="${CP}/board/boardView.do">등록</a></li>
 
    
    
    <button disabled type="button" >
    <div class="css-button ">이전</div>
    </button>
    <button type="button" >
    <div class="css-button ">다음</div>
    </button>
    
    
    </div></div></div></div></div></div>
  
</body>
</html>