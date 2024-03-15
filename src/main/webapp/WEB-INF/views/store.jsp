<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<style>

a{
	text-decoration:none;
}
table{
    border-collapse: collapse;
}
body {
     font-family: "Gowun Dodum", sans-serif;
     font-weight: 900;
     font-style: normal;
    margin: 0;
}

h2 {
    color: #333;
}

a {
    color: #3498db;
}

a:hover {
    color: #2980b9;
}

table {
    width: 1000px;
    margin-top: 20px;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
}

th, td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #3498db;
    color: #fff;
}

tr:hover {
    background-color: #f5f5f5;
}

caption {
    margin-top: 10px;
    margin-bottom: 20px;
    text-align: right;
}
button {
    padding: 8px 12px;
    background-color: #3498db;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #2980b9;
}
#btnout {
    margin-top: 10px;
    padding: 8px 12px;
    background-color: #e74c3c;
    color: #fff;
    border: none;
    cursor: pointer;
}
#btnout:hover {
    background-color: #c0392b;
}
div.detail {
    width: 1000px;
    overflow: auto;
    margin: auto;
}
td.qbutton{
	width:150px;
}

</style>
<body>

<input type=hidden id=hpage value=${page }>
<input type=hidden id=hlastpage value=${lastpage }>
<input type=hidden id=hname value=${text }>
<input type=hidden id=hsearch value=${search }>


   <h2>${text }입니다</h2>
   <h3>현재페이지:${page }</h3>
   	<span>현재날씨</span>
				    <h3>경기도</h3>
				    <h3 class="SeoulIcon"  style="width: 10%"></h3>
				    <h3 class="SeoulNowtemp">현재기온:</h3>
				    <h3 class="SeoulLowtemp">최저기온:</h3>
				    <h3 class="SeoulHightemp">최대기온:</h3>
   <div>
		<p>이색기들 너네어디감?</p>
		<form method="get" action="search">
			<input name="search"><input type="submit" value="&#128269;">
		</form>
		<a class="bn5" href="store?text=반려동물용품">애견용품점</a>
		<a class="bn5" href="store?text=동물병원">동물병원</a>
		<a class="bn5" href="store?text=동물약국">동물약국</a>
		<a class="bn5" href="store?text=식당,카페,문예회관">문화시설</a>
		<a class="bn5" href="store?text=펜션">숙박시설</a>
	</div>
   <hr>
   
<div class=detail>
	<table>
		<tr><th>번호</th><th>이름</th><th>전화번호</th><th>주소</th></tr>
		<c:forEach var="list"  items="${alList}">
			<tr>
				<td class=qId>${list.id}</td>
				<td class=qName><a href=/page?id=${list.id}>${list.name}</a></td>
				<td class=qNumber>${list.number}</td>
				<td class=qAddress>${list.loadAddress}</td>
			</tr>
		</c:forEach>
	</table>  
 

  <button id=first>맨처음</button>
  <button id=prev>이전</button>
  <c:forEach var="num" items="${showpage }">
  	<a href="/store?page=${num }&text=${text}&search=${search}">${num }&nbsp;</a>
  </c:forEach>
  <button id=next>다음</button>
  <button id=last>마지막</button>
  <p>${text }!!</p>
  <a href="/">홈으로</a>
</div>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	convertTime();
	if($('#hpage').val()==1){
		$('#prev').hide();
	}
	if($('#hpage').val() == $('#hlastpage').val()){
		$('#next').hide();
	}
})


//현재 날짜
function convertTime() {
	let now = new Date();
	let month = now.getMonth() + 1;
	let date = now.getDate();
    
	return month + '월' + date + '일';
}

let currentTime = convertTime();
$('.nowtime').append(currentTime);

$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul,kr&appid=46b55a9f61cc588200575a3dda8e3069&units=metric',
    function (WeatherResult) {
        //기온출력
        $('.SeoulNowtemp').append(WeatherResult.main.temp);
        $('.SeoulLowtemp').append(WeatherResult.main.temp_min);
        $('.SeoulHightemp').append(WeatherResult.main.temp_max);


        let weathericonUrl = '<img src= "http://openweathermap.org/img/wn/'
            					+ WeatherResult.weather[0].icon
            					+ '.png" alt="' + WeatherResult.weather[0].description + '"/>'
        $('.SeoulIcon').html(weathericonUrl);
    })
.on('click','#prev',function(){
	let num=$('#hpage').val()
	console.log(num)
	let page=num-1
	console.log(page)
	location.href="/store?page="+page+"&text=${text}&search=${search}";
})

.on("click","#next",function(){
	let num=parseInt($('#hpage').val())
	console.log(num)
	let page=num+1
	console.log(page)
	location.href="/store?page="+page+"&text=${text}&search=${search}"
})

.on("click","#first",function(){
	let num=1
	console.log(num)
	location.href="/store?page="+num+"&text=${text}&search=${search}"
})

.on("click","#last",function(){
	let num=parseInt($('#hlastpage').val())
	console.log(num)
	location.href="/store?page="+num+"&text=${text}&search=${search}"
})

</script>
</html>