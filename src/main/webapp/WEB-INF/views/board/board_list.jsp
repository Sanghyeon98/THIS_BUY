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
if ("20".equals(divValue)) {
	title = "1:1문의";
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
<c:set var="CP" value="${pageContext.request.contextPath}" />
<!-- ContextPath -->
<c:set var="RES" value="/resources" />
<c:set var="CP_RES" value="${CP}${RES}" />

<%@ include file="/WEB-INF/views/cmn/cache.jsp"%>
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

:root { -
	-swiper-theme-color: #007aff;
}

html, button, input, select, textarea {
	font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum,
		sans-serif;
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

.css-9 {
	padding-left: 11px;
	font-size: 14px;
	letter-spacing: -0.3px;
	color: rgb(153, 153, 153);
	line-height: 20px;
}

.css-10 {
	display: flex;
	width: 100%;
	padding: 20px 0px;
	border-bottom: 1px solid rgb(51, 51, 51);
	border-top: 2px solid rgb(51, 51, 51);
}

.css-11 {
	flex-basis: 50px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-12 {
	-webkit-box-flex: 1;
	flex-grow: 1;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-13 {
	flex-basis: 100px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-13 {
	flex-basis: 100px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-14 {
	display: flex;
	flex-direction: column;
}

.css-15 {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid rgb(244, 244, 244);
}

.css-16 {
	text-align: center;
	padding: 20px 0px;
	color: rgb(76, 76, 76);
	flex-basis: 50px;
}

.css-17 {
	padding: 20px 0px 20px 20px;
	color: rgb(76, 76, 76);
	flex: 1 1 0%;
	text-align: left;
}

.css-18 {
	text-align: center;
	padding: 20px 0px;
	color: rgb(76, 76, 76);
	flex-basis: 100px;
}

.css-19 {
	text-align: center;
	padding: 20px 0px;
	flex-basis: 100px;
	color: rgb(153, 153, 153);
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

.css-Button {
	display: block;
	padding: 0px 10px;
	text-align: center;
	overflow: hidden;
	width: 120px;
	height: 44px;
	border-radius: 3px;
	color: black;
	background-color: #b8c9df;
	border: 0px none;
}
</style>

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
						doRetreive();
						initAnswerView
						/* 						doSelectOnee(); */

						//paging
						renderingPage('${pageTotal}', 1);

						//테이블 클릭
						$("#boardTable").on("click",".cli",function(e) {
											console.log('boardTable');
											let divArray = $(this).children();
											let boardSeq = divArray.eq(0).text();

											console.log('boardSeq:' + boardSeq);
											console.log('boardTable');

											if (confirm("상세 조회를 하시겠습니까?") == false)
												return;
											//div,seql
											window.location.href = "${CP}/board/boardMod.do?seq="+boardSeq;

											//#boardTable>tbody
										});

						//등록화면으로 이동
						$("#boardReg").on("click", function() {

							console.log('moveTomoveToRegBoardReg');

							window.location.href = "${CP}/board/boardReg.do"

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

						//답변 등록
						$("#doInsertButton").on("click",function(e) {
											console.log("doInsertBtn");
											e.preventDefault();

											if (eUtil.ISEmpty($("#answer")
													.val()) == true) {
												alert("내용을 입력하세요");
												$("#answer").focus();
												return;
											}

											console.log($("#answer").val());

											if (confirm("등록 하시겠습니까?") == false)
												return;

											let url = "answer/doInsert.do";
											let parameters = {

												"seq" : $("#seq")
														.val(),
												"aUser" : $("#regId").val(),
												"contents" : $("#answer").val()
											};

											let method = "GET";
											let async = true;

											EClass.callAjax(url,parameters,method,async,function(data) {
																console.log("data msgContents:"
																				+ data.msgContents);

																if ("1" == data.msgId) {//등록 성공
																	alert(data.msgContents);
																	doSelectOnee();
																	$("#answer").val('');
																} else { //등록 실패
																	alert(data.msgId
																			+ "\n"
																			+ data.msgContents);
																}

															});

										});

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
					
	function initAnswerView() {
	    if ("1" == $("#answerCheck").val()) {
	      $("#answerTable").css("display", "");
	    } else if ("0" == $("#gubun").val()) {
	    	$("#answerTable").css("display", "none");
	    }
	  }

	function doRetreive(page) {
		console.log('doRetrive() page:' + page);
		let method = "GET";
		let url = "/board/doRetreive.do";
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

		PClass
				.callAjax(
						method,
						url,
						async,
						params,
						function(data) {
							console.log(data);
							let parsedJson = JSON.parse(data);

							let htmlData = "";

							//기존 데이터 삭제
							$("#boardTable").empty();

							let totalCnt = 0;//총글수  
							let pageTotal = 0;//총페이지수

							if (null != parsedJson && parsedJson.length > 0) {

								totalCnt = parsedJson[0].totalCnt;
								pageTotal = Math.ceil(totalCnt
										/ $("#pageSize").val());
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
														htmlData += "    <div class='css-15'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regId'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>+ "</div>";
														htmlData += "</ul>";});

								} else if ("20" == $("#gubun").val()) {
									$.each(
													parsedJson,
													function(index, value) {

														htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>+ "</div>";
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

		//문의에 대한 답변 데이터 
	 function doSelectOnee() {
	 $
	 .ajax({
	 type : "GET",
	 url : "/board/selectOne.do", 
	 asyn : "true",
	 dataType : "html",
	 data : {
	 "seq" : $("#seq").val()
	 },

	 success : function(data) {//통신 성공
	 console.log("success data:" + data);

	 var parseData = JSON.parse(data);

	 $("#answerList").empty();
	 //$("#answerForm").empty();
	 var html = "";

	 if (parseData.length > 0) {

	 $
	 .each(
	 parseData,
	 function(i, value) {
	 console.log(i + ","
	 + value.name);

	 //---------------------------------------------------------------------------------------------
	 htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
     htmlData += "    <div class='css-15'"+ <c:out value='value.answerNO'/>+ "</div>";
     htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
     htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>+ "</div>";
     htmlData += "</ul>";

	 });

	 } else { //data가 없는 경우
	 //$("#answerForm").append(htmL);
	 html += "<tr>";
	 html += "  등록된 답변이 없습니다.";
	 html += "</tr>";
	 }

	 //데이터 추가
	 $("#answerTable").append(html);

	 },
	 error : function(data) {//실패시 처리
	 console.log("error:" + data);
	 },
	 complete : function(data) {//성공/실패와 관계없이 수행!
	 console.log("complete:" + data);
	 }
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
			doRetrive(num);
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
								<li class="css-0 "><a class=" css-20 "
									href="${CP}/board/boardView.do?gubun=10">공지사항</a></li>
								<li class="css-0 "><a class=" css-20 "
									href="${CP}/board/boardView.do?gubun=20">1:1 문의</a></li>
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
								<div width="100" class="css-13">${gubun1}</div>
								<div width="100" class="css-13 ">${gubun2}</div>
							</div>

							<div id="boardTable">
								<c:choose>
									<c:when test="${list.size()>0 }">
										<c:forEach var="vo" items="${list }">
											<c:choose>
												<c:when test="${vo.gubun == 10 }">
													<ul class="css-14 ">
														<li><a href="#">
																<div class="css-15 cli">
																	<!-- 공지사항  -->
																	<div class="css-16 "><c:out value="${vo.seq }"></c:out></div>
																	<div class="css-17 ">
																		<c:out value="${vo.title }"></c:out>
																	</div>
																	<div class="css-18 ">
																		<c:out value="${vo.regId }"></c:out>
																	</div>
																	<div class="css-19 ">
																		<c:out value="${vo.regDt }"></c:out>
																	</div>
																</div>
														</a></li>
													</ul>
												</c:when>
												<c:otherwise>
													<ul class="css-14 ">
														<li><a href="#">
																<div class="css-15">
																	<!-- 1:1문의  -->
																	<div class="css-16 ">
																		<c:out value="${vo.seq }"></c:out>
																	</div>
																	<div class="css-17 ">
																		<c:out value="${vo.title }"></c:out>
																	</div>
																	<div class="css-18 ">
																		<c:out value="${vo.regDt }"></c:out>
																	</div>
																	<div class="css-19 ">
																		<c:out value="${vo.answerCheck }"></c:out>
																	</div>
																</div>
														</a></li>
													</ul>
													
													<ul class="css-14 " id ="answerTable">
                            <li><a href="#">
                                <div class="css-15" >
                                  <!-- 1:1문의  -->
                                  <div class="css-16 ">
                                    <c:out value="${vo.seq }"></c:out>
                                  </div>
                                  <div class="css-17 ">
                                    <c:out value="${vo.title }"></c:out>
                                  </div>
                                  <div class="css-18 ">
                                    <c:out value="${vo.regDt }"></c:out>
                                  </div>
                                </div>
                            </a></li>
                          </ul>
													
													<!-- answer -->
													<input type="hidden" name="seq" id="seq" value="${seq }" />
													<input type="hidden" name="regId" id="regId"
														value="${sessionScope.member.uId}" />
													<!-- 로그인시 나중에  -->

													<!--- Form Begins -->
													<section class="card" id="answerForm">

														<div class="card-header"></div>
														<div class="card-body">
															<div class="tab-content">
																<div class="form-group">
																	<textarea class="form-control" id="answer" rows="7"
																		placeholder="문의에 대한 답변을 달아주세요"></textarea>
																</div>
															</div>
															<div class="text-right">
																<button type="button" class="btn btn-primary"
																	id="doInsertButton">답변등록</button>
															</div>
														</div>
													</section>
													<!--- Form Ends -->


													<!--contents begins -->
													<div class="answer-contents">
														<section class="card mt-4">
															<div id="answerList" class="border p-2"></div>
														</section>
													</div>
													<!--contents  end -->
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

							<div id="questionButtonArea">
								<button class="css-Button" type="button" width="120" height="44"
									radius="3" id="questionReg">문의하기</button>
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