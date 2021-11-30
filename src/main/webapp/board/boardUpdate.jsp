<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
<link rel="stylesheet" href="${path}/css/btn.css">

<script>

function boardList(){
	   location.href="board_list.do"	

}

</script>
<script src="${path }/js/textarea.js">
</script>
 
 
<section>



<br><br>
<div align="center"><font size=5><b> 게시물 수정페이지 </b></font>
<br><br>
<form name=f1 action=boardUpdate.do onSubmit="return ch1()">
<input  type=hidden  name=bno   value="${m.bno}" > 
<input  type=hidden  name=id   value="${m.id}" > 
	<table>
		<tr><td  align=center>게시물번호 </td><td> <div>${m.bno}</div></td></tr>
		<tr><td  align=center>회원아이디 </td><td><div>${m.getId()}</div></td></tr>
		<tr><td  align=center>제목 </td><td><input type=text name=title id=title value="${m.getTitle() }" size=40></td></tr>
		<tr><td  align=center rowspan=2>내용 </td><td><textarea rows="5" cols="70" id="content" name=content maxlength="1000">${m.content }</textarea></td></tr>
		<tr><td><div class="wrap"><span id="counter">0/1000</span></div></td></tr>
		<tr><td  align=center>수정 날짜 </td><td><input type=text name=regdate value="${sysDate}"></td></tr>
		<tr><td colspan=2 align=center ><input type=button value="목록" onClick="boardList()"> &emsp;&emsp;
		<input  type=submit  value="수정"> &emsp;&emsp;</td></tr>
		
		
	</table>
	<br><br>
</form>

	






</div>
	

	</section>
	
	
	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   /> 