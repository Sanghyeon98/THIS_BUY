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
<%
	//공지사항(10)/자유게시판 구분(20)
String divValue = request.getParameter("gubun");
String title = "";
String gubun1 = "";
String gubun2 = "";
if ("30".equals(divValue)) {
	title = "자주하는질문";
	gubun1 = "작성일";
	gubun2 = "답변상태";

} else {
	title = "공지사항";
	gubun1 = "작성자";
	gubun2 = "작성일";
}

request.setAttribute("title", title);
request.setAttribute("gubun1", gubun1);
request.setAttribute("gubun2", gubun2);
request.setAttribute("divValue", divValue);
%>
<%

/* 게시물 제목을 클릭했을때 내용을 불러오기위한 게시물번호 입니다. */
String seq = request.getParameter("seq");
int faq_no = (seq == null)? -1 : Integer.parseInt(seq);
%>
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
						initTableView();
			/* 			answerboard(); */
						
						//=================================================paging
					    renderingPage('${pageTotal}',1)
		


//-------------------------------- 한건조회 (상세조회) 테이블 클릭 
			
	//테이블 클릭
						$("#boardTable>div").on("click","ul",function(e) {
											console.log('boardTable');
											let divArray = $(this).find("li>div");
											let boardSeq = divArray.eq(0).text();

											console.log('boardSeq:' + boardSeq);
											console.log('boardTable');

											 if ("10" == $("#gubun").val()) {
													if (confirm("상세 조회를 하시겠습니까?") == false)
														return;
													//div,seq
													window.location.href = "${CP}/board/doSelectOne.do?gubun=10&seq="
															+ boardSeq;
	
													console.log("boardSeq: "+ boardSeq);

											} else if ("30" == $("#gubun").val()) {
					
												//$(this).next("ul.css-14");
						                          console.log("999:"+$(this).next("ul.css-14").html());
						                          
						                          let subMenu = $(this).next("ul.css-14");
						                              console.log(subMenu.is(":visible"));
						                              if(subMenu.is(":visible")){
						                                 subMenu.toggle("hide");
						                              }else{
						                                 subMenu.toggle();
						                              }
							             
							        }
								});

//-------------------------------- 한건조회 (상세조회) 테이블 클릭  끝

						//등록화면으로 이동
						$("#boardReg").on("click", function() {

							console.log('boardReg');
							console.log('gubun:'+$("#gubun").val())

							window.location.href = "${CP}/board/boardReg.do?gubun="+$("#gubun").val();

							//moveToReg
						});

						//등록화면으로 이동
						$("#questionReg").on("click", function() {

							console.log('moveToReg');

							window.location.href = "${CP}/board/questionReg.do"

							//moveToReg
						});

						/*    const gubun = $("#gubun").value();
						   if(gubun == 10){
						      $("#questionButtonArea").hide();
						   }else{
						      $("#insertButtonArea").hide();
						   }
						 */

						

					}); //document

	function initTableView() {
		if ("10" == $("#gubun").val()) {
			$("#questionButtonArea").css("display", "none");
			$("#insertButtonArea").css("display", "");
		} else if ("20" == $("#gubun").val()) {
			$("#questionButtonArea").css("display", "");
			$("#insertButtonArea").css("display", "none");
		}
	}

	/* 	function initAnswerView() {
	 if ("1" == $("#answerCheck").val()) {
	 $("#answerTable").css("display", "");
	 } else if ("0" == $("#gubun").val()) {
	 $("#answerTable").css("display", "none");
	 }
	 }  */

	function doRetrieve(page) {
		console.log('doRetrieve() page:' + page);
		let method = "GET";
		let url = "/board/doRetrieve.do";
		let async = true;

		//전체
		let searchDivValue = $('#searchDiv').val();

		if ('ALL' == searchDivValue) {
			searchDivValue = "";
		}

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

								if ("10" == $("#gubun").val()) {
									$
											.each(
													parsedJson,
													function(index, value) {

														htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
														htmlData += "    <div style='display: none;'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.num'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regId'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>+ "</div>";
														htmlData += "</ul>";
													});

								} else if ("20" == $("#gubun").val()) {
									$
											.each(
													parsedJson,
													function(index, value) {

														htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
														htmlData += "    <div style='display: none;'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.num'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>	+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.answerCheck'/>+ "</div>";
														htmlData += "</ul>";
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
			doRetrieve(num);
		});
	}
</script>

</head>

<body>
	<input type="hidden" id="gubun" value="${divValue}">

	<div id="__next" data-reactroot="">
		<div>
			<div>
				<div>
					<div class="css-1 ">
						<div class="css-2 ">
							<div class="css-3 ">고객센터</div>
							<ul class="css-4 ">
								<li class="css-0 "><a class=" css-20 "href="${CP}/board/boardView.do?gubun=10">공지사항</a></li>
								<li class="css-0 "><a class=" css-20 " href="${CP}/board/boardView.do?gubun=30">자주하는 질문</a></li>
								<li class="css-0 "><a class=" css-20 "href="${CP}/board/questionView.do?gubun=20">1:1 문의</a></li>
							</ul>
						</div>


						<div class="css-5 ">
							<div class="css-6 ">
								<div class="css-7 ">
									<h2 class="css-8 ">${title}</h2>
								</div>
							</div>
							<div class="css-10">
								<div width="50" class="css-11">번호</div>
								<div class="css-12 ">제목</div>
								<div width="100" class="css-13">작성자</div>
								<div width="100" class="css-13 ">작성일</div>
								<div style="display: none;">SEQ</div>
							</div>

							<div id="boardTable">

							<c:choose>
									<c:when test="${list.size()>0 }">
										<c:forEach var="vo" items="${list }">
											<c:choose>
												<c:when test="${vo.gubun == 10 }">
												 <div>
													<ul class="css-14 ">
														<li class="css-15"><!-- <a href="#"> -->
																	<!-- 공지사항  -->
																	<div style="display: none;"><c:out value="${vo.seq }"></c:out></div>
																	<div class="css-16"><c:out value="${vo.num }"></c:out></div>
																	<div class="css-17 "><c:out value="${vo.title }"></c:out></div>
																	<div class="css-18 ">관리자</div>
																	<div class="css-19 "><c:out value="${vo.regDt }"></c:out></div>
														<!-- </a> -->
														</li>
													 </ul>
													</div>
												</c:when>
												<c:otherwise>
												<%-- 	<a  href="#"   value="${vo.seq }"> --%>
												<div>
														<ul class="css-14 ">
															<li class="css-15">
																		<!-- 1:1문의  -->
																		<div style="display: none;"><c:out value="${vo.seq }"></c:out></div>
																		<div class="css-16 " ><c:out value="${vo.num }"></c:out></div>
																		<div class="css-17 " ><c:out value="${vo.title }"></c:out></div>
																		<div class="css-18 ">관리자</div>
																		<div class="css-19 "><c:out value="${vo.regDt }"></c:out></div>
															</li>
													</ul>	
													<ul class="css-14 css-answer1">
                           <li  id="${vo.seq }" value="${vo.seq }" >
                             <div class="css-answer3">&nbsp;&nbsp;&nbsp;<c:out value="${vo.title }"></c:out></div>
                
                             <div class="css-answer7 ">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${vo.contents }"></c:out></div>
                           </li> </ul>
												</div>									
						        </c:otherwise>
											</c:choose>
										</c:forEach>
		
									</c:when>
									<c:otherwise>
										<div>
											<div>No data found</div>
										</div>
									</c:otherwise>
								</c:choose> 

							</div>



							<div id="insertButtonArea">
								<button class="css-Button" type="button" width="120" height="44"
									radius="3" id="boardReg">등록</button>
							</div>

						<!-- 	<div id="questionButtonArea">
								<button class="css-Button" type="button" width="120" height="44"
									radius="3" id="questionReg">등록</button>
							</div> -->

<div id="answerTable">
 <div></div>
</div>



							<!-- ----------------------------------페이징  -->
							<div class="text-center col-sm-12 col-dm-12 col-lg-12">
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