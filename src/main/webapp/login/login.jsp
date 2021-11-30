<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

 <c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   
<%
 String path =request.getContextPath() ; 
 session.setAttribute("path", path) ;
%>   
</head>
<body>


	<section>
		<br>
		<div id=sectionDiv1>
			<h3><b>아이번</b></h3>
			<h2><b>각종 공략 게시물 사이트에 오신걸 환영합니다</b></h2>
			
				<h2>${member.getId() } 님 환영합니다.</h2>
			
			<img src="${path}/img/i.jpg" width=500 height=300>
		</div>
		<br><br>
	</section>

</body>


<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   />   
</html>