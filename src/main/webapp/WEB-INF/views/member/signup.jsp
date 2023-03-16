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
	<!-- 주소 api --> 
    <script src="${CP_RES}/js/postcode.v2.js"></script>
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
  
    
   

 //주소찾기
 $("#addresssearch").on("click",function(){
	 var iframe=document.getElementById("iframe");
	 iframe.contentWindow.search();
 });
 $("#addresssearch2").on("click",function(){
	 var iframe=document.getElementById("iframe");
	 iframe.contentWindow.search();
 });
//전화번호 인증문자 발송
 $("#phonech").on("click",function(){
	 check();
          console.log("#phonech");
          if(eUtil.ISEmpty( $("#phone").val() ) == true){
              alert("전화번호 를 입력하세요.");
              $("#phone").focus();
              return;
          }
          
          const phone = $('#phone').val();
          const phonechnum = $('#phonechnum')
          let method = "GET";
          let url    = "/signup/phonech.do";
          let async  = true;
          let params = {
        		  "phone"    : $("#phone").val()
        		  };
          PClass.callAjax(method,url,async,params,function(data){
              console.log("data:"+data);
              let parsedJson = JSON.parse(data);
              phonecode=data;
              $('#phch').show();
              
          });
     });
//전화번호 인증번호 확인
 $("#phonechnumch").on("click",function(){
	 console.log("#phonechnumch");
	 const input= $("#phonechnum").val();
	 
     if(eUtil.ISEmpty( $("#phonechnum").val() ) == true){
         alert("인증번호 를 입력하세요.");
         $("#phonechnum").focus();
         return;
     }
     if(input === phonecode){
    	 alert("인증 되었습니다.")
    	 $("#phoneCheck").val("1");
     }else{
    	 alert("인증에 실패했습니다. 인증 번호를 확인해주세요.")
    	 $("#phoneCheck").val("0");
     }
 });
          
//id중복체크   
     $("#idCheck").on("click",function(){
          console.log("#idCheck");
          //id값 
          if(eUtil.ISEmpty( $("#memberid").val() ) == true){
              alert("아이디를 입력하세요.");
              $("#memberid").focus();
              return;
          }
          let method = "GET";
          let url    = "/signup/idCheck.do";
          let async  = true;
          let params = {
        		  memberid: $("#memberid").val()
        		  };
          
          
          PClass.callAjax(method,url,async,params,function(data){
              console.log("data:"+data);
              
              let parsedJson = JSON.parse(data);
              //id사용 가능
              if("0" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
                  $("#idCheckYN").val("1");
                  
                  //아이디는 PK로 활성화
                $("#memberid").prop("disabled",true);
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
          let url = "/signup/mailCheck.do"; 
          let async  = true;
          let params = {
             "email"    : $("#email").val()
          };
          
          
          PClass.callAjax(method,url,async,params,function(data){// GET방식이라 Url 뒤에 email을 뭍힐수있다.       
                console.log("data : " +  data);
                let parsedJson = JSON.parse(data);
                emailcode=data;
                alert('인증번호가 전송되었습니다.')
                $('#emch').show();
                changeemailbtnName();
                emaillreset();
                const $resultMsg = $('#mail-check-warn');
                $resultMsg.html('')
                		
                     
        });
   });
    // end send eamil
    
    

 // 인증번호 비교 
    // blur -> focus가 벗어나는 경우 발생
    $('.mailcheckinput').blur(function () {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');
        
        if(inputCode === emailcode){
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color','green');
        }else if(inputCode == null){
            $resultMsg.html('');
        }
        else{
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color','red');
        }
    });
//등록
     $("#add").on("click",function(){
            console.log("#add");
          if(eUtil.ISEmpty( $("#memberid").val() ) == true){
             alert("아이디를 입력 하세요.");
             $("#memberid").focus();
             return;
           }
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
          if($("#pwch").val() == "0"){
              alert("비밀번호가 유효하지 않습니다.");
              $("#passwd1").focus();
              return;
          }
           if(eUtil.ISEmpty( $("#phoneCheck").val() ) == true){
              alert("휴대폰 인증을 해주세요.");
              $("#phone").focus();
              return;
          }
          if($("#phoneCheck").val() == "0"){
             alert("휴대폰 인증을 해주세요.");
              $("#phone").focus();
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
           if(eUtil.ISEmpty( $("#address").val() ) == true){
               alert("주소을 입력 하세요.");
               $("#address").focus();
               return;
           } 
           const inputCode = $("#mailcheckinput").val();
           if( (inputCode) !== (emailcode) ){
        	   alert('이메일 인증번호가 불일치 합니다. 다시 확인해주세요!.');  
        	   $("#mailcheckinput").focus();
        	   return;
          }
           var p1 = document.getElementById('passwd1').value;
           var p2 = document.getElementById('passwd2').value;
           if(( p1 != p2 ) ==true) {
             alert("비밀번호가 일치 하지 않습니다");
             $("#passwd1").focus();
             return ;
           }
           var birth=$("select[name=yy]").val()+$("select[name=mm]").val()+$("select[name=dd]").val()
           $("#birth").val(birth);
           
           if(confirm("등록 하시겠습니까?")==false)return;
           
           let method = "GET";
           let url    = "/signup/add.do";
           let async  = true;
           let params = {
               "memberid" : $("#memberid").val(),
               "passwd"   : $("#passwd1").val(),
               "name"     : $("#name").val(),
               "email"    : $("#email").val(),
               "phone"    : $("#phone").val(),
               "address"    : $("#address_final").val()+$("#address_detail").val(),
               "gender"    :$('input[id="gender"]:checked').val(),
               "birthdate" :  $("#birth").val()
               
           };
           
           PClass.callAjax(method,url,async,params,function(data){
               console.log("data:"+data);
               let parsedJson = JSON.parse(data);
               
               if("1" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
                  window.location.href = "${CP}/login/login.do";
               }else{
                   alert(parsedJson.msgId+","+parsedJson.msgContents);
               }
               
           });           
     });
//등록    


});
//주소 검색시 버튼 숨기고 인풋박스 열기
function addresspick(){
	document.getElementById('addresssearch').style.display='none';
	document.getElementById('address_final').style.display='block';
	document.getElementById('addresssearch2').style.display='block';
	document.getElementById('address_detail').style.display='block';
	document.getElementById('addressseachbefore').style.display='block';
}
//이메일 인증 다시하기
function changeemailbtnName()  {
	  const btnElement = document.getElementById('emailCheck');
	  btnElement.innerText = '다시 인증하기';
	}
//email인증 다시하기 인증번호 초기화
function emaillreset(){
	const reset = "";
	$("#mailcheckinput").val(reset);
}

//전화번호 인증시 타이머
function check() {
	
	   var time=10;
	   var min="";
	   var sec="";

	   var x = setInterval(function(){
		   min=parseInt(time/60);
		   sec=time%60;		   
		   function n2(sec){ //숫자를 2자리로 만들기 위함.
				return sec >= 10 ? sec : "0" + sec; //숫자가 10보다 작을 경우 앞에 0을 붙임.
			}
		document.getElementById("Timer").innerHTML ="0" + min + ":" + n2(sec);
		   time--;
		   $('#phonechnumch').click(function(){
			   clearInterval(x);
		   });
		   if(time< 0){
			   clearInterval(x);
	              alert("다시 인증 해주세요.");
	              $('#phch').hide();
		   }
	   },1000);
   }
//ID 특수문자, 공백 , 한글 방지
// 특수문자 입력 방지
function IDCheck(obj){
var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
var space = /\s/g;
var ko = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
// 허용할 특수문자는 여기서 삭제하면 됨
if( regExp.test(obj.value) ){
	   document.getElementById("id-check-warn").innerHTML ="특수 문자를 입력하실 수 없습니다";
	 $("#idCheck").prop("disabled",true);
	   }else if(space.test(obj.value)){
	   document.getElementById("id-check-warn").innerHTML ="공백을 입력하실 수 없습니다";
	 $("#idCheck").prop("disabled",true);
	}else if(ko.test(obj.value)){
	   document.getElementById("id-check-warn").innerHTML ="한글을 입력하실 수 없습니다";
	 $("#idCheck").prop("disabled",true);
	}else{
	 document.getElementById("id-check-warn").innerHTML ="";
	 $("#idCheck").prop("disabled",false);
		
	}
}
function chkPW(){

	 var pw = $("#passwd1").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length > 20){
	   document.getElementById("pw-check-warn").innerHTML ="8자리 ~ 20자리 이내로 입력해야합니다"; 
	   $("#pwch").val("0");
	 }else if(pw.search(/\s/) != -1){
	   document.getElementById("pw-check-warn").innerHTML ="공백을 입력하실 수 없습니다";
	   $("#pwch").val("0");
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	   document.getElementById("pw-check-warn").innerHTML ="영문,숫자, 특수문자를 혼합하여 입력해야 합니다";
	   $("#pwch").val("0");
	 }else{
	   document.getElementById("pw-check-warn").innerHTML ="";
	   $("#pwch").val("1");
	 }
	}
function chkPW2(){
	var p1 = document.getElementById('passwd1').value;
    var p2 = document.getElementById('passwd2').value;
    if(( p1 == p2 ) ==true) {
 	  document.getElementById("pw-check-warn2").innerHTML ="";
    }else{
 	  document.getElementById("pw-check-warn2").innerHTML ="비밀번호가 일치 하지 않습니다";
    }
}

  
//doc
    

</script>


 
</head>
<iframe id="iframe" src="iframe.do" width="300" height="200" frameborder="1" style='visibility:hidden; display:none;' ></iframe>

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
      <input type="text" class="form-control" id="memberid" name="memberid" placeholder="아이디를 입력해주세요" onkeyup="IDCheck(this)" onkeydown="IDCheck(this)">
      <span id="id-check-warn" style="color:red;"></span> 
    </div>
     <div class="col-md-3 text-centers">
      <button type="button" class="btn btn-default btn-block" value="아이디 중복" id="idCheck">중복 확인</button>
    </div>
    </div>
    
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호<span class="r">*</span>
    <input type="hidden" name="pwch" id="pwch">
    </div>
    <div class="col-md-7 text-centers">
      <input type="password"  class="form-control" id="passwd1" name="passwd1" placeholder="비밀번호를 입력해주세요" onkeyup="chkPW()" onkeydown="chkPW()">
      <span id="pw-check-warn" style="color:red;"></span> 
    </div>
    </div>
    
    <!-- 비밀번호 일치확인 -->
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호 확인<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="password" class="form-control" id="passwd2" name="passwd2" placeholder="비밀번호를 한번 더 입력해주세요" onkeyup="chkPW2()" onkeydown="chkPW2()">
      <span id="pw-check-warn2" style="color:red;"></span> 
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
   <div class="row" >
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
   
   
   <div class="row" id="emch">
   <div class="col-md-2"></div>
   <div class="col-md-7 text-centers">
   <input class="form-control mailcheckinput" name="mailcheckinput" id="mailcheckinput" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
   <span id="mail-check-warn"></span>  
   </div></div>
   
   <div class="row" >
    <div class="col-md-2 text-centers">
    <input type="hidden" name="phoneCheck" id="phoneCheck">
           휴대폰<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="phone" name="phone" placeholder="숫자만 입력해주세요">
       </div>
       <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block" id="phonech" name="phonech">인증번호 받기</button>
   </div>
   </div>
    <div class="row"  id="phch">
    <div class="col-md-2 text-centers">
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="phonechnum" name="phonechnum" placeholder="인증번호를 입력하세요"  maxlength="4">
        <span id="Timer" class="timer" ></span>
       </div>
       <div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block" id="phonechnumch" name="phonechnumch" >인증번호 확인</button>
       </div>
   </div>
    <!--  주소 api -->
    <div class="row">
    <div class="col-md-2 text-centers">
          주소<span class="r">*</span>
    </div>
       <div class="col-md-7 text-centers">
       <button type="submit" class="btn btn-default btn-block" id="addresssearch" name="addresssearch" >주소 검색</button>
       <input type="text"  class="form-control" id="address_final" name="address_final" value="" style='display:none;' readonly="readonly">  
       </div>
  	
  		<div class="col-md-3">
         <button type="submit" class="btn btn-default btn-block" id="addresssearch2" name="addresssearch2" style='display:none;'><img class="searchico" src="${CP_RES}/img/common/search.png" />재검색</button>
       </div>
   
       </div>
       
       <div class="row" id="addressseachbefore" style='display:none;' >
    	<div class="col-md-2 text-centers">
    	</div>
       <div class="col-md-7 text-centers">
       <input type="text"  class="form-control" id="address_detail" name="address_detail" value="" style='display:none;'>  
  
       </div>
       </div>
       
       <!-- 체크박스 값 받기 -->
      <div class="row">
    <div class="col-md-2 text-centers">
          성별
    </div>
           <div class="col-md-7 text-centers " style="display:flex;">
           <label class="radio-inline">여자</label>
           <input type="radio" name="gender" id="gender" value="여자" checked>
            <div style="width:15%"></div>
           <label class="radio-inline">남자</label>
           <input type="radio" name="gender" id="gender"  value="남자" >
            <div style="width:15%"></div>
           <label class="radio-inline">선택 안함</label>
           <input type="radio" name="gender" id="gender" value="x" >
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
<input type="hidden" name="birth" id="birth" value="">

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

















