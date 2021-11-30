<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
     
	<section>
		<div align="center">
		<br>
		<h2>회원 목록<br></h2>
		회원 수 : ${tc}  &emsp;
		전체페이지수:${totalPage}  &emsp;
		 현재페이지:${nowPage} &emsp; <br><br>
		<table id="table1">
			<tr align="center">
				<td>회원번호</td>
				<td>아이디</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>주소</td>
				<td>가입날짜</td>


			</tr>
			
			<c:forEach  var="m" items="${li}" >
			<c:set var="strDate">
			   ${m.getJoindate()}
			</c:set>
			<tr>
				<td align="center">
				<c:if test="${member != null  }">
				  <a href="${path}/userContent.do?custno=${m.getCustno()}">${m.getCustno()}</a></c:if>
				  	<c:if test="${member == null }">${m.getCustno()}</c:if>
				</td>
				<td align="center">${m.getId()}</td>
				<td align="center">${m.getTel()}</td>
				<td align="center">${m.getEmail()}</td>
				<td align="center" style="max-width:100px; overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${m.getAddress()}</td>
				<td align="center">${fn:substring(strDate,0,10)}</td>
			

			</tr>
			</c:forEach>	
		</table>
		<br><br>
		
		
		<c:url  value="/user_list.do"  var ="url">
        <c:param name="startIdx" value="1" ></c:param>
        <c:param name="ch1"  value="${ch1}" ></c:param>
        <c:param name="ch2"  value="${ch2}" ></c:param>
        </c:url>
        <a href="${url}">처음 페이지</a> &emsp;
				
		
		<c:if test="${startIdx > pageSize * pageListSize  }">
		  <c:url  value="/user_list.do"  var ="url">
          <c:param name="startIdx" value="${(listStratPage - pageListSize ) * pageSize - pageSize + 1}" ></c:param>
          <c:param name="ch1"  value="${ch1}" ></c:param>
          <c:param name="ch2"  value="${ch2}" ></c:param>
          </c:url>
          <a href="${url}">이전10페이지</a> &emsp;
		</c:if>
	
		<c:if test="${nowPage <= 10 }">
		이전10페이지
		</c:if>
		
		&emsp;
		<c:forEach var="i" begin="${listStratPage}" end="${listEndPage}" >
		  <c:if test="${i<=totalPage}">
		    <c:url  value="/user_list.do"  var ="url">
            <c:param name="startIdx" value="${(i-1)*pageSize + 1}" ></c:param>
            <c:param name="ch1"  value="${ch1}" ></c:param>
            <c:param name="ch2"  value="${ch2}" ></c:param>
            </c:url>
            <a href="${url}">[${i}]</a>  
		  </c:if>
		</c:forEach>
		
		&emsp;
		<c:if test="${ listEndPage < totalPage }">
		    <c:url  value="/user_list.do"  var ="url">
            <c:param name="startIdx" value="${pageSize * listEndPage + 1}" ></c:param>
            <c:param name="ch1"  value="${ch1}" ></c:param>
            <c:param name="ch2"  value="${ch2}" ></c:param>
            </c:url>
            <a href="${url}">다음10페이지</a> &emsp;
		
      	</c:if>
      	
      	<c:if test="${listEndPage >= totalPage}">
      	  다음10페이지	&emsp;
      	</c:if>
      
        <c:url  value="/user_list.do"  var ="url">
        <c:param name="startIdx" value="${endPage}" ></c:param>
        <c:param name="ch1"  value="${ch1}" ></c:param>
        <c:param name="ch2"  value="${ch2}" ></c:param>
        </c:url>
        <a href="${url}">마지막페이지</a> &emsp;
        
      <br><br>
		
		
		
        <form  action="${path}/user_list.do">
          <select name=ch1>
            <option value="id">아이디</option>
            <option value="custno">회원번호</option>          
          </select>
          <input  type=text   name=ch2>
          <input  type=submit  value="검색하기">
        </form>
        <br><br>

	</div>
	</section>

	<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   />   
