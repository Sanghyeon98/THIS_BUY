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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">

  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
  
    
  <title>제품 목록</title>
  
  <!-- javascript -->
  <script>
    
    $(document).ready(function(){
      
      // 최초 목록 조회
      doRetrieve(1);
      
      // paging
      renderingPage('${totalPage}', 1);
      
      /* 
      // 제품 상세 페이지
      $("#productTable>tbody").on("click", "tr", function() {
        console.log("tr");
        
        let tdArray = $(this).children();
        let productNo = tdArray.eq(6).text();
        
        //window.open("${CP}/product/moveToMod.do?itemNo=" + productNo, target="_blank", 
        //             "width=1100, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
        window.location.href= "${CP}/product/moveToMod.do?itemNo=" + productNo;
      }); */
      
      
      
      
      // 다건 삭제 (단건 삭제)
      $("#upDeleteAll").on("click", function() {
        let uIdArray = [];
        
        $("input:checkbox[name=chk]").each(function(i, element) {
          // 체크된 데이터 uIdArray 추가
          if ($(this).is(":checked") == true) {
            console.log($(this).val());
            uIdArray.push($(this).val());
          }
        });
        
        let uIdString = "";
        
        if(uIdArray.length > 0) {  // 체크된 데이터가 있으면
          uIdString = uIdArray.toString();
          console.log("uIdString : " + uIdString);
        } else {
          alert("삭제할 자료를 선택하세요.");
          return;
        }
        
        if(confirm("삭제하시겠습니까?") == false) return;
        
        let method = "GET";
        let url = "/admin/upDeleteAll.do";
        let async = true;
        let params = { 
            memberid : uIdString 
        };
        
        
        PClass.callAjax(method, url, async, params, function(data) {
          console.log(data);
          let parsedJson = JSON.parse(data);
          
          // 삭제 성공
          if("0" != parsedJson.msgId) {
            alert(parsedJson.msgContents);
            doRetrieve(1);
            initControll();
          } else {
            alert(parsedJson.msgId + "," + parsedJson.msgContents);
          }
          
        });
        
      }); // 다건 삭제 END --------------------------------------------------------
      
     
      // 전체 선택/해제
      $("#checkAll").on("click", function() {
        console.log("#checkAll");
        //chk
        //전체 체크
        if ($("#checkAll").is(":checked") == true) {
          $("input[name=chk]").prop("checked", true);
          //체크 해제  
        } else {
          $("input[name=chk]").prop("checked", false);
        }
      }); // 전체 선택/해제 END ----------------------------------------------------
      
      
      // 검색어 enter 
      $("#searchWord").on("keypress", function(e) {
        console.log(e.type + " : " + e.which);
        
        if (13 == e.which) {
          e.preventDefault();
          doRetrieve(1);
        }
          
      }); //검색어 enter END -----------------------------------------------------
      
      
      // 검색
      $("#doRetrieve").on("click", function() {
        console.log("doRetrieve");
        
        doRetrieve(1);
        
      }); // doRetrieve --------------------------------------------------------

      
      
    }); // document.ready END --------------------------------------------------
    
    
    //=============================doSelectOne함수
    function doSelectOne(productNo) {
      let url = "${CP}/product/moveToMod.do";

      url = url + "?itemNo="+productNo;
      console.log("url : "+url);
      location.href = url;
    }
    //=============================doSelectOne함수 끝  
    
    
    // 목록 조회 함수
    function doRetrieve(page) {
    	let method ="GET";
        let url    ="/admin/doRetrieve.do";
        let async  = true;
        let params = {
            searchDiv : $("#searchDiv").val(),
            searchWord: $("#searchWord").val(),
            pageSize : $("#pageSize").val(),
            pageNo: page,
            memberid   : $("#memberid").val(),
            name       : $("#name").val(),
            phone      : $("#phone").val(),
    };
        PClass.callAjax(method,url,async,params,function(data){
            console.log("member:"+data);
          //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
          let parsedJson = JSON.parse(data);
          
          let htmlData = "";
          
          
          //table 데이터 삭제  
          $("#memberTable>tbody").empty();
          
         
          let totalCnt = 0; //총글수
          let pageTotal = 0;//총 페이지수
          
          if(null !=parsedJson && parsedJson.length > 0 ){
              //총페이지수 
              //총글수/페이수-나머지가 있으면 1증가
              totalCnt=parsedJson[0].totalCnt;
              pageTotal = Math.ceil( totalCnt/$("#pageSize").val() );
              console.log("================");
              console.log("=totalCnt="+totalCnt);
              console.log("=pageTotal="+pageTotal);
              console.log("=page="+page);
              console.log("================");
              
            $.each(parsedJson,function(index,value){
                htmlData +=" <tr>";
                htmlData +="   <td class='td_center'><input type='checkbox' name='chk' value='"+value.memberid+"' /></td>";
                htmlData +="   <td><a href='#' onClick='doSelectOne(" + value.memberid + ")'>" + value.memberid + "</a></td>";
                htmlData +="   <td class='td_center'>"+value.name  +"</td>";
                htmlData +="   <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+value.phone +"</td>";
                htmlData +="  <td class='td_center'>"+value.regDt+"</td>";
                htmlData +=" </tr>";                  
            });
          //데이터가 없는 경우    
          }else {
              htmlData += "<tr>";
              htmlData += "  <td class='td_center' colspan='99'>";
              htmlData += "   No data found ";
              htmlData += "  </td>";
              htmlData += "</tr>";
          }
            
          //table 데이터 출력
          $("#memberTable>tbody").append(htmlData);
          
          //paging 데이터 삭제
          $("#page-selection").empty();
          renderingPage(pageTotal,page);
  
           
 
        
      });  // PClass.callAjax END
    } // 목록 조회 (doReterieve 함수) END ------------------------------------------
    
    
    // 초기화
    function initControll() {
      const initValue = "";
      
      $("#searchWord").val(initValue);
    }
    
    
    // paging
    function renderingPage(pageTotal, page) {
      console.log("pageTotal:" + pageTotal);
      console.log("page:" + page);

      pageTotal = parseInt(pageTotal);

      //연결된 EventHandler제거
      $('#page-selection').unbind('page');

      $('#page-selection').bootpag({
        total : pageTotal,
        page : page,
        maxVisible : 10,
        leaps : true,
        firstLastUse : true,
        first : '←',
        last : '→',
        wrapClass : 'pagination',
        activeClass : 'active',
        disabledClass : 'disabled',
        nextClass : 'next',
        prevClass : 'prev',
        lastClass : 'last',
        firstClass : 'first'
      }).on("page", function(event, num) {
        console.log("num:" + num);
        doRetrieve(num);
      });
    } // paging END ------------------------------------------------------------
 
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
      <!-- lnb END ------------------------------------------------------------>
      
      <!-- content -->
      <div class="content">
        <div class="content_nav">
          <p>관리자 > 회원 관리 > 상세 정보</p>
        </div>
        <div class="content_body">
          <form action="#" method="post" enctype="multipart/form-data">
            <input type="hidden" name="itemNo" id="itemNo" value="${vo.itemNo}"> 
            <table>
              <tr>
                <td class="table_left"><label for="memberid">계정</label></td>
                <td><input type="text" id="memberid" name="memberid" value="memberid"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="name">이름</label></td>
                <td><input type="text" id="name" name="name" value="name"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="email">email</label></td>
                <td><input type="text" id="email" name="email" value="email"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="PHONE">전화번호</label></td>
                <td><input type="number" id="PHONE" name="PHONE" value="PHONE"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="ADDRESS">주소</label></td>
                <td><input type="text" id="ADDRESS" name="ADDRESS" value="ADDRESS"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="GENDER">성별</label></td>
                <td><input type="number" id="GENDER" name="GENDER" value="GENDER"></td>
              </tr>
               <tr>
                <td class="table_left"><label for="BIRTHDATE">생년월일</label></td>
                <td><input type="text" id="BIRTHDATE" name="BIRTHDATE" value="BIRTHDATE"></td>
              </tr>
               <tr>
                <td class="table_left"><label for="GENDER">등록일</label></td>
                <td><input type="text" id="REG_DT" name="REG_DT" value="REG_DT"></td>
              </tr>
            </table>
            
          </form>
        </div>
        <div class="bt_area">
          <button id="prod_cancel_bt">취소</button>
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