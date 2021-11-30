<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
<link rel="stylesheet" href="${path}/css/login.css">
</head>
<body>
<%
 String path =request.getContextPath() ; 
 session.setAttribute("path", path) ;
%>   


<div class="loginform">
        <h1>login</h1>
        <form name=f1 method="post" action="${path}/login.do">
        	<label>아이디</label>
            <input type="text" name="id" id="id" placeholder="ID"> <br>
            
            <div ><b>${msg }</b></div><br>
            
            <label>암호</label>
            <input type="password" name="pwd" id="pwd" placeholder="Password">
           
            <input type="submit" value="로그인">
        </form>
        <br>
        <form action="${path}/join.do">
        	<input type="submit" value="회원가입">
        </form>
    </div>
	<br><br><br><br>
</body>
</html>
<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   /> 