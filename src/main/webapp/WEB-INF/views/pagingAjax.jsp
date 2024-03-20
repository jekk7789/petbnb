<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petbnb</title>
<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
</head>
<body>
<input type=hidden id=text value=${text }>
<input type=hidden id=hpage value=${page }>
<input type=hidden id=hlastpage value=${lastpage }>
<table id=list>
</table>

<table id=showpage>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	showList()
	showpage()
})

.on('click','#pagenum',function(){
	let a=$(this).text()
	a=a.replace(/(\s*)/g, "")
	$('#hpage').val(a)
	console.log($('#hpage').val()+'s')
	showList()
	showpage()
})
.on('click','#prev',function(){
	let num=$('#hpage').val()-1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#next',function(){
	let num=parseInt($('#hpage').val())+1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#first',function(){
	let num=1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#last',function(){
	let num=parseInt($('#hlastpage').val())
	$('#hpage').val(num)
	showList()
	showpage()
})
function showList(){
	$.ajax({
		type:'get',
		url:'/testajax',
		data:{text:$('#text').val(),page:$('#hpage').val()},
		dataType:'json',
		success:function(data){
			$('#list').empty()
			
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				let str='<tr>'
				str+='<td><input type=hidden id=hid value='+ob['id']+'>'+ob['name']+'</td><td>'+ob['loadAddress']+'</td>'
				str+='</tr>'
				$('#list').append(str)
			}
		}
	})
}
function showpage(){
	$.ajax({
		type:'get',
		url:'/showpage',
		data:{text:$('#text').val(),page:$('#hpage').val()},
		dataType:'text',
		success:function(data){
			$('#showpage').empty()
			console.log(data)
			let b=data.slice(1,-1)
			b=b.replace(/(\s*)/g, "")
			console.log(b)
			let a=b.split(',')
			console.log(a)
			let str='<tr><td><button id=first>맨처음</button><button id=prev>이전</button>'
			for(let i=0;i<a.length;i++){
				str+='<a href="#" id=pagenum value='+a[i]+'>'+a[i]+'&nbsp;</a>'
			}
			str+='<button id=next>다음</button><button id=last>마지막</button></td></tr>'
			$('#showpage').append(str)
			if($('#hpage').val() ==1){
				$('#prev').hide()
			}
			if($('#hpage').val() ==$('#hlastpage').val()){
				$('#next').hide()
			}
		}
	})
}
</script>
</html>