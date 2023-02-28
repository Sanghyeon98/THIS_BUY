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
  <link rel="stylesheet" href="${CP_RES}/css/login.css">
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
    
    $("#pwcheck").on("keypress",function(e){
        
        if(13==e.which){
          e.preventDefault();
          //event trigger발생
          $('#Login').trigger('click');
        }
        
      });
    
    $("#Login").on("click",function(){
        console.log("doLogin");
        
       
        
        let method = "POST";
        let url    = "/memberupdate/doLogin.do";
        let async  = true;
        let params = {
        		"memberid" : $("#memberid").val(),
                "passwd": $("#passwd").val()
        };
        
        PClass.callAjax(method,url,async,params,function(data){
            console.log("data:"+data);
            let parsedJson = JSON.parse(data);
            //id입력 확인
            if("40" == parsedJson.msgId){
                alert(parsedJson.msgContents);
                $("#memberid").focus();
                return;
            }
            
            //비번입력 확인
      if("50" == parsedJson.msgId){
          alert(parsedJson.msgContents);
          $("#passwd").focus();
          return;
      }
            
            //------------------------------------------
            //id존재 체크
            if("10" == parsedJson.msgId){
                alert(parsedJson.msgContents);
                $("#memberid").focus();
                return;
            }
            
            //비번 체크
            if("20" == parsedJson.msgId){
                alert(parsedJson.msgContents);
                $("#passwd").focus();
            return;
            }
            
            //로그인 성공
         if("30" ==parsedJson.msgId){
              window.location.href = "${CP}/memberupdate/memberupdate.do";
          }
      
        });
      //doLogin      
    });
    
    
    
    
  //document  
});


</script>

</head>
<body>
<h3 class="text-center">비밀 번호 재확인</h3>
<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
<br>
<form class="login">
        <!-- session으로 아이디 찍기  -->
      <input type="text" class="login1" id="memberid" name="memberid" value="${sessionScope.memberInfo.memberid }" readonly="readonly">

      <input type="password"  class="login1" id="passwd" name="passwd" placeholder="현재 비밀번호를 입력해주세요">
        
      <button type="button" class="bt1 btn btn-default btn-block text-center btn-block"   id="Login">확인</button>

</form>


</body>
</html>
</fmt:bundle>