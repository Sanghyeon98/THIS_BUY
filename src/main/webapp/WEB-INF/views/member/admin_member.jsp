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
        
        let method = "POST";
        let url = "/product/upDeleteAll.do";
        let async = true;
        let params = { 
            itemNo : uIdString 
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
      
      
      // '상품 등록' 버튼 클릭 시, 상품등록 페이지로 이동
      $("#prod_reg_bt").on("click", function() {
          console.log("#prod_reg_bt");
          
          window.location.href = "${CP}/product/moveToReg.do";
      });  // '상품 등록' 버튼 클릭 시, 상품등록 페이지로 이동 ------------------------------
      
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
        let url    ="/member/doRetrieve.do";
        let async  = true;
        let params = {
            searchDiv : $("#searchDiv").val(),
            searchWord: $("#searchWord").val(),
            pageSize : $("#pageSize").val(),
            pageNo: page
    };
        PClass.callAjax(method,url,async,params,function(data){
            console.log("data:"+data);
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
              console.log("=pageSize="+$("#pageSize").val());
              console.log("=pageTotal="+pageTotal);
              console.log("=page="+page);
              console.log("================");
              
            $.each(parsedJson,function(index,value){
                htmlData +=" <tr>";
                htmlData +="   <td class='text-center col-sm-1 col-md-1 col-lg-1'><input type='checkbox' name='chk' value='"+value.memberid+"' /></td>";
                htmlData +="   <td class='text-center col-sm-1 col-md-1 col-lg-1'>"+value.num  +"</td>";
                htmlData +="   <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+value.uId  +"</td>";
                htmlData +="   <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+value.name +"</td>";
                htmlData +="   <td class='text-center col-sm-2 col-md-2 col-lg-2'>"+value.level+"</td>";
                htmlData +="   <td class='text-left   col-sm-3 col-md-3 col-lg-3'>"+value.email+"</td>";
                htmlData +="   <td class='text-center col-sm-1 col-md-1 col-lg-1'>"+value.regDt+"</td>";
                htmlData +=" </tr>";                  
            });
          //데이터가 없는 경우    
          }else{
            htmlData +=" <tr>"; 
            htmlData +="   <td colspan='99' class='text-center  col-sm-12 col-md-12 col-lg-12'>no data found</td>";
            htmlData +=" </tr>";
          }
            
          //table 데이터 출력
          $("#memberTable>tbody").append(htmlData);
          
          //paging 데이터 삭제
          $("#page-selection").empty();
          renderingPage(pageTotal,page);
  
           
        // 데이터 출력
        $("#productTable>tbody").append(htmlData);
        
        //paging
        $("#page-selection").empty();//페이저 삭제
        renderingPage(pageTotal, page);
        
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
          <p>관리자 > 회원 관리 </p>
        </div>
        <div class="content_body">
          <form action="#">
            <table>
              <tr>
              <td class="table_left"><label>분류선택</label></td>
              <td><select class="form-control input-sm" name="searchDiv" id="searchDiv">  
          <option value="">전체</option>
          <option value="10">아이디</option>
          <option value="20">이름</option>
          <option value="30">이메일</option>
        </select></td>
                <td class="table_left"><label>검색어</label></td>
                <td><input type="text" name="searchWord" id="searchWord" placeholder="상품명을 입력하세요."></td>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="search_bt_area">
          <button id="doRetrieve">검색</button>
        </div>
        <div class="search_option">
          <select id="pageSize" name="pageSize">
            <option value="10">10</option>
          <option value="20">20</option>
          <option value="30">30</option>
          <option value="50">50</option>
          <option value="100">100</option>
          </select>
        </div>

        <!-- 테이블 목록 -->
        <div class="search_list">
          <form action="#">
            <table id="memberTable">
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox" id="checkAll"></th>
                  <th width="12%">id</th>
                  <th width="8%">이름</th>
                  <th width="58%">전화번호</th>
                  <th width="17%">등록일</th>
                  <th style="display: none;">SEQ</th>
                </tr>
              </thead>
              <tbody>


              </tbody>
            </table>
          </form>
        </div>
        <!-- 테이블 목록 ---------------------------------------------------------->
        
        <!-- 페이징 -->
        <div class="td_center">
          <div id="page-selection" class="text-center page"></div>
        </div>
        <!-- 페이징 ------------------------------------------------------------->
        
        <div class="bottom_bt_area">
          <button id="upDeleteAll">회원 삭제</button>
        </div>
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -------------------------------------------------------->

  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>