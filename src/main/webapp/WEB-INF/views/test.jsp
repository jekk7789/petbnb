<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type=hidden id=hpage value=${page }>
<input type=hidden id=hlastpage value=${lastpage }>


<table>
<c:forEach var="data" items="${alList}">
	<tr>
		<td><input type="hidden" id=did value="${data.id}"></td>
		<td><a href="/pdetail?id=${data.id}">${data.name}</a></td>
		<td>${data.loadAddress}</td>
	</tr>
</c:forEach>
</table>
<button id=first>맨처음</button>
<button id=prev>이전</button>
<c:forEach var="num" items="${showpage}">
	<a href="/test?page=${num}&text=${text}">${num}&nbsp;</a>
</c:forEach>
<button id=next>다음</button>
<button id=last>마지막</button>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	if($('#hpage').val() ==1){
		$('#prev').hide()
	}
	if($('#hpage').val() ==$('#hlastpage').val()){
		$('#next').hide()
	}
})
.on('click','#prev',function(){
	let num=$('#hpage').val()
	let page=num-1
	location.href="/test?page="+page+"&text=${text}"
})
.on('click','#next',function(){
	let num=parseInt($('#hpage').val())
	let page=num+1
	console.log(page)
	location.href="/test?page="+page+"&text=${text}"
})
.on('click','#first',function(){
	let num=1
	location.href="/test?page="+num+"&text=${text}"
})
.on('click','#last',function(){
	let num=parseInt($('#hlastpage').val())
	location.href="/test?page="+num+"&text=${text}"
})
</script>
</html>