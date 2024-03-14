<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성하기</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
</head>
<style>
	
	
	.layout {
	    width: 80%;
	    max-width: 600px;
	    margin: 20px auto;
	    background-color: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.layout label {
	    display: block;
	    font-weight: bold;
	    margin-bottom: 5px;
	}
	
	.layout input[type="text"],
	.layout textarea {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	.layout textarea {
	    min-height: 150px;
	    resize: vertical;
	}
	
	
	.layout select {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
</style>


<body>
<input type=hidden id=userid value=${email }>
<div id="container">

    <main id="main">
     <div id="mainContent"> 
     
 
<div class="layout" id='data_div'>
   	<label>작성하기</label>
   	<input type="hidden" id="pet_id" value=${pid }>
   	<input type="hidden" id="idDisplay">
   	<input type="text" id="title"  placeholder="제목">
    <input type="text" id="writer"  placeholder="작성자" readonly>
    <textarea id="content" placeholder="내용"></textarea>
    
    <button id="do_write" >Qna등록하기</button>
    <button id="clear" >취소하기</button>
</div>
</div>
</main>

</body>


<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.ready(function(){
	getIdFromURL();
	displayId();
	if($('#idDisplay').val() != ''){
		roda(); 
	}
	let userid=$('#userid').val()
	let id=userid.split("@")
	$('#writer').val(id[0])
})
$("#do_write").on('click',function(){
	if($('#title').val() == "" || $('#content').val()==""){
		alert("빈 칸에 값을 입력해주세요.");
	}
	$.ajax({
		type: 'post', 
        url: '/addQna',
        data: {title:$('#title').val(),writer:$('#writer').val(), 
        	  content:$('#content').val()}, 
        dataType: 'text',
        success: function(data) {
        	if(data==1){
        		 alert('성공');
        		window.close();
        		 window.opener.showList();
        		/*  window.opener.showpage();  */
        	}

        	}
	    })
});
$("#clear").on('click',function(){
	$('#content,title').val('');
})
function getIdFromURL() { // URL에서 id 값을 가져오는 함수
   const urlParams = new URLSearchParams(window.location.search);
   return urlParams.get('id');
}

function displayId() {
   const id = getIdFromURL();
   $('#idDisplay').val(id);
}
function roda(){
	console.log($('#idDisplay').val());
	$.ajax({
		type: 'post', 
        url: '/reLoad',
        data: {idDisplay:$('#idDisplay').val()}, 
        dataType: 'json',
        success: function(data) {
        	$('#content').text(data.content);
        }
	});
}

</script>
</body>
</html>