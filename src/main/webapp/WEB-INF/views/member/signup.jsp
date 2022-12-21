<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>  
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon"  href="${CP_RES}/favicon.ico">
  <link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">
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
<title>회원가입</title>
<script >
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
  
})
</script>
<style type="text/css">
.r{
 color:red;	
}
#signup{
margin: 0 auto;
width:640px;
}
.btn{
background-color:#B8C9DF;
color:white;
}
.col-md-2{
padding: 6px 0px 0px;
}
.row{
width:640px;
height:70px;
}
.info#info__birth {
  display: flex;
}

.info#info__birth select {
  margin-left : 7px;
}

.info#info__birth select:first-child {
  margin-left : 0px;
}
.info#info__birth select::-webkit-scrollbar {
  width: 10px;
}

.info#info__birth select::-webkit-scrollbar-thumb {
  background-color: #B8C9DF;
  border-radius: 3px;
}

.info#info__birth select::-webkit-scrollbar-track {
  background-color: #B8C9DF;
  border-radius: 6px;
}
</style>

 
</head>
<body >
<div class="position-relative">
<div id="signup" class="position-absolute top-0 start-50 translate-middle">
    
   <div>
       <h2 class="text-center">회원가입</h2>
    <div class="text-right">
       <span class="r">*</span>필수입력사항
    </div>
   </div>
    <hr>
  
    
    
    <div class="row">
    <div class="col-md-2 text-centers">
      아이디<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" id="uId" name="uId" placeholder="아이디를 입력해주세요">
    </div>
     <div class="col-md-3 text-centers">
      <button type="submit" class="btn btn-default btn-block">중복 확인</button>
    </div>
    </div>
    
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
    </div>
    </div>
    
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호 확인<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 한번 더 입력해주세요">
    </div>
    </div>
    
  <div class="row">
    <div class="col-md-2 text-centers">
             이름<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요">
       </div>
   </div>
 
   <div class="row">
    <div class="col-md-2 text-centers">
             이메일<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text" maxlength="320" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
       </div>
        <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block">중복 확인</button>
        </div>
   </div>
   
   <div class="row">
    <div class="col-md-2 text-centers">
           휴대폰<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="email" name="email" placeholder="숫자만 입력해주세요">
       </div>
       <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block ">인증번호 받기</button>
       </div>
   </div>
    
    <div class="row">
    <div class="col-md-2 text-centers">
          주소<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <button type="submit" class="btn btn-default btn-block">주소 검색</button>
         <small>배송지에 따라 상품 정보가 달라질 수 있습니다.</small>
       </div>
       
       </div>
      <div class="row">
    <div class="col-md-2 text-centers">
          성별
    </div>
           <div class="col-md-7 text-centers">
           <label>
           <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
           남자 
           </label>

           <label>
           <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
          여자
           </label>

           <label>
           <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
           선택 안함
           </label>
       </div>
       </div>
   
     <div class="row">
    <div class="col-md-2 text-centers">
       생년 월일
    </div>
    <div class="col-md-7 text-centers">
 <select name="yy" id="year"></select>년
<select name="mm" id="month"></select>월
<select name="dd" id="day"></select>일
</div>
</div>
  
  
  
  
  
  
  
  
  
  
  
  
   </div>
   </div>
 
</body>

</html>
</fmt:bundle>

















