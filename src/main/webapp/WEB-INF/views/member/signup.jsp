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
<title>회원가입</title>
<script >




//생년월일 select 활성화
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
  

//생년월일 select 활성화



//id중복체크   
     $("#idCheck").on("click",function(){
          console.log("#idCheck");
          //id값 
          if(eUtil.ISEmpty( $("#uId").val() ) == true){
              alert("아이디를 입력하세요.");
              $("#uId").focus();
              return;
          }
          let method = "GET";
          let url    = "/member/idCheck.do";
          let async  = true;
          let params = {"uId": $("#uId").val()};
          
          PClass.callAjax(method,url,async,params,function(data){
              console.log("data:"+data);
              
              let parsedJson = JSON.parse(data);
              //id사용 가능
              if("0" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
                  $("#idCheckYN").val("1");
                  
                  //아이디는 PK로 활성화
                $("#uId").prop("disabled",true);
                //id중복  
              }else{
                  alert(parsedJson.msgContents);
                  $("#idCheckYN").val("0");
              }
          });
     });
     //id중복체크    
     
   //email 인증
   $('#emailCheck').click(function() {
	   if(eUtil.ISEmpty( $("#email").val() ) == true){
           alert("이메일을 입력하세요.");
           $("#email").focus();
           return;
           }
        const eamil = $('#email').val(); // 이메일 주소값 얻어오기!
        console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
        const checkInput = $('.mailcheckinput') // 인증번호 입력하는곳 
        
       
          let method = "GET";
          let url = "/member/mailCheck.do"; 
          let async  = true;
          let params = {
             "email"    : $("#email").val(),
          };
          PClass.callAjax(method,url,async,params,function(data){// GET방식이라 Url 뒤에 email을 뭍힐수있다.       
                console.log("data : " +  data);
                checkInput.attr('disabled',false);
                code =data;
                alert('인증번호가 전송되었습니다.')
                		
                     
        });
   });// end ajax
    // end send eamil

 // 인증번호 비교 
    // blur -> focus가 벗어나는 경우 발생
    $('.mail-check-input').blur(function () {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');
        
        if(inputCode === code){
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color','green');
            $('#mail-Check-Btn').attr('disabled',true);
            $('#email').attr('readonly',true);
        }else{
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color','red');
        }
    });
//등록
     $("#add").on("click",function(){
            console.log("#add");
          if(eUtil.ISEmpty( $("#uId").val() ) == true){
             alert("아이디를 입력 하세요.");
             $("#uId").focus();
             return;
           }
           
          //$("#idCheckYN").val("0");          
          if(eUtil.ISEmpty( $("#idCheckYN").val() ) == true){
              alert("아이디중복를 체크 해주세요.");
              $("#idCheck").focus();
              return;
          }
          
          if($("#idCheckYN").val() == "0"){
              alert("아이디중복를 체크  해주세요.");
              $("#idCheck").focus();
              return;
          }
          
          
          if(eUtil.ISEmpty( $("#passwd").val() ) == true){
               alert("비밀번호을 입력 하세요.");
               $("#passwd").focus();
               return;
          }       

           if(eUtil.ISEmpty( $("#name").val() ) == true){
               alert("이름을 입력 하세요.");
               $("#passwd").focus();
               return;
           }
           
          
           if(eUtil.ISEmpty( $("#email").val() ) == true){
               alert("이메일을 입력 하세요.");
               $("#email").focus();
               return;
           }
           
           if(eUtil.ISEmpty( $("#mailauth").val() ) == true){
               alert("이메일 인증을 해주세요.");
               $("#mailauth").focus();
               return;
           }
           
           if(eUtil.ISEmpty( $("#phone").val() ) == true){
               alert("휴대폰 번호을 입력 하세요.");
               $("#phone").focus();
               return;
           }   
           
           if(confirm("등록 하시겠습니까?")==false)return;
           
           let method = "POST";
           let url    = "/member/add.do";
           let async  = true;
           let params = {
               "uId"      : $("#uId").val(),
               "passwd"   : $("#passwd").val(),
               "name"     : $("#name").val(),
               "email"    : $("#email").val(),
               "phone"    : $("#phone").val(),
               
           };
           
           PClass.callAjax(method,url,async,params,function(data){
               console.log("data:"+data);
               let parsedJson = JSON.parse(data);
               
               if("1" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
                  //입력 항목 초기화
                  //아이디: enabledz
                  //등록버튼:enabled
                  initControll();                  
               }else{
                   alert(parsedJson.msgId+","+parsedJson.msgContents);
               }
               
           });           
     });
//등록    


});
//doc
 //버튼, 등록 컨트롤 초기화
    function initControll(){
        const initValue = "";
        //id중복체크 초기화
        $("#idCheckYN").val(initValue);
        
        $("#uId").val(initValue);
        $("#passwd").val(initValue);
        $("#name").val(initValue);
        $("#email").val(initValue);
        $("#emailCheck").val(initValue);
        $("#phone").val(initValue);
        $("#regDt").val(initValue);
        
        
        //아이디는 PK로 활성화
        $("#uId").prop("disabled",false);
        //버튼 활성화
        $("#add").prop("disabled",false);           
    }

</script>


 
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
    <input type="hidden" name="idCheckYN" id="idCheckYN">
    <div class="col-md-7 text-centers">
      <input type="text" class="form-control" id="uId" name="uId" placeholder="아이디를 입력해주세요">
    </div>
     <div class="col-md-3 text-centers">
      <button type="button" class="btn btn-default btn-block" value="아이디 중복" id="idCheck">중복 확인</button>
    </div>
    </div>
    
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="password"  class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
    </div>
    </div>
    
    <!-- 비밀번호 일치확인 -->
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호 확인<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 한번 더 입력해주세요">
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
 
 <!-- email 인증-->
   <div class="row">
    <div class="col-md-2 text-centers">
             이메일<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text" maxlength="320" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
       </div>
        <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block" value="이메일 인증" id="emailCheck">이메일 인증</button>
        </div>
   </div>
   <input class="form-control mailcheckinput" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
   <span id="mail-check-warn"></span>
   <!-- 본인 인증 넣기 -->
   <div class="row">
    <div class="col-md-2 text-centers">
           휴대폰<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="phone" name="phone" placeholder="숫자만 입력해주세요">
       </div>
       <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block ">인증번호 받기</button>
       </div>
   </div>
    
    <!--  주소 api -->
    <div class="row">
    <div class="col-md-2 text-centers">
          주소<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <button type="submit" class="btn btn-default btn-block">주소 검색</button>
         <small>배송지에 따라 상품 정보가 달라질 수 있습니다.</small>
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
    
  
  <button type="button" style="width: 240px;" class="btn btn-default btn-block " value="등록" id="add">가입하기</button>
  
 
  </div>

   </div>
   </div>

</body>

</html>
</fmt:bundle>

















