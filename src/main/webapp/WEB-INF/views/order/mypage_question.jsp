<%--
/**
  Class Name: bootList.jsp
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="CP" value="${pageContext.request.contextPath}" />
<!-- ContextPath -->
<c:set var="RES" value="/resources" />
<c:set var="CP_RES" value="${CP}${RES}" />

<%@ include file="/WEB-INF/views/cmn/cache.jsp"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${CP_RES}/css/board_list.css">

<head>
<!-- 뷰포트(반응형 웹)  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project product list">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<!-- favicon -->
<link rel="shortcut icon" type="images/x-icon"
  href="/PC_HTML/favicon.ico">
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

<meta charset="UTF-8">
<title>목록</title>
<script>
  $(document).ready(function() {
    console.log("document.ready");
    renderingPage('${pageTotal}',1)
    //doRetrieve(1);
    
    //-------------------------------- 한건조회 (상세조회) 테이블 클릭 
        
      //테이블 클릭
                $("#boardTable").on("click",".cli",function(e) {
                          console.log('boardTable');
                          let divArray = $(this).children();
                          let boardSeq = divArray.eq(0).text();

                          console.log('boardSeq:' + boardSeq);
                          console.log('boardTable');

                              if (confirm("상세 조회를 하시겠습니까?") == false)
                                return;
                              //div,seq
                              window.location.href = "${CP}/board/doSelectOne.do?gubun=20&seq=" + boardSeq;
      
                              console.log("boardSeq: "+ boardSeq);

                          
                    });
    
                $("#boardTable").on("click",".clo",function(e) {
                        console.log('boardTable');
                        let divArray = $(this).children();
                        let answerNo = divArray.eq(0).text();


                        console.log('answerNo:' + answerNo);
                        console.log('boardTable');

                            if (confirm("상세 조회를 하시겠습니까?") == false)
                               return;
                           window.location.href = "${CP}/answer/doSelectAnswer.do?gubun=20&answerNo=" + answerNo;
    
                            console.log("answerNo: "+ answerNo);

                        
                  });
  
    
        

    //-------------------------------- 한건조회 (상세조회) 테이블 클릭  끝
    
    
      //등록화면으로 이동
        $("#questionReg").on("click", function() {

          console.log('moveToReg');

          window.location.href = "${CP}/board/questionReg.do"

          //moveToReg
        });
  }); //document
  
   function doRetrieve(page) {
        console.log('doRetrieve() page:' + page);
        let method = "GET";
        let url = "/board/doRetrieve.do";
        let async = true;

        let params = {
          gubun : $("#gubun").val(),
          pageSize : $('#pageSize').val(),
          pageNo : page
        };

        PClass.callAjax(method,url,async,params,function(data) {
                  console.log(data);
                  let parsedJson = JSON.parse(data);

                  let htmlData = "";

                  //기존 데이터 삭제
                  $("#boardTable").empty();

                  let totalCnt = 0;//총글수  
                  let pageTotal = 0;//총페이지수

                  if (null != parsedJson && parsedJson.length > 0) {

                    totalCnt = parsedJson[0].totalCnt;
                    pageTotal = Math.ceil(totalCnt/ $("#pageSize").val());
                    console.log("----------------------------");
                    console.log("-totalCnt:" + totalCnt);
                    console.log("-pageTotal:" + pageTotal);
                    console.log("-page:" + page);
                    console.log("----------------------------");
                    
                    $.each(parsedJson,function(index, value) {
                    
                      htmlData += "<ul class='css-14 '><li><div class='css-15 cli'>                 ";
                      if ("10" == $("#gubunQuestion").val()){
                             htmlData += "<div class='css-19 '>배송문의</div>                                 ";
                          }else if ("20" == $("#gubunQuestion").val()){
                            htmlData += "<div class='css-19 '>상품문의</div>                                 ";
                          }else if ("30" == $("#gubunQuestion").val()){
                            htmlData += "<div class='css-19 '>기타문의</div>                                 ";
                          }
                      htmlData += "<div class='css-17 ' >"+<c:out value='value.title'/>+"</div>  ";
                      htmlData += "<div class='css-18 '>"+<c:out value='value.regId'/>+"</div>   ";
                      htmlData += "<div class='css-19 '>"+<c:out value='value.regDt'/>+"</div>  ";
                      htmlData += "</div></li></ul>                                                 ";
                    
                    });
                    
                    if ($("#seq").val() == $("#answerseq").val()){
                      
                       $.each(parsedJson,function(index, value) {
                             
                         htmlData += "<ul class='css-14 '><li><div class='css-15 cli'>                 ";
                         htmlData += "<div style='display: none;'>"+<c:out value='value.answerNo'/>+"</div>                                 ";
                         htmlData += "<div class='css-16 '>└──</div>                                ";
                         htmlData += "<div class='css-17 ' >"+<c:out value='value.title'/>+"</div>";
                         htmlData += "<div class='css-18 ' >"+<c:out value='value.regId'/>+"</div>";
                         htmlData += "<div class='css-19 ' >"+<c:out value='value.regDt'/>+"</div>";
                         htmlData += "</div></li></ul>                                                      ";
                           
                         });
                      
                      
                    }

                    
                  } else {
                    htmlData += "<div>";
                    htmlData += "   No data found ";
                    htmlData += "</div>";
                  }

                  //데이터 출력
                  $("#boardTable").append(htmlData);

                  //paging
                  $("#page-selection").empty();//페이저 삭제
                  renderingPage(pageTotal, page);

                  //PClass.callAjax  
                });

      }

  //paging
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
    });
  }
  
  function Question(pageTotal, page) {
      if ("10" == ("$gubunQuestion").val()){
        
      }else if ("20" == ("$gubunQuestion").val()){
        
      }else if ("30" == ("$gubunQuestion").val()){
        
      }
  }
</script>

</head>

<body>


  <div id="__next" data-reactroot="">
    <div>
      <div>
        <div>
          <div class="css-1 ">
            <div class="css-2 ">
              <div class="css-3 ">고객센터</div>
              <ul class="css-1x9bshx ecbxmj2">  
         <li class="css-0 ecbxmj1">
           <a href="${CP}/order/orderView.do?memberId=kim" id="doRetrieve" class="tag css-pi3u6r ecbxmj0">주문 내역
             <span class="css-e41glx e1x0rfoo0"></span>
           </a>
         </li>
         <li class="css-0 ecbxmj1">
           <a href="${CP}/board/questionView.do?gubun=20" id="question" class="tag css-pi3u6r ecbxmj0">상품 문의
             <span class="css-e41glx e1x0rfoo0"></span>
           </a>
         </li>
         <li class="css-0 ecbxmj1">
           <a href="${CP}/memberupdate/memberCheck.do" id="login" class="tag active css-pi3u6r ecbxmj0">개인 정보 수정
             <span class="css-e41glx e1x0rfoo0"></span>
           </a>
         </li>
       </ul>
            </div>


            <div class="css-5 ">
              <div class="css-6 ">
                <div class="css-7 ">
                  <h2 class="css-8 ">1:1문의</h2>
                </div>
              </div>
              <div style="display: none;">
               <select class="form-control input-sm" name="pageSize" id="pageSize">
                  <c:forEach var="code" items="${PAGE_SIZE}">
                    <option value='<c:out value="${code.detCode }"/>'>
                      <c:out value="${code.detName }" />
                    </option>
                  </c:forEach>
                </select>
               </div>
              <div class="css-10">
                <div width="100" class="css-13">문의유형</div>
                <div class="css-12 ">제목</div>
                <div width=100" class="css-13">작성자</div>
                <div width="100" class="css-13 ">작성일</div>
              </div>
              <div id="boardTable">
                <c:choose>
                      <c:when test="${list.size()>0 }">
                         <c:forEach var="vo" items="${list }"  >
                           <ul class="css-14 ">
                              <li>
                                  <div class="css-15 cli">
                                    <!-- 1:1문의  -->
                                    <div style="display: none;"><c:out value="${vo.seq }"></c:out></div>
                                    <c:choose>
                                     <c:when test="${vo.gubunQuestion == 10 }">
                                      <div class="css-19 ">배송문의</div>
                                     </c:when>
                                     <c:when test="${vo.gubunQuestion == 20 }">
                                      <div class="css-19 ">상품문의</div>
                                     </c:when>
                                     <c:when test="${vo.gubunQuestion == 30 }">
                                      <div class="css-19 ">기타문의</div>
                                     </c:when>  
                                    </c:choose>
                                    <div class="css-17 " ><c:out value="${vo.title}"></c:out></div>
                                    <div class="css-18 "><c:out value="${vo.regId}"></c:out></div>
                                    <div class="css-19 "><c:out value="${vo.regDt} "></c:out></div>
                                  </div>
                              </li>
                            </ul>
                            <c:choose>
                              <c:when test="${list01.size()>0 }">
                                <c:forEach var="vo01" items="${list01 }">
                                 <c:choose>
                                  <c:when test="${vo.seq == vo01.seq}">
                                    <ul class="css-14 ">
                                      <li>
                                          <div class="css-15 clo">
                                            <!-- 1:1문의  -->
                                            <div style="display: none;"><c:out value="${vo01.answerNo }"></c:out></div>
                                            <div class="css-16 ">└──</div>
                                            <div class="css-17 " ><c:out value="${vo01.title }"></c:out></div>
                                            <div class="css-18 "><c:out value="${vo01.regId }"></c:out></div>
                                            <div class="css-19 "><c:out value="${vo01.regDt }"></c:out></div>
                                          </div>
                                      </li>
                                    </ul>
                                 </c:when>
                                 </c:choose>
                                </c:forEach>
                              </c:when>
                            </c:choose>
                            
                            
                          </c:forEach>
                       
        
                       
                      </c:when>
                      <c:otherwise>
                        <div>
                              No data found
                        </div>
                      </c:otherwise>
                    </c:choose>
              </div>
              



              <div id="questionButtonArea">
                <button class="css-Button" type="button" width="120" height="44"
                  radius="3" id="questionReg">문의하기</button>
              </div>
              
              <!-- hidden -->
              <div style="display: none;">
               <select class="form-control input-sm" name="pageSize" id="pageSize">
                  <c:forEach var="code" items="${PAGE_SIZE}">
                    <option value='<c:out value="${code.detCode }"/>'>
                      <c:out value="${code.detName }" />
                    </option>
                  </c:forEach>
                </select>
               </div>
               
<%--                <input type="hidden" id="gubun" value="${divValue}">
               <input type="hidden" id="seq" value="${vo.seq}">
               <input type="hidden" id="answerseq" value="${vo01.seq}">
               <input type="hidden" id="gubunQuestion" value="${vo.gubunQuestion}"> --%>



              <!-- ----------------------------------페이징  -->
              <div  style="display: none;">
                <div id="page-selection" class="text-center page"></div>
              </div>
              <!-- ----------------------------------페이징  끝-->

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>