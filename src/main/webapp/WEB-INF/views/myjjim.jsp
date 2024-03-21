<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jjim</title>
<link href="css/store.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
<style>
#data_write{
	display: none;
}
.cid{
	display: none;
}
</style>

</head>
<body>
<input type=hidden id=admin value=${admin } >
<input type=hidden id=hpage value=${page } >
<input type=hidden id=hlastpage value=${lastpage }>
<input type=hidden id=userid value=${email }>
<input type="hidden" id=loginid >

<div>
	<table >
		<tr><th class="myjjim" id="myreview" style="cursor: pointer"><input type=hidden id=hreview value="1">리뷰</th><th class="myjjim" id="myqna" style="cursor: pointer"><input type=hidden id=hqna value=2>QNA</th><th class="myjjim" id="myjjim" style="cursor: pointer"><input type=hidden id=hjjim value=3>찜목록</th></tr>
	</table>
	<div>
			<table class="my_List" id=tblreview></table>
	</div>
	<div>	
			<table  class="my_List"  id=tblqna></table>
	</div>
	<div>
			<table  class="my_List"  id=tbljjim></table>
	</div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	
//이메일 쪼개기 writer 로 통일해서 review,qna,찜 목록 불러오기	
   let userid=$('#userid').val();
   console.log(userid)
   let logid=userid.split("@");
   console.log(logid)
   $('#loginid').val(logid[0]);
	showreview();
	showqna();
	showjjim();
	$('#tblreview').hide();
	$('#tblqna').hide();
	$('#tbljjim').hide();
})

.on('click', '.myjjim', function() {
	let data = $(this).find('input').val();
	if(data=='1'){
  		$('#tblreview').show();
  		$('#tblqna').hide();
  		$('#tbljjim').hide();
  	}else if(data=='2'){
  		$('#tblqna').show();
  		$('#tblreview').hide();
  		$('#tbljjim').hide();
  	}else if(data=='3'){
  		$('#tblreview').hide();
  		$('#tbljjim').show();
  		$('#tblqna').hide();
  	} else{
  		alert('실패')
  		return
  	}

})

function showjjim(){
	$('#tbljjim').empty();
	$.ajax({
		type:"get",
		url:"/myList",
		data:{userid:$('#userid').val(),data:$('#hjjim').val()},
		dataType:"json",
		success:function(data){
			let str="";
			str+="<tr><td>이름</td><td>전화번호</td><td>주소</td></tr>"
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr class='brown'><input type=hidden id=jjimId value="+ob['id']+"><td><a href='/page?id="+ob['id']+"'>"+ob['name']+"</a></td><td>"+ob['number']+"</td><td>"+ob['loadAddress']+"</td></tr>"
			}
			$('#tbljjim').append(str)
		}
	})
}

function showreview(){
	$('#tblreview').empty();
	console.log("!");
	$.ajax({
		type:"get",
		url:"/myList",
		data:{userid:$('#userid').val(),data:$('#hreview').val()},
		dataType:"json",
		success:function(data){
			let str="";
			str+="<tr class='brown'><td>제목</td><td>내용</td><td>작성자</td></tr>"
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr><input type=hidden id=reviewId value="+ob['id']+"><td><a href='/page?id="+ob['id']+"'>"+ob['content']+"</a></td><td>"+ob['writer']+"</td><td>"+ob['rating']+"</td></tr>"
			}
			$('#tblreview').append(str)
		}
	})
}

function showqna(){
	$('#tblqna').empty();
	console.log("!");
	$.ajax({
		type:"get",
		url:"/myList",
		data:{userid:$('#userid').val(),data:$('#hqna').val()},
		dataType:"json",
		success:function(data){
			let str="";
			str+="<tr class='brown'><td>제목</td><td>내용</td><td>작성자</td></tr>"
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr><input type=hidden id=qnaId value="+ob['id']+"><td><a href='/Qna'>"+ob['title']+"</a></td><td>"+ob['content']+"</td><td>"+ob['writer']+"</td></tr>"
			}
			$('#tblqna').append(str)
		}
	})
}


</script>
</html>