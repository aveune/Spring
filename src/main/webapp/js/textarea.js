$(function() {
      $('#content').keyup(function (e){
          var content = $(this).val();
          $(this).height(((content.split('\n').length + 1) * 4) + 'em');
          $('#counter').html(content.length + '/1000');
      });
      $('#content').keyup();
});










function ch1() {
  if (f1.title.value=="") {
	  alert("제목 필수 입력사항");
	  return false;
  }	
 }
 
 
 
 
function deleteBtn(){

	   if (alert("삭제 하시겠습니까??") == true){    //확인
			 } 
}

function ch1(){
	if (f1.rcontent.value==""){
		alert("댓글 내용 입력하세요.");
		return false;
	}
	return true;
	
}
