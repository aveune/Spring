<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
<link rel="stylesheet" href="${path}/css/btn.css">
<section>
<script>

function replyUpdate(rno){
	$('#rno').val(rno);
	$('#updateFrm').submit();
	
}

function boardUpdatePage(){
	   location.href="boardUpdatePage.do?id=${m.id}&bno=${m.bno}"	
}


function boardDelete(){
	   location.href="boardDelete.do?bno=${m.bno}"	
}


function ch2(){
	  if (f3.content.value=="") {
		  alert("댓늘 내용 필수 입력사항");
		  return false;
	  }	
		
	
}


</script>
<script src="${path }/js/textarea.js">



</script>
 


<br><br>
<div align="center"><font size=5><b> 게시물 정보 </b></font>
<br><br>
<form name=f1 action=board_list.do  onSubmit="return ch1()">

	<table>
		<tr><td  align=center>게시물번호 </td><td> <div>${m.bno}</div></td></tr>
		<tr><td  align=center>회원아이디 </td><td><div>${m.id}</div></td></tr>
		<tr><td  align=center>제목 </td><td><div>${m.title}</div></td></tr>
		<tr><td  align=center>내용 </td><td><div>${m.content}</div></td></tr>
		<c:set var="strDate">${m.getRegdate()}</c:set>
		<tr><td  align=center>작성날짜 </td><td><div>${fn:substring(strDate,0,10)}</div></td></tr>
		<tr><td colspan=2 align=center ><input type=submit value="목록"> &emsp;&emsp;
		<c:if test="${member.getId() == m.getId() }">
		<input  type=button  value="수정" onClick="boardUpdatePage()"> &emsp;&emsp;
		<input  type=button   value="삭제"  onClick="boardDelete()">
		</c:if></td></tr>
		
	</table>
	
</form>

	<c:if test="${member !=null }">
	<div align="center"><font size=5><b> 댓글 등록 </b></font></div><br>
	<form name=f3 action="replyInsert.do"  onSubmit="return ch2()">
	<input  type=hidden  name=bno   value="${m.bno}" >
	<table>
	<tr><td  align=center>아이디 </td><td> <input  type=text  name=id size=10 value="${member.getId()}"></td></tr>
	<tr><td  align=center rowspan=2>내용 </td><td><textarea rows="10" cols="70" id="content" name=rcontent maxlength="1000"></textarea></td></tr>
	<tr><td><div class="wrap"><span id="counter"></span>
	</div></td></tr>
	<tr><td  align=center>댓글날짜 </td><td><input  type=text  name=replydate  value="${sysDate}" size=10></td></tr>
	<tr><td colspan=2  align=center><input  type=submit  value="등록">
	</table>
	</form>
	</c:if>
	
	<div align="center"><font size=5><b> 댓글 목록 </b></font></div><br>
	<form id="updateFrm" action="replyUpdatePage.do">
	<input type="hidden" name=rno id=rno value="${rep.rno }"/>
	<table>
			<tr align="center"> 
				<td>아이디</td>
				<td>날짜</td>
				<td>내용</td>
				<td></td>
			</tr>
			
			<c:forEach  var="rep" items="${li}" >
			<c:set var="strDate">
			   ${rep.getReplydate()}
			</c:set>
			<c:set var="bno">
			   ${rep.bno}
			</c:set>
			<tr>
				<td align="center">${rep.getId()}</td>
				<td align="center">${fn:substring(strDate,0,10)}</td>
				<td align="center">${rep.getRcontent()}</td>
				<c:choose>
				<c:when test="${member.getId()==rep.getId() }">
				<td>
				<input type="button"  value="수정" onclick="javascript:replyUpdate(${rep.rno})">
				
				</td>
				</c:when>
				
				<c:otherwise>
					<td></td>
				</c:otherwise>
				</c:choose>
				
			</tr>
			</c:forEach>
	</table>
	</form>
	<br><br>
</div>
	

	</section>
	
	
	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   /> 