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
<%
     //공지사항(10)/자유게시판 구분(30)
     String divValue = request.getParameter("gubun");
     String title = "";
     if("30".equals(divValue)){
       title = "자주묻는 질문 등록";
     }else{
       title = "공지사항 등록";
     }
     
     request.setAttribute("title", title);
     request.setAttribute("divValue", divValue);
%>      

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
.css-21 {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}

.css-22 {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
.css-23 {
    width: 640px;
}
.css-24 {
    padding: 0px;
}
.css-25 {
    position: relative;
    height: 44px;
}
.css-26 {
    width: 100%;
    height: 44px;
    padding: 0px 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid rgb(221, 221, 221);
    font-weight: 400;
    font-size: 16px;
    line-height: 42px;
    color: rgb(51, 51, 51);
    outline: none;
    box-sizing: border-box;
}
.css-27 {
    position: relative;
    display: flex;
    flex-direction: column;
    height: 536px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(221, 221, 221);
    border-radius: 4px;
}
.css-28 {
    display: block;
    width: 100%;
    height: 100%;
    padding: 15px 16px;
    font-size: 16px;
    line-height: 21px;
    word-break: break-all;
    z-index: 1;
    background: none;
    border-radius: 4px;
    color: rgb(51, 51, 51);
    outline: none;
    resize: none;
    border: none;
}
.css-29 {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    padding: 15px 15px 32px;
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

   .css-30 {
    font-size: 14px;
    line-height: 20px;
    color: rgb(153, 153, 153);
}

.css-31 {
    display: block;
    margin: 0px 0px 4px;
    font-weight: 500;
}
      .css-40 {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    padding-top: 40px;
}

.css-41 {
    width: 160px;
    height: 56px;
    padding: 0px 10px;
    text-align: center;
    letter-spacing: 0px;
    font-size: 16px;
    line-height: 20px;
    color: white;
    cursor: pointer;
    background-color: rgb(221, 221, 221);
    font-family: "Noto Sans", sans-serif;
    font-weight: 500;
    border-radius: 3px !important;
}
   
   .css-42 {
    display: flex;
    flex-direction: column;
    padding: 5px 0px;
}
        
        .css-43 {
    display: flex;
    flex-flow: row wrap;
    gap: 9px;
    font-size: 20px !important;
}

.css-44 {
    margin: 11px 0px 7px;
    line-height: 16px;
    font-size: 13px;
    color: rgb(153, 153, 153);
}

.css-45 {
    display: flex;
    flex-direction: row;
    margin-top: 7px;
}

.css-span {
    margin: 11px 0px 7px;
    line-height: 16px;
    font-size: 13px;
    color: rgb(153, 153, 153);
}
    
</style>
  
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
      
             
      //등록
      $("#doSave").on("click",function(){
        console.log("doSave");
        
        if(eUtil.ISEmpty($("#title").val()) == true){
          alert("제목을 입력 하세요.");
          $("#title").focus();
          return;
        }
          
        if(eUtil.ISEmpty($("#contents").val()) == true){
            alert("내용을 입력 하세요.");
            $("#contents").focus();
            return;
        }       
          
        if(confirm("등록 하시겠습니까?")==false)return;
              
        //문의동록 
        let b_method = "GET";
        let b_url    = "/board/doSave.do";
        let b_async  = true;
        let b_params = {
            gubun : $("#gubun").val(),
            title : $("#title").val(),
            contents : $("#contents").val(),
            regDt : "",
            regId : "관리자",
            answerCheck : 0
        };
        
        PClass.callAjax(b_method,b_url,b_async,b_params,function(b_data){
          console.log(b_data);
        //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 
        //그 결과에서 JavaScript 값이나 객체를 생성합니다.
          let parsedJson = JSON.parse(data);
        
          if("1" == parsedJson.msgId){
            alert(parsedJson.msgContents);
            moveToList();
          }else{
            alert(parsedJson.msgContents);
          }
        
        });
     
      });//문의등록 end
      
      
      
      //목록으로 이동
      $("#boardView").on("click",function(){
        console.log("boardView");
        moveToList();
      });//boardView  
      
    //document  
    });
    
    function moveToList(){
      window.location.href= "${CP}/board/boardView.do?gubun="+$("gubun").val;
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
     <li class="css-0 "><a class=" css-20 " href="${CP}/board/questionView.do?gubun=20">1:1문의사항</a></li>
     </ul>
   </div>
   
     <div class="css-5 ">
      <div class="css-6 ">
       <div class="css-7 ">
         <h2 class="css-8 ">${title}</h2>
         <input type="hidden" id="gubun" name="gubun" value="${vo.gubun}">
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
            type="text" height="44" class="css-26" >
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
        
        <div class="">
         <div class="css-21">
          <div class="css-22">
           </div>
        <div class="css-23">
          <div class="css-42">
           <div class="css-43">
            <div>
             <label for="imageName">첨부파일</label>
             <input type="file" id="imageName" name="imageName">
            </div>
           </div>
          </div>
          <div class="css-44">
           <div class="css-45">
            "30MB이하의 이미지만 업로드 가능합니다."
           </div>
           <div class="css-45">
            "상품의 최대 8장까지 등록가능합니다.  "
           </div>
          
          
          </div>
        </div>
        </div>
        </div>

        <div class="css-40">
         <button type="button" class="css-41" id="doSave">등록</button>
        </div>
      
      </form>
      

    
    
    </div></div></div></div></div></div>
  
</body>
</html>