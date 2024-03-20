<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/store.css" />
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>검색 결과 입니다</title>
</head>
<style>
.city1{
    width: 200px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
}


.dropdown {
  display: inline-block;
  position: relative;
}

.dropdown-content,.dropdown-content2 {
  display: none;
  background-color: #f9f9f9;
  min-width: 250px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  position: absolute;
  z-index: 1;
}

.dropdown-content a,.dropdown-content2 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}
</style>

<body>
<input type=hidden id=hpage value=${page }>
<input type=hidden id=hlastpage value=${lastpage }>
<input type=hidden id=hname value=${text }>
<input type=hidden id=hsearch value=${search }>
<input type=hidden id=hcity value=${city }>
<input type=hidden id=hciGunGu value=${ciGunGu }>

   <h2>${text }입니다</h2>
   <h3>현재페이지:${page }</h3>
   <div class="weatherbackground">
	<div style="float : left; margin-top: 50px; font-size: 130%">
		<div class="weather_icon"></div>
	</div><br>

	<div style="float: right; margin: -5px 0px 0px 60px; font-size: 11pt;">
		<div class="temp_min"><i class="fa-solid fa-temperature-arrow-down"></i> </div>
		<div class="temp_max"><i class="fa-solid fa-temperature-arrow-up"></i> </div>
		<div class="humidity"> <i class="fa-solid fa-droplet"></i></div>
		<div class="wind"> <i class="fa-solid fa-wind"></i></div>
		<div class="cloud"><i class="fa-solid fa-cloud"></i></div>
	</div>

	<div style="float : right; margin-top : -45px;">
		<div class="current_temp" style="font-size : 50pt"></div>
		<div class="weather_description" style="font-size : 20pt"></div>
		<div class="city" style="font-size : 13pt"></div>
	</div>
	
</div>
<form method="post" action="/citysearch">
<input type=hidden name=text value=${text }>
   <div class="navigation" style="text-align:center">   
         <div class="dropdown">
            시,도<input class="city1" name=city  id=city readonly />
         	<div class="dropdown-content">
         	</div>
         </div>
         <div class="dropdown">
            시,군,구<input class=city1 name=ciGunGu id=ciGunGu readonly>
           <div class="dropdown-content2">
         </div>
         </div>
         <button id=citysearch>&#128269;</button>      
   </div> 
 </form>
   
<div class=detail>
	<table >
		<tr><th>번호</th><th>이름</th><th>전화번호</th><th>주소</th></tr>
		<c:forEach var="list"  items="${alList}" varStatus="status">
			<tr>
				<%-- <td class=qId>${list.id}</td> --%>
				<td>${tblnum[status.index]}</td>
				<td class=qName><a href=/page?id=${list.id}>${list.name}</a></td>
				
				<td class=qNumber>${list.number}</td>
				<td class=qAddress>${list.loadAddress}</td>
			</tr>
		</c:forEach>
	</table>  
 

<div class=page>
  <button id=first>맨처음</button>
  <button id=prev>이전</button>
  <c:forEach var="num" items="${showpage }">
     <a href="/store?page=${num }&text=${text}&search=${search}&city=${city}&ciGunGu=${ciGunGu}">${num }&nbsp;</a>
  </c:forEach>
  <button id=next>다음</button>
  <button id=last>마지막</button>
  <p>${text }!!</p>
 </div>
 	
 
 
 
</div>




<footer class="footer01">
	<div role="contentinfo" class=container>
	    <table class="tblfooter01">
	    	<tr>
		    	<td>
			    	<address align=center>
				        © 2024 웹 페이지 제작자
				        <a href="/dogbnb">도그비앤비</a>
			    	</address>
		    	</td>
		    	<td>
		    		<a href="/">홈으로 돌아가기</a>
		    	</td>
		    	<td>
	    			<b>천만반려인을 위한 유용한 커뮤니티 사이트입니다</b><br>
	    			<p>개와 함께 살아보지 않은 사람은 사랑이 무엇인지 충분이 이해할수 없다. -진 힐</p>
    			</td>
    			<td>
		    		<p>고객센터 번호:010-1234-1234</p>
		    		<p>상담시간  평일 : 09시 ~ 18시
		    			   주말 : 09시 ~ 13시<p>
		    	</td>
	    	</tr>
	    </table>

	</div>
</footer>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	if($('#hpage').val()==1){
		$('#prev').hide();
	}
	if($('#hpage').val() == $('#hlastpage').val()){
		$('#next').hide();
	}
	 cityList()
})
.on('click','#city',function(){
   $('.dropdown-content').css('display','block')
   $("div.dropdown-content").mouseleave(function(){
      $('.dropdown-content').css('display','none')
   })
})
.on('click','#ciGunGu',function(){
   $('.dropdown-content2').css('display','block')
   $("div.dropdown-content2").mouseleave(function(){
      $('.dropdown-content2').css('display','none')
   })
})

.on('click','.cityname',function(){
   let n=$(this).text()
   console.log("n"+n)
   $.ajax({
      type:'get',
      url:'ciGunGuList',
      data:{city:n},
      dataType:'json',
      success:function(data){
          $('.dropdown-content2').empty()
          for(i=0;i<data.length;i++){
               let ob=data[i]
               let str='<a href="#" class="ciGunGuname">'+ob['ciGunGu']+'</a>'
               $('.dropdown-content2').append(str)
               
            }
          return
      }
   })
   $('#city').val(n)
   $('.dropdown-content').css('display','none')
})
.on('click','.ciGunGuname',function(){
   let n=$(this).text()
   $('#ciGunGu').val(n)
   $('.dropdown-content2').css('display','none')
})

.on('click','#prev',function(){
   let num=$('#hpage').val()
   console.log(num)
   let page=num-1
   console.log(page)
   location.href="/store?page="+page+"&text=${text}&search=${search}&city=${city}&ciGunGu=${ciGunGu}";
})

.on("click","#next",function(){
   let num=parseInt($('#hpage').val())
   console.log(num)
   let page=num+1
   console.log(page)
   location.href="/store?page="+page+"&text=${text}&search=${search}&city=${city}&ciGunGu=${ciGunGu}"
})

.on("click","#first",function(){
   let num=1
   console.log(num)
   location.href="/store?page="+num+"&text=${text}&search=${search}&city=${city}&ciGunGu=${ciGunGu}"
})

.on("click","#last",function(){
   let num=parseInt($('#hlastpage').val())
   console.log(num)
   location.href="/store?page="+num+"&text=${text}&search=${search}&city=${city}&ciGunGu=${ciGunGu}"
})

function cityList(){
   $.ajax({
      type:'get',
      url:'/cityList',
      data:{},
      dataType:'json',
      success:function(data){
            for(i=0;i<data.length;i++){
               let ob=data[i]
               let str='<a href="#" class="cityname">'+ob['city']+'</a>'
               $('.dropdown-content').append(str) 
         }
            return
         console.log("실패")
      }
   })
}


//날씨
var weatherIcon = {
    '01' : "fas fa-sun",
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
}

var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'Gyeonggi-do'+"&appid="+"cd282412089ea297a4ca92877e7c9dcb";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {

        var $Icon = (resp.weather[0].icon).substr(0,2);
        var $weather_description = resp.weather[0].main;
        var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
        var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
        var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
        var $city = '서울';
        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
        

        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
        $('.weather_description').prepend($weather_description);
        $('.current_temp').prepend($Temp);
        $('.humidity').prepend($humidity);
        $('.wind').prepend($wind);
        $('.city').append($city);
        $('.cloud').append($cloud);
        $('.temp_min').append($temp_min);
        $('.temp_max').append($temp_max);   
    }
})

</script>
</html>