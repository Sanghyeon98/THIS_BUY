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
 $("#pho").on("click",function(){
    	TIMER();
    });
//전화번호 인증시 타이머
    const Timer=document.getElementById('Timer'); //스코어 기록창-분
    let time= 180000;
    let min=3;
    let sec=60;


    Timer.value=min+":"+'00'; 
   
    function TIMER(){
        PlAYTIME=setInterval(function(){
            time=time-1000; //1초씩 줄어듦
            min=time/(60*1000); 

           if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
                sec=sec-1;
                Timer.value=Math.floor(min)+':'+sec; //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
               
            }
            if(sec===0){
             	// 0에서 -1을 하면 -59가 출력된다.
                // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
                sec=60;
                Timer.value=Math.floor(min)+':'+'00'
            }     
       
        },1000); //1초마다 
    }


    TIMER();
    setTimeout(function(){
        clearInterval(PlAYTIME);
    },180000);//3분이 되면 타이머를 삭제한다.


//전화번호 인증문자 발송
 $("#phonech").on("click",function(){
          console.log("#phonech");
          if(eUtil.ISEmpty( $("#phone").val() ) == true){
              alert("전화번호 를 입력하세요.");
              $("#phone").focus();
              return;
          }
          const phone = $('#phone').val();
          const phonechnum = $('#phonechnum')
          let method = "POST";
          let url    = "/signup/phonech.do";
          let async  = true;
          let params = {
        		  "phone"    : $("#phone").val()
        		  };
          PClass.callAjax(method,url,async,params,function(data){
              console.log("data:"+data);
              phonechnum.attr('disabled',false);
              let parsedJson = JSON.parse(data);
              phonecode=data;
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
                checkInput.attr('disabled',false);
                let parsedJson = JSON.parse(data);
                emailcode=data;
                alert('인증번호가 전송되었습니다.')
                		
                     
        });
   });// end ajax
    // end send eamil
    
    

 // 인증번호 비교 
    // blur -> focus가 벗어나는 경우 발생
    $('.mailcheckinput').blur(function () {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');
        
        if(inputCode === emailcode){
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color','green');
            $('#emailCheck').attr('disabled',true);
            $('#email').attr('readonly',true);
        }else{
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
           var p1 = document.getElementById('passwd1').value;
           var p2 = document.getElementById('passwd2').value;
           if(( p1 != p2 ) ==true) {
             alert("비밀번호가 일치 하지 않습니다");
             $("#passwd1").focus();
             return ;
           }
           const inputCode = $("#mailcheckinput").val();
           if( (inputCode) !== (emailcode) ){
        	   alert('이메일 인증번호가 불일치 합니다. 다시 확인해주세요!.');  
        	   $("#mailcheckinput").focus();
        	   return;
           }
           
           
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
               "address"    : $("#address").val(),
               
           };
           
           PClass.callAjax(method,url,async,params,function(data){
               console.log("data:"+data);
               let parsedJson = JSON.parse(data);
               
               if("1" == parsedJson.msgId){
                  alert(parsedJson.msgContents);
                  //입력 항목 초기화
                  //아이디: enabledz
                  //등록버튼:enabled
                  window.location.href = "${CP}/login/login.do";
               }else{
                   alert(parsedJson.msgId+","+parsedJson.msgContents);
               }
               
           });           
     });
//등록    


});

function test() {
    var p1 = document.getElementById('passwd1').value;
    var p2 = document.getElementById('passwd2').value;
    if(( p1 != p2 ) ==true) {
      alert("비밀번호가 일치 하지 않습니다");
      $("#passwd").focus();
      return false;
    }

  }
//doc
 //버튼, 등록 컨트롤 초기화
    

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
      <input type="text" class="form-control" id="memberid" name="memberid" placeholder="아이디를 입력해주세요">
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
      <input type="password"  class="form-control" id="passwd1" name="passwd1" placeholder="비밀번호를 입력해주세요">
    </div>
    </div>
    
    <!-- 비밀번호 일치확인 -->
     <div class="row">
    <div class="col-md-2 text-centers">
     비밀번호 확인<span class="r">*</span>
    </div>
    <div class="col-md-7 text-centers">
      <input type="password" class="form-control" id="passwd2" name="passwd2" placeholder="비밀번호를 한번 더 입력해주세요">
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
   
   <div class="row">
   <div class="col-md-2"></div>
   <div class="col-md-7 text-centers">
   <input class="form-control mailcheckinput" name="mailcheckinput" id="mailcheckinput" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
   <span id="mail-check-warn"></span>  
   </div></div>
   
   <div class="row">
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
   
    <div class="row">
    <div class="col-md-2 text-centers">
    </div>
       <div class="col-md-7 text-centers">
         <input type="text"  class="form-control" id="phonechnum" name="phonechnum" placeholder="인증번호를 입력하세요"  maxlength="4">
        		 <span id="Timer" class="timer" ><input type="text" id="Timer" value=""></span>
        
         
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
 <input type="text"  class="form-control" id="address" name="address" placeholder="주소를 입력해주세요">        
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
           <input type="radio" name="gender"  value="option1" checked>
            <div style="width:15%"></div>
           <label class="radio-inline">남자</label>
           <input type="radio" name="gender"  value="option2" >
            <div style="width:15%"></div>
           <label class="radio-inline">선택 안함</label>
           <input type="radio" name="gender"  value="option3" >
           
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

















