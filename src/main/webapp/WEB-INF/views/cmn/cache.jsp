<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 프로젝트 이름
    String conPath = request.getContextPath();

    // HTTP 1.1 버전에서 지원하는 헤더로 이 값을 `'no-cache`로 지정하면 브라우저가 캐시를 하지 않는다.
    response.setHeader("Cache-Control", "no-cache");

    // 웹 브라우저가 응답 결과를 캐시하지 않음(이전 페이지/이후 페이지)
    response.setHeader("Cache-Control", "no-store");

    // HTTP 1.0 버전에서 지원하는 헤더로 이 값을 `'no-cache`로 지정하면 브라우저가 캐시를 하지 않는다.
    response.setHeader("Pragma", "no-cache");
    
    // HTTP 1.0 버전에서 현재 시간 이전으로 캐시하지 않음
    response.setHeader("Expires", "1L");

%>