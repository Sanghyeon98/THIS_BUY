<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="${CP}/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
  
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
    
  <title>제품 목록</title>
  
  <!-- javascript -->
  <script>
    
    $(document).ready(function(){
      
    	// 최초 목록 조회
    	doRetrieve(1);
    	
      // paging
      renderingPage('${totalPage}', 1);
      
      
      // 품절 처리
      $("#upSoldOutAll").on("click", function(){
    	  console.log("upSoldOutAll");
    	  
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
          alert("품절 처리 할 상품을 선택하세요.");
          return;
        }
        
        if(confirm("품절 처리 하시겠습니까?") == false) return;
        
        let method = "POST";
        let url = "/product/upSoldOutAll.do";
        let async = true;
        let params = { 
            itemNo : uIdString 
        };
        
        
        PClass.callAjax(method, url, async, params, function(data) {
          console.log(data);
          let parsedJson = JSON.parse(data);
          
          // 품절 성공
          if("0" != parsedJson.msgId) {
            alert(parsedJson.msgContents);
            doRetrieve(1);
            initControll();
          } else {  // 품절 실패
            alert(parsedJson.msgId + "," + parsedJson.msgContents);
          }
          
        });
    	  
      }); // 품절 처리 ------------------------------------------------------------
      
      
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
    
    
    // 목록 조회 함수
    function doRetrieve(page) {
      let method = "GET";
      let url = "/product/doRetrieve.do";
      let async = true;
      
      let cate1val = $(".cate01List").val();   // 2차 분류 value
      let cate2val = $(".cate02List").val();   // 2차 분류 value
      console.log("cate1val : " + cate1val);
      console.log("cate2val : " + cate2val);
      
      let cateId = "";
      
      if('none' == cate2val) {  // 2차 분류가 선택되지 않으면
        cateId = $(".cate01List").val(); // 1차 분류로 검색
      } else {
        console.log("cate2val != none >> " + cate2val);
        cateId = $(".cate02List").val(); // 2차 분류로 검색 
      }
      console.log("cateId : " + cateId);
      
      let params = {
        cateClass01 : cate1val,
        cateClass02 : cate2val,
        searchWord : $('#searchWord').val(),
        cateId : cateId,
        pageSize : $('#pageSize').val(),
        pageNo : page
      };
      
      
      PClass.callAjax(method, url, async, params, function(data) {
        console.log(data);
        let parsedJson = JSON.parse(data);
        let htmlData = "";
        
        $("#productTable>tbody").empty();
        
        let totalCnt = 0;//총글수  
        let pageTotal = 0;//총페이지수 
        
        if (null != parsedJson && parsedJson.length > 0) {
          
          totalCnt = parsedJson[0].totalCnt;
          pageTotal = Math.ceil(totalCnt / $("#pageSize").val());
          console.log("----------------------------");
          console.log("-totalCnt : " + totalCnt);
          console.log("-pageTotal : " + pageTotal);
          console.log("-page : " + page);
          console.log("----------------------------");
            
          $.each(parsedJson, function(index, value) {
              htmlData += "<tr>";
              htmlData += "  <td class='td_center'><input type='checkbox' name='chk' value='" + value.itemNo + "'></td>";
              htmlData += "  <td class='td_center'>" + value.num + "</td>";
              htmlData += "  <td>" + value.name + "</td>";
              htmlData += "  <td class='td_center'>" + value.price + "</td>";
              htmlData += "  <td class='td_center'>" + value.quantity + "</td>";
              htmlData += "  <td class='td_center'>" + value.modDt + "</td>";
              htmlData += "  <td style='display: none;'>" + value.itemNo + "</td>";
              htmlData += "</tr>";
          });
        } else {
            htmlData += "<tr>";
            htmlData += "  <td class='td_center' colspan='99'>";
            htmlData += "   No data found ";
            htmlData += "  </td>";
            htmlData += "</tr>";
        }
        
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
    	
    	$(".cate01List").val("none");
    	$(".cate02 List").val("none");
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
          <p>관리자 > 상품 관리 > 상품 관리 목록</p>
        </div>
        <div class="content_body">
          <form action="#">
            <table>
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <select class="cate01List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="vo" items="${cate01List}">
                        <option value='<c:out value="${vo.categoryNo}"/>'>
                            <c:out value="${vo.categoryNm}"/>
                        </option>
                    </c:forEach>
                  </select>
                  <select class="cate02List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="vo" items="${cate02List}">
                      <c:choose>
                          <c:when test="${vo.topNo == 1 }">
                            <option value='<c:out value="${vo.categoryNo}"/>'>
                                <c:out value="${vo.categoryNm}"/>
                          </option>
                          </c:when>
                      </c:choose>
                    </c:forEach>
                  </select> 
                </td>
              </tr>
              <tr>
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
            <c:forEach var="vo" items="${PAGE_SIZE }">
                <option value='<c:out value="${vo.detCode}"/>'>
                    <c:out value="${vo.detName }"></c:out>
                </option>
            </c:forEach>
          </select>
        </div>

        <!-- 테이블 목록 -->
        <div class="search_list">
          <form action="#">
            <table id="productTable">
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox" id="checkAll"></th>
                  <th width="8%">번호</th>
                  <th width="45%">상품명</th>
                  <th width="15%">판매가</th>
                  <th width="10%">재고</th> 
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
          <button id="upDeleteAll">선택상품 삭제</button>
          <button id="upSoldOutAll">선택상품 품절처리</button>
          <button id="prod_reg_bt">상품 등록</button>
        </div>
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -------------------------------------------------------->
    <footer>
    </footer>
  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>