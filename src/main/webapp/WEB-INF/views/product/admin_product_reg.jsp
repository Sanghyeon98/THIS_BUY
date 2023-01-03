<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="pcwk html" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <meta charset="UTF-8">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_reg.css">

  <title>제목</title>
  
  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	
    	
    	// 상품 등록 버튼
    	$("#prod_save_bt").on("click", function() {
    		console.log("상품등록버튼");
    		
    		console.log("2차 분류  : " + $(".cate02List").val());
    		
    		if('none' == $(".cate01List").val()) {
    			alert("1차 분류를 선택하세요.");
    			return;
    		}
    		
    		if('none' == $(".cate02List").val()) {
    			alert("2차 분류를 선택하세요.");
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#name").val())) {
    			alert("상품명을 입력하세요.");
    			$("#name").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#price").val())) {
    			alert("가격을 입력하세요.");
    			$("#price").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#production").val())) {
    			alert("생산지를 입력하세요.");
    			$("#production").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#weight").val())) {
    			alert("무게를 입력하세요.");
    			$("#weight").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#expired").val())) {
    			alert("유통기한을 입력하세요.");
    			$("#expired").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#quantity").val())) {
    			alert("재고수량을 입력하세요.");
    			$("#quantity").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#detail").val())) {
    			alert("상품설명을 입력하세요.");
    			$("#detail").focus();
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

    		/*
    		if(fileInput.files.length === 0) { 
          alert("파일을 선택해주세요.");
          return;
        }
    		*/
    		
    		let formData = new FormData();

    		for(let i=0; i < fileInput.files.length; i++) {
          formData.append("image"+i, fileInput.files[i]);
        }
    		
    		console.log("formData : " + formData);
    		
        // proccessData : true -> query string으로 데이터 전달! ex)http://localhost:8089?title-1234
        // contentType : default값은 "application/x-www-form-urlencoded; charset-UTF-8"
        //   --> multipart/form-data로 전송되도록 false 설정!
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
             
             // 제품 추가
             let p_method = "POST";
             let p_url = "/product/doSave.do";
             let p_async = true;
             let p_params = {
               name : $("#name").val(),
               price : $("#price").val(),
               production : $("#production").val(),
               weight : $("#weight").val(),
               expired : $("#expired").val(),
               quantity : $("#quantity").val(), 
               categoryNo : $(".cate02List").val(),
               detail : $("#detail").val(),
               imageNo : getImageNo  // 이미지 번호가 0이면 이미지 없음
             };
             
             PClass.callAjax(p_method, p_url, p_async, p_params, function(p_data) {
               console.log("in_PClass");
               console.log("p_data : " + p_data);
               
               let parsedJson = JSON.parse(p_data);
               
               if("1" == parsedJson.msgId) {  // 제품 등록 성공
            	   alert(parsedJson.msgContents);
            	   moveToReg();
               } else {
            	   alert(parsedJson.msgContents);
               }
             
             });
           }
           
        }); // ajax END --------------------------------------------------------
           
    		
    	});  // 상품 등록 버튼 END ---------------------------------------------------

    	
    	// 1차 분류 변경 시, 2차 분류 표출
      $(".cate01List").on("change", function() {
        console.log(".cate01List");
        console.log("$(this).val() : " + $(this).val());
        
        // 선택된 1차 분류 value 값
        let currentCateNo = $(this).val();
        
        $(".cate02List").empty();
        
        let cate02ListJson = JSON.parse('${cate02ListJson}');
        console.log("cate02ListJson : " + cate02ListJson);
        
        let htmlData = "";
        console.log("htmlData length : " + htmlData.length);
        
        htmlData += "<option value='none'>==선택==</option>";
        
        $.each(cate02ListJson, function(index, value) {
            // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
          if(value.topNo == currentCateNo) {
              htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
            }
          });
        
        /* // 2차 분류에 값이 없으면 '==선택==' 표출
        if(htmlData.length == 0) {
          htmlData += "<option value='none'>==선택==</option>";
        }
         */
        $(".cate02List").append(htmlData);
      });  // 1차 분류 변경 시, 2차 분류 표출 -------------------------------------------
        
    });
    
    function moveToReg() {
    	window.location.href= "${CP}/product/moveToReg.do";
    }
  </script>
</head>

<body>
  <!-- wrap -->
  <div id="wrap">
    <header>
    </header>
    <!-- container -->
    <div id="container" class="clear">
      <!-- lnb -->
      <div class="lnb">
        <jsp:include page="/WEB-INF/views/cmn/admin_left_menu.jsp"></jsp:include>
      </div> 
      <!-- lnb END -------------------------------------------------------->
      <!-- content -->
      <div class="content">
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 상품 등록</p>
        </div>
        <div class="content_body">
          <form action="#" method="post" enctype="multipart/form-data">
            <table class="table table-bordered"> 
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <div class="col-xs-4">
	                  <select class="cate01List form-control">
	                    <option value='none'>==선택==</option>
	                    <c:forEach var="vo" items="${cate01List}">
	                        <option value='<c:out value="${vo.categoryNo}"/>'>
	                            <c:out value="${vo.categoryNm}"/>
	                        </option>
	                    </c:forEach>
	                  </select>
                  </div>
                  <div class="col-xs-4">
	                  <select class="cate02List form-control"> 
	                    <option value='none'>==선택==</option>
	                  </select>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="table_left"><label for="name">상품명</label></td>
                <td><input class="form-control" type="text" id="name" name="name" placeholder="상품명"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="price">가격</label></td>
                <td><input class="form-control" type="number" id="price" name="price" placeholder="가격"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="production">생산지</label></td>
                <td><input class="form-control" type="text" id="production" name="production" placeholder="생산지"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="weight">무게</label></td>
                <td><input class="form-control" type="number" id="weight" name="weight" placeholder="무게"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="expired">유통기한</label></td>
                <td><input class="form-control" type="text" id="expired" name="expired" placeholder="YYYYMMDD"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="quantity">재고수량</label></td>
                <td><input class="form-control" type="number" id="quantity" name="quantity" placeholder="재고수량"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="detail">상품 설명</label></td>
                <td><textarea class="form-control" id="detail" name="detail"></textarea></td>
              </tr>
              <tr> 
                <td class="table_left"><label for="imageName">이미지</label></td>
                <td><input type="file" id="imageName" name="imageName"></div>
              </tr>
            </table> 
            <div class="reset">
              <input class="btn btn-default btn-sm" type="reset">
            </div>
          </form>
        </div>
        <div class="bt_area">
          <button class="btn" style="background-color: #b5c8e0; color: white;" style="background-color: #B8C9DF;" id="prod_save_bt">상품 등록</button>
        </div>
      </div>
      <!-- content END ---------------------------------------------------------->
    </div>
    <!-- container END -->
    <footer>
    </footer>
  </div>
  <!-- wrap END ------------------------------------------------------------->
</body>
</html>
</fmt:bundle>