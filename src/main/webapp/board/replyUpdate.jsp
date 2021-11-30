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
	   location.href="replyInsert_ok.do?bno=${rep.bno}"	

}
function replyDelete(){
	
	
	location.href="replyDelete.do?rno=${rep.rno}&bno=${rep.bno}"	
}

</script>
<script src="${path }/js/textarea.js">




</script>
 
 
<section>



<br><br>
<div align="center"><font size=5><b> 댓글 수정페이지 </b></font>
<br><br>
<form name=f2 action=replyUpdate.do onSubmit="return ch2()">
	<input  type=hidden  name=rno   value="${rep.rno}" >
	<input  type=hidden  name=bno   value="${rep.bno}" >
	<table>
	
		<tr><td  align=center>아이디 </td><td><div>${rep.id }</div></td></tr>
		<tr><td  align=center rowspan=2>내용 </td><td><textarea rows="5" cols="70" id="content" name=rcontent maxlength="1000">${rep.getRcontent()}</textarea></td></tr>
		<tr><td><div class="wrap"><span id="counter"></span></div></td></tr>
		<tr><td  align=center>수정 날짜 </td><td><input type=text name=replydate value="${sysDate}"></td></tr>
		<tr><td colspan=2 align=center ><input type=button value="목록" onClick="boardList()"> &emsp;&emsp;
		<input  type=submit  value="수정" > &emsp;&emsp;
		<input type="button"  value="삭제"  onClick="replyDelete()" ></td></tr>
		
	</table>
	<br><br>
</form>

	






</div>
	

	</section>
	
	
	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   /> 