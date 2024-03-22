<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jjim</title>
   <link rel="stylesheet" href="css/store.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


<style>
#data_write{
	display: none;
}
.cid{
	display: none;
}

tr, th, td{
	text-align:center; margin:auto;
	
}
div,table{
  text-align:center; margin:auto;
  border: 3px solid var(--locked-color);
  border-radius: 50px;

}
.pet01{
	width:45%;
	height:auto;
	transform: translate(57ch,50mm);
	position:relative;

}
</style>

</head>
<body>
<br>
<input type=hidden id=admin value=${admin } >
<input type=hidden id=hpage value=${page } >
<input type=hidden id=hlastpage value=${lastpage }>
<input type=hidden id=userid value=${email }>
<input type="hidden" id=loginid >
<div >
	<table style="height:50px">
		<tr ><th style="background-color:  #c1b6a4; height:150px; font-size:30px; color:#634522;">마이 리뷰 QNA 찜 목록입니다 <a href="/">홈으로</a></th></tr>
	
	</table>
</div>
<div >
	<table >
		<tr><th class="myjjim" id="myreview" style="cursor: pointer"><input type=hidden id=hreview value="1"><input type=hidden name=flag value=false>리뷰</th><th class="myjjim" id="myqna" style="cursor: pointer"><input type=hidden id=hqna value=2><input type=hidden name=flag value=false>QNA</th><th class="myjjim" id="myjjim" style="cursor: pointer"><input type=hidden id=hjjim value=3><input type=hidden name=flag value=false>찜목록</th></tr>
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
	

	<img src="image/pet01.jpg" class="pet01">
	
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

	let ndx = $(this).index();
	if(ndx==0){
		if($('#tblreview').is(':visible')) $('#tblreview').hide();
		else $('#tblreview').show();
  		$('#tblqna').hide();
  		$('#tbljjim').hide();
		
	} else if(ndx==1){
		$('#tblreview').hide();
  		if($('#tblqna').is(':visible')) $('#tblqna').hide();
  		else $('#tblqna').show();
  		$('#tbljjim').hide();
		
	}else if(ndx==2){
		$('#tblreview').hide();
  		$('#tblqna').hide();
  		if($('#tbljjim').is(':visible')) $('#tbljjim').hide();
  		else $('#tbljjim').show();
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
			str+="<tr class='brown'><td>제목</td><td>별점</td><td>작성자</td></tr>"
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr><input type=hidden id=reviewId value="+ob['id']+"><td><a href='/page?id="+ob['id']+"'>"+ob['content']+"</a></td><td>"+ob['rating']+"</td><td>"+ob['writer']+"</td></tr>"
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