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

<link rel="stylesheet" href="${CP_RES}/css/board_reg.css">
  
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
        
        let image = $("#imageName").val();
        
        console.log("이미지 : " + image);
        console.log("lastIndexOf : " + image.lastIndexOf('\\'));
        console.log("substr : " + image.substr(image.lastIndexOf('\\')+1));
        
        let imgPathName = image.substr(image.lastIndexOf('\\')+1);
        
        console.log("imageName : " + imgPathName.split('.'));
        
        
        let fileInput = $("#imageName")[0];
        console.log("fileInput.files.length : " + fileInput.files.length);
        
        let formData = new FormData();

        for(let i=0; i < fileInput.files.length; i++) {
          formData.append("image"+i, fileInput.files[i]);
        }
        
        console.log("formData : " + formData);
        
        $.ajax({ 
            type: "POST",
            url: "${CP}/image/doSave.do",
            processData: false,
            contentType : false,
            async: "true",
            dataType: "html",
            data: formData,
            
            success:function(data) {  // 이미지 등록 성공
              console.log("success data : " + data);  // data : ImageVO
              
              let getImageNo = 0;  // 이미지 번호가 0이면 이미지 없음
              
              //if(null != data) {
              if(data.length != 0) { // 등록된 이미지가 있으면 
                console.log("null!!");
                let getImage = JSON.parse(data);
                
                console.log("getImage.imageNo : " + getImage.imageNo);
                console.log("parseInt(getImage.imageNo) : " + parseInt(getImage.imageNo));
                
                console.log("image value : " +  $("#imageName").val());
                
                getImageNo = getImage.imageNo;
              } else { // 등록된 이미지가 없으면
                console.log("not null!!");
              }
              
			         //문의동록 
			        let b_method = "GET";
			        let b_url    = "/board/doSave.do";
			        let b_async  = true;
			        let b_params = {
			            gubun : $("#gubun").val(),
			            title : $("#title").val(),
			            contents : $("#contents").val(), 
			            regId : $("#regIdd").val(),
			            imageNo : getImageNo
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
              
           }
        
       }); // ajax END --------------------------------------------------------

     
    });//문의등록 end
      
      
      
      //목록으로 이동
      $("#boardView").on("click",function(){
        console.log("boardView");
        moveToList();
      });//boardView  
      
    //document  
    });
    
    function moveToList(){
      window.location.href= "${CP}/board/boardView.do?gubun=10";
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

       </div>
      </div>
      <form  method="post" enctype="multipart/form-data">
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
        
        <!-- hidden  -->
           <input type="text" data-testid="input-box" id="regIdd" name="regIdd" value="${sessionScope.memberInfo.name  }" >
           <input type="hidden" id="gubun" name="gubun" value="${vo.gubun}">
        <!-- hidden end  -->
      
      </form>
      
        <div class="css-40">
         <button type="button" class="css-41" id="doSave">등록</button>
        </div>
    
    
    </div></div></div></div></div></div>
  
</body>
</html>