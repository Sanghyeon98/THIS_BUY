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
  <link rel="stylesheet" href="${CP_RES}/css/signup.css">
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
<title>로그인</title>

<script >
$(document).ready(function(){
    console.log("document.ready");
    
    $("#pwUpdate").on("click",function(){
    	window.location.href = "pwUpdate.do";
    	});
    
    
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
    
    
    
        
        $("#update").on("click",function(){
            console.log("#update");
            
            
      
            
          if(eUtil.ISEmpty( $("#name").val() ) == true){
              alert("이름을 입력 하세요.");
              $("#name").focus();
              return;
          }         

          
      
          
          
          if(eUtil.ISEmpty( $("#email").val() ) == true){
              alert("이메일을 입력 하세요.");
              $("#email").focus();
              return;
          }       
          
          if(confirm("수정 하시겠습니까?")==false)return;
          
          let method = "GET";
          let url    = "/memberupdate/doUpdate.do";
          let async  = true;
          let params = {
                  "memberid"   : $("#memberid").val(),
                  "name"     : $("#name").val(),
                  "email"    : $("#email").val(),
                  "phone"    : $("#phone").val()
          };
          
          PClass.callAjax(method,url,async,params,function(data){
              console.log("data:"+data);
              //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
              let parsedJson = JSON.parse(data);
              
              if("1" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
              }else{
                  
                  alert(parsedJson.msgId+","+parsedJson.msgContents);
              }
              window.location.href = "${CP}/main/main_page.do"; 
          });
          
          
          
        //수정    
       
        });
        
      
    
    
  //document  
});

    	

</script>

</head>
<body >
<div class="position-relative">
<div id="signup" class="position-absolute top-0 start-50 translate-middle">
    
   <div>
       <h2 class="text-center">회원 정보수정</h2>
    <div class="text-right">
       <span class="r">*</span>필수입력사항
    </div>
   </div>
    <hr>
  
    
    
    <div class="row">
    <div class="col-md-2 text-centers">
      아이디<span class="r">*</span>
    </div>
    <input type="hidden" name="idCheckYN" id="idCheckYN">
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" value="${sessionScope.memberInfo.memberid }" readonly="readonly" id="memberid" name="memberid" placeholder="아이디를 입력해주세요">
    </div>
    </div>
    
  
    
  <div class="row">
    <div class="col-md-2 text-centers">
             이름<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text" class="form-control" value="${sessionScope.memberInfo.name }" id="name" name="name" placeholder="이름을 입력해주세요">
       </div>
   </div>
 
 <!-- email 인증-->
   <div class="row">
    <div class="col-md-2 text-centers">
             이메일<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text" maxlength="320" class="form-control" value="${sessionScope.memberInfo.email }" id="email" name="email" placeholder="이메일을 입력하세요">
       </div>
        <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block" value="이메일 인증" id="emailCheck">이메일 인증</button>
        </div>
   </div>
  
   <!-- 본인 인증 넣기 -->
   <div class="row">
    <div class="col-md-2 text-centers">
           휴대폰<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="phone" value="${sessionScope.memberInfo.phone }" name="phone" placeholder="숫자만 입력해주세요">
       </div>
       <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block ">다른 인증 받기</button>
       </div>
   </div>
    
 
       
       <!-- 체크박스 값 받기 -->
      <div class="row">
    <div class="col-md-2 text-centers">
          성별
    </div>
           <div class="col-md-7 text-centers " style="display:flex;">
           <label class="radio-inline">여자</label>
           <input type="radio" name="optionsRadios1" id="optionsRadios1" value="option1" checked>
            <div style="width:15%"></div>
           <label class="radio-inline">남자</label>
           <input type="radio" name="optionsRadios2" id="optionsRadios2" value="option2" >
            <div style="width:15%"></div>
           <label class="radio-inline">선택 안함</label>
           <input type="radio" name="optionsRadios3" id="optionsRadios3" value="option3" >
           
       </div>
       </div>
   
   <!-- select 값 받기 -->
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
  
  <div class="btn-signup">
    
  
  <button type="button" style="width: 240px;" class="btn btn-default btn-block " value="등록" id="update">수정하기</button>
  
 
  </div>

   </div>
   </div>

</body>
</html>
</fmt:bundle>