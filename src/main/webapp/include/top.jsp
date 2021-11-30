<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

 <c:set var="now" value="<%=new java.util.Date()%>" />
 <c:set var="sysDate" scope="request">
    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
 </c:set> 
   
<%
 String path =request.getContextPath() ; 
 session.setAttribute("path", path) ;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이번</title>

<link rel="stylesheet" href="${path}/css/top.css">
</head>

<body>
	<header><b>아이번 인벤</b></header>
	<nav>
	
		
		<ul>
		<li><a href="${path}/index.jsp">Home</a></li>
		<c:if test="${member != null}">
		<li><a href="${path}/user_list.do">회원 목록</a></li>
		</c:if>
		<c:if test="${member != null}">
		<li><a href="${path}/board.do">게시물 등록</a></li>
		</c:if>
		<li><a href="${path}/board_list.do">게시물 목록</a></li>
		
		<ul style="float:right; list-style-type:none;">
			<c:if test="${member !=null }"><li><a>${member.getId() }님</a> </li></c:if>
			<c:if test="${member != null}"><li><a href="${path}/logout.do">로그아웃</a></li></c:if>
			<c:if test="${member == null}"><li><a href="${path}/login/loginForm.jsp">로그인</a></li></c:if>
		</ul>
	</ul>
		
	</nav>