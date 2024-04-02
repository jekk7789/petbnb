<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
</head>
<h1 >호텔방 관리</h1>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }
  
  #tblRoom {
    width: 60%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
  }
  
  th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
  th {
    background-color: #f2f2f2;
    font-weight: bold;
    color: #333;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
  }
  
  input[type="text"],
  input[type="number"],
  select {
    width: calc(100% - 24px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
    margin-top: 4px;
    margin-bottom: 12px;
    font-size: 16px;
    transition: border-color 0.3s;
  }
  
  input[type="text"]:focus,
  input[type="number"]:focus,
  select:focus {
    outline: none;
    border-color: #5e9ad6;
  }
  
  input[type="button"] {
    width: 48%;
    padding: 12px;
    background-color: #5e9ad6;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    margin: 8px 4px 20px;
    font-size: 16px;
    transition: background-color 0.3s;
  }
  
  input[type="button"]:hover {
    background-color: #4787c7;
  }
  
  input[type="button"]:last-child {
    background-color: #d9534f;
  }
  
  input[type="button"]:last-child:hover {
    background-color: #c9302c;
  }
  
  h1 {
    text-align: center;
    color: #333;
    margin-top: 20px;
    font-size: 32px;
  }
  
  h3 {
    color: #5e9ad6;
    margin-bottom: 8px;
  }

</style>
<a href='/book'>예약관리</a>
<br><br>
<body>
<table id=tblRoom>
<tr>
<td></td><td>객실번호</td><td><input type=text id='roomNum' name='roomNum' readonly></td>
</tr>
<tr>
<td rowspan=5 style="text-align:center;">객실목록<select size="10" id='selRoom' style="width: 100%; height :80% "></select></td><td>객실종류명</td><td><select id=roomtype name=roomtype></select></td>
</tr>
<tr>
<td>객실명</td><td><input type=text id='roomName' name='roomName'></td>
</tr>
<tr>
<td>숙박가능인원</td><td><input type=number id='howmany' name='howmany'>명</td>
</tr>
<tr>
<td>1박요금</td><td><input type=number id='howmuch' name='howmuch'></td>
</tr>
<tr>
<td colspan=2 style align="center"><input type=button id='btnAddRoom' value='등록' style="width: 50%; height :80% "> <br><input type=button id='btnDelRoom' value='삭제' style="width: 50%; height :80% "></td>
</tr>
</table>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>

$(document)
.ready(function(){
   getRoomtype();
   getRoomad();
})
.on('click','#btnAddRoom',function(){
   if($('#roomName').val()==''||$('#howmany').val()==''||$('#howmuch').val()==''){
      alert("빈값을 허용하지 않습니다");
      return false;
   } 
   $.ajax({
      type:'post', url:'/Add', 
      data:{id:$('#roomNum').val(),type:$('#roomtype').val(),name:$('#roomName').val(),howmany:$('#howmany').val(),howmuch:$('#howmuch').val()}, 
      dataType:'text',
      success:function(data){
         if(data=='1'){
            $('#roomNum,#roomName,#howmany,#howmuch').val('');
            $('#selRoom').empty();
            getRoomad();
         } else {
            $('#roomNum,#roomName,#howmany,#howmuch').val('');
            console.log($('#roomName').val());
         }
      }
   })   
})

.on('click','#selRoom',function(){
   let ar=$('#selRoom option:selected').text();
   let ar1=ar.split(',');
   $('#roomNum').val(ar1[0]);
   $('#roomName').val(ar1[1]);
   $('#howmuch').val(ar1[3]);
   
   ars=ar1[2];
   let ars1=ars.split('X');
   $('#howmany').val(ars1[1]); 
   
   $('#roomtype option').each(function(){
      if($(this).text()==ars1[0]){
         $(this).prop('selected',true)  
         return false;
         
      }
   })

}) 
.on('click','#btnDelRoom',function(){
   $.ajax({
      type:'post', url:'/remove', data:{id:$('#roomNum').val()}, dataType:'text',
      success:function(data){
         if(data=='1') {
            $('#roomNum,#roomName,#howmany,#howmuch').val('');
            $('#selRoom').empty();
            getRoomad();
         }else{
            alert('실패');
         }
      }   
   })
})

function getRoomtype(){
   $.ajax({
      type:'post', url:'/room01', data:{}, dataType:'json',
      success:function(data){
         for(let i=0; i<data.length; i++){
            let ob=data[i];
            let str='<option value='+ob['id']+'>'+ ob['typename'] + '</option>';
            $('#roomtype').append(str);
         }         
      } 
   })
}
function getRoomad(){
   $.ajax({
      type:'post', url:'/List', data:{}, dataType:'json',
      success:function(data){
         for(let i=0; i<data.length; i++){
            let ob=data[i];
            let str='<option>'+ob['id']+','+ob['name']+','+ob['typename']+'X'+ob['personnel']+','+ob['price']+'</option>';      
            $('#selRoom').append(str);
         }
      }
   })
}
</script>
</body>
</html>