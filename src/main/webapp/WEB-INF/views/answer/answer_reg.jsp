<%--
/**
  Class Name: board_reg.jsp
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

<link rel="stylesheet" href="${CP_RES}/css/board_answer_reg.css">
  
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   


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

    $("#contents").on("keyup",function(e){
        
        //현재 문자열 길이
        let currnetLength    = $("#contents").val().length;
        //최대 문자열
        let contentMaxLength = 2000;

        if(currnetLength > contentMaxLength){
          alert("최대 "+contentMaxLength+"까지 입력 가능합니다.");
          $("#contents").focus();
          
          
          //글자 자르기
          let str = $("#contents").val();
          str  = str.substring(0, contentMaxLength);
          $("#contents").val(str);
          
        }else{
          $("#count").text(currnetLength);
        }
      
      //contents end   
      });   
      
             
      //=====================================등록 doSave
      $("#doSave").on("click",function(){
        console.log("doSave");
        
        
        if(eUtil.ISEmpty($("#title").val()) == true){
          alert("제목을 입력 하세요.");
          $("#title").focus();
          return;
        }
          
        if(eUtil.ISEmpty($("#contents").  val()) == true){
            alert("내용을 입력 하세요.");
            $("#contents").focus();
            return;
        }       
          
        if(confirm("등록 하시겠습니까?")==false)return;
        
        //문의동록 
        let b_method = "GET";
        let b_url    = "/answer/doInsert.do";
        let b_async  = true;
        let b_params = {
        		seq :  $("#seq").val(),
            title : $("#title").val(),
            contents : $("#contents").val(),
            regId : "관리자"
        };
        
        PClass.callAjax(b_method,b_url,b_async,b_params,function(b_data){
          console.log(b_data);
        //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 
        //그 결과에서 JavaScript 값이나 객체를 생성합니다.
          let parsedJson = JSON.parse(b_data);
        
          if("1" == parsedJson.msgId){
            alert(parsedJson.msgContents);
            moveToList();
          }else{
            alert(parsedJson.msgContents);
          }
        
        });
            
        
      });//=====================================등록 doSave 끝
      
      
      
      //목록으로 이동
      $("#boardView").on("click",function(){
        console.log("boardView");
        moveToList();
      });//boardView  
      
    //document  
    });
    
    function moveToList(){
      window.location.href= "${CP}/board/questionView.do?gubun=20";//=====================================등록 doSave 끝;
    }
    
   
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
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/boardView.do?gubun=10" >공지사항</a></li>
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/boardView.do?gubun=30" >자주묻는질문</a></li>
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/questionView.do?gubun=20">1:1 문의</a></li>
     </ul>
   </div>
    
    
     <input type="hidden" value="${seq }" id="seq">

     <div class="css-5 ">
      <div class="css-6 ">
       <div class="css-7 ">
         <h2 class="css-8 ">Q&A 답글 작성</h2>
       </div>
      </div>
      <form>
       <div class="css-21">
        <div class="css-22">
         <label>제목</label>
        </div>
        <div class="css-23">
         <div class="css-24">
           <div height="44" class="css-25">
            <input data-testid="input-box" id="title" name="title" placeholder="제목을 입력해주세요" 
            type="text" height="44" class="css-26" value>
           </div>
         </div>
        </div>
        </div>
        <div class="">
         <div class="css-21">
          <div class="css-22">
            <label>내용</label>
           </div>
        <div class="css-23">
          <div class="">
           <div class="css-27">
            <textarea rows="inquiry-contents" inputmode="text" aria-label="textarea-message" id="contents"
             name="contents" class="css-28"></textarea>
           </div>
          </div>
        </div>
        </div>
        </div>
         
          </div>
        </div>
        </div>
        </div>

        <div class="css-40">
         <button type="button" class="css-41" id="doSave" value="${vo.seq }">등록</button>
        </div>
      
      </form>
      

    
    
    </div></div></div></div></div></div>
  
</body>
</html>