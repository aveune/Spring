<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

 <c:import url="/include/top.jsp"   charEncoding="utf-8"   />   
<link rel="stylesheet" href="${path}/css/login.css">


<script type="text/javascript">

function ch1() {
	
	  if (f1.pwd.value=="") {
		  alert("회원암호는 필수 입력사항!");
		  return false;
	  }
		
	}

function idCheck(){
	
	var id = $("#id").val();
	var path = '${path}';
	
	if(f1.id.value==""){
		alert("회원아이디 입력하세요.");
		return false;
	}
	
	$.ajax({
		url : path + "/idCheck.do",
		type : "post",
		data : {id:id},
		success : function(data){
			console.log(data);
			console.log("Success");
			if(data==0){
				alert("사용할 수 있는 ID입니다.");
			}else{
				alert("사용할 수 없는 ID입니다.");			
			}
		}
		
	});
}


</script>





</head>
<body>



<div class="loginform">
        <h1>login</h1>
        <form action = "userinsert.do" name=f1 onSubmit="return ch1()" >
        	
        	
        	
        	<label>회원번호</label>
            <input type="text" name="custno" id="custno" placeholder="ID" value="${custno}"><br>
        
        	<label>아이디</label>
            <input type="text" name="id" id="id" placeholder="ID">
            <input type="button" value="중복확인"  onClick="idCheck()"><br>
            <label>암호</label>
            <input type="password" name="pwd" id="pwd" placeholder="Password"><br>
             <label>전화번호</label>
            <input type="text" name="tel" id="tel" placeholder="전화번호"><br>
             <label>이메일</label>
            <input type="text" name="email" id="email" placeholder="이메일"><br>
            <label>주소</label>
           	<input type="text" id="sample6_postcode" name="address" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name="address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" name="address" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress"name="address" placeholder="참고항목"><br>
           
            <label>등록일자</label>
            <input type="text" name="joindate" id="joindate" value="${sysDate}"><br>
           
        	<input type="submit" value="회원가입">
        </form>
    </div>
	<br><br><br><br>
</body>
</html>
<c:import url="/include/bottom.jsp"   charEncoding="utf-8"   /> 


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
