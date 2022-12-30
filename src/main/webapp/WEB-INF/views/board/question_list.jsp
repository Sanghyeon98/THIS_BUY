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
							<ul class="css-4 ">
								<li class="css-0 "><a class=" css-20 "
									href="${CP}/board/boardView.do?gubun=10">공지사항</a></li>
								<li class="css-0 "><a class=" css-20 "
                  href="${CP}/board/boardView.do?gubun=30">자주하는 질문</a></li>
                 <li class="css-0 "><a class=" css-20 "
                  href="${CP}/board/questionView.do?gubun=20">1:1 문의</a></li>
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