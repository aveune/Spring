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


function btndelete(){
	   location.href="userDelete.do?id=${m.id}"	

}



</script>


<br><br>
<div align="center"><font size=5><b> 회원 정보 </b></font>
<br><br>
<form name=f1 action=userUpdate.do  onSubmit="return ch1()">
<input  type=hidden  name=custno   value="${m.custno}" > 
<input  type=hidden  name=id   value="${m.id}" > 
	<table>
		<tr><td  align=center>회원아이디 </td><td> <input  type=text  name=id size=10 value="${m.id}" readonly></td></tr>
		<tr><td  align=center>회원전화 </td><td><input  type=text  name=tel size=20 value="${m.tel}"></td></tr>
		<tr><td  align=center>회원이메일 </td><td><input  type=text  name=email size=20 value="${m.email}"></td></tr>
		<tr><td  align=center>회원주소 </td><td><input  type=text  name=address size=80 value="${m.address}"></td></tr>
		<c:set var="strDate">
			   ${m.getJoindate()}
			   
			</c:set>
		<tr><td  align=center>가입일자 </td><td><input  type=text  name=joindate  value="${fn:substring(strDate,0,10)}" size=10 readonly></td></tr>
		<tr><td colspan=2  align=center>
		<input type=submit value="목록">
		
		<c:if test="${member.getId() == m.getId() }">
		&emsp;&emsp;<input  type=submit  value="수정"> &emsp;&emsp;
		
		<input  type=button   value="삭제"  onClick="btndelete()">
		</c:if></td></tr>
	</table>
</form>
</div>
	

	</section>

	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   />   
