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

<script>
$(document).ready(function(){
    console.log("document.ready");
        
        $("#newpwin").on("click",function(){
            console.log("#newpwin");
            
        
          if(eUtil.ISEmpty( $("#newpasswd").val() ) == true){
              alert("비밀번호를을 입력 하세요.");
              $("#newpasswd").focus();
              return;
          }       
          
          if(confirm("수정 하시겠습니까?")==false)return;
          
          let method = "GET";
          let url    = "/memberupdate/pwUpdate.do";
          let async  = true;
          let params = {
                  "passwd" : $("#newpasswd").val()
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
          });
        //수정    
        }); 
  //document  
});
</script>

</head>
<body>
<h3 class="text-center">비밀번호 변경</h3>
<br>
<form class="login">

    
    <div class="row">
      <div class="col-md-2 text-centers">
     새 비밀번호
    </div>
    ${sessionScope.memberInfo.memberid}
    <div class="col-md-7 text-centers">
      <input type="password"  class="form-control" id="newpasswd" name="newpasswd" placeholder="비밀번호를 입력해주세요">
    </div>
    </div>
    
     <div class="row">
      <div class="col-md-2 text-centers">
     새 비밀번호 확인
    </div>
    <div class="col-md-7 text-centers">
      <input type="password"  class="form-control" id="newpasswd1" name="newpasswd1" placeholder="비밀번호를 다시 입력해주세요">
    </div>
    </div>
    
    <div class="btn-signup">
    <button type="button" style="width: 240px;" class="btn btn-default btn-block " value="등록" id="newpwin">비밀 번호 변경</button>
    </div>
</form>


</body>
</html>
</fmt:bundle>