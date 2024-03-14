<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link href="/css/board.css" rel="stylesheet" type="text/css">
</head>
<style>
#data_write{
  display: none;
}
</style>
<body>
 <h1 class="middle_top_title">QnA</h1>
 <hr class="middle_top_hr">	
 
 <input  id=hpage value=${page } >
<input id=hlastpage value=${lastpage }>
<input id=userid value=${email }>



 <button id="new_write" placeholder="작성하려면 로그인이 필요합니다" disable = "true">리뷰작성</button>
  <div id="review" style="cursor: pointer;">
    
  </div>
 
<table id=showpage></table>
				
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	showList(); 
	showpage();
	
})
.on('click','#new_write',function(){
    let userid = $('#userid').val();
    console.log("userid"+userid)
    if(userid == "" || userid ==null){
        alert('로그인페이지로 이동합니다');
        
        location.href="/login";
        return false
    } else {
       
        $('#new_write').disable = false;
        openPop()
        return true

    }
})
.on('click', '#data_list', function() {
    let clickedElement = $(this); // 클릭된 요소를 변수에 저장
    clickedElement.next().toggle(300); // 클릭된 요소의 다음 요소를 토글
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
	showList();
	showpage();
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
.on('click','#btnbModify',function(){
	let title=$(this).parent().find('input#title').val();
	let content=$(this).parent().find('textarea#content').val();
	let id=$(this).parent().find('input#uniq').val();
	let category=$(this).parent().find('input#category').val();
	
	$.ajax({
		type:'post', url:'/QnaModify',
		data:{title:title,content:content,uniq:id,category:category},//$('#uniq').val()}, 
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('성공하였습니다');
				showList();
			} else{
				alert('실패하였습니다')
			}
		}
	}) 
}) 
.on('click','#btnbDelete',function(){
	let id=$(this).parent().find('input#uniq').val();
		
	$.ajax({
		type:'post', url:'/QnaDelete',
		data:{uniq:id},
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('성공하였습니다')
				showList();
			} else{
				alert('실패하였습니다')
			}
		}
	})	
});

 function showList(){
	$.ajax({
		type:'post',
		url:'/doQna',
		data:{},
		dataType:'json',
		success:function(data){
			$('#review').empty();
        	for(let i=0; i< data.length; i++){
        		let ob=data[i];
        		let str='<div class="announcement" id="data_list" style="cursor: pointer;">' +
                '<span>제목:'+ob.title+'</span>' +
	            '<div><span>작성자: '+ob.writer+'</span>' +
                '<span>작성시각: '+ob.time+'</span>' +
	            '</div>' +
    	        '</div>' +
    	        '<div class="announcement" id="data_write">' +
    	            '<input type="text" id="uniq" value="' + ob['id'] + '">' +
                    '<label>제목</label><input type="text" id="title" value="' + ob.title + '">' +
                    '<label>작성자</label><input type="text" id="writer" value="' + ob.writer + '" readonly>' +
                    '<label>내용</label><textarea id="content">' + ob.content + '</textarea>' +
                    '<button id="btnbModify" >수정하기</button>'+
                    '<button id="btnbDelete" >삭제하기</button>'+
    	        '</div>';
				$('#review').append(str);			
        	} 
			
		}
	})
}  


function showpage(){
	$.ajax({
		type:'get',
		url:'/Qnapage',
		data:{page:$('#hpage').val()},
		dataType:'text',
		success:function(data){
			$('#showpage').empty()
			$('#showpage').show()
	         if(data==""){
	            $('#showpage').hide()
	         }
			console.log(data)
			let b=data.slice(1,-1)
			b=b.replace(/(\s*)/g, "")
			console.log(b)
			let a=b.split(',')
			console.log(a)
			let str='<tr><td>&nbsp;&nbsp;&nbsp;<button id=first>맨처음</button><button id=prev>이전</button>'
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

/*  function showList(){
	$.ajax({
		type:'post',
		url:'/doQna',
		data:{},
		dataType:'json',
		success:function(data){
			$('#tbl_review').empty();
        	for(let i=0; i< data.length; i++){
        		let ob=data[i];
        		let str='<tr><td>'+ob.content+'</td><td>'+ob.writer+'</td><td>'+ob.time+'</td><td>' + ob['id'] +
                '</td><td>'+'<a href="#" onclick="modiPop(' + ob.id + ')">수정</a><a href="#" id="delete">삭제</a></td></tr>';
				$('#tbl_review').append(str);			
        	} 
			
		}
	})
}    */

function openPop(){
	  var popup = window.open('http://localhost:8081/write', 'Qna작성', 'width=700px,height=800px,scrollbars=yes'); 
} 


</script>
</html>