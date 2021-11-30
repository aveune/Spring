<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <link rel="stylesheet" href="${path}/css/btn.css">

<c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
 
 <%
 String path =request.getContextPath() ; 
 session.setAttribute("path", path) ;
%>    
<script src="${path }/js/textarea.js">



</script>
 
<section>



<br><br>
<div align="center"><font size=5><b> 게시물 등록 </b></font>
<br><br>
<form name=f1 action="boardInsert.do"  onSubmit="return ch1()">
<table>
<tr><td  align=center>게시물번호(자동발생) </td><td> <input  type=text  name=bno   value="${bno}" size=10 > </td></tr>
<tr><td  align=center>회원아이디 </td><td> <input  type=text  name=id size=10 value="${member.getId()}"></td></tr>
<tr><td  align=center>제목</td><td><input  type=text  name=title size=20></td></tr>
<tr><td  align=center rowspan=2>내용 </td><td><textarea rows="5" cols="70" id="content" name=content maxlength="1000"></textarea></td></tr>
<tr><td><div class="wrap"><span id="counter"></span>
</div></td></tr>
<tr><td  align=center>가입일자 </td><td><input  type=text  name=regdate  value="${sysDate}" size=10></td></tr>
<tr><td colspan=2  align=center><input  type=submit  value="등록">
</table>
</form>
<br><br>
</div>
	

	</section>

	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   />   
