<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jjim</title>
<link href="css/store.css" rel="stylesheet">


</head>
<body>
<input type=hidden id=hid value=${email }>
<input type=hidden id=huserid value=${userid }>
<input type=hidden id=hdataid value=${dataid }>
<input type=hidden id=hid01 value=${id }>


<b>	내 찜 목록입니다</b>
<div>	
	<table id=tbljjim>
		<tr><th>이름</th><th>번호</th><th>주소</th></tr>
	</table>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	console.log($('#hid').val());
	console.log($('#huserid').val());
	console.log($('#hdataid').val());
	console.log($('#hid01').val());
	
	showjjim();
	
	
})

function showjjim(){
	$.ajax({
		type:"get",
		url:"/showjjim",
		data:{email:$('#hid').val()},
		dataType:"json",
		success:function(data){
			let str="";
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr><input type=hidden id=hDataId value="+ob['id']+"><td><a href='/page?id="+ob['id']+"'>"+ob['name']+"</a></td><td>"+ob['number']+"</td><td>"+ob['loadAddress']+"</td></tr>"
				
			}
			$('#tbljjim').append(str)
			
		}
		
	})
	
}
</script>
</html>