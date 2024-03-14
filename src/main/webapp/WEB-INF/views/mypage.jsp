<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<style>
body {
  margin: 0;
  padding: 0;
  font-weight: 300;
  font-family: 'Raleway', sans-serif;
  background: #fff;
  background: radial-gradient(ellipse at center, rgba(0,0,0,0) 0%, rgba(0,0,0,0.05) 80%, rgba(0,0,0,0.15) 100%);
  overflow: hidden;
  transform-style: preserve-3d;
}
input[type='radio'],
.hide {
  display: none;
}
input[type='radio']:checked + section {
  top: 0;
}
.container {
  width: 100%;
  height: 100vh;
  transition: all 500ms;
  transform-style: preserve-3d;
  overflow:hidden;
 
}

.container section {
  position: absolute;
  top: 100vh;
  width: 100%;
  height: 100vh;
  transition: top 500ms;
  transform-style: preserve-3d;
}


.container section.home {
  background: #2196f3;
}
.container section.about {
  background: #d5664c;
}
.container section.work {
  background: #4caf50;
}
.container section.contact {
  background: #d3a23f;
}
/* .container h1,h2,h3,h4 { */
/*   margin: 30; */
/*   font-size: 30px; */
/*   transform: translate(0); */
/*   text-align: center; */
/*   color: rgba(255,255,255,0.85); */
/*   transition: transform 500ms; */
/*   transform-style: preserve-3d; */
/* } */
.my01 {
  margin: 30;
  font-size: 30px;
  transform: translate(35ch,15mm);
  text-align: center;
  color: rgba(255,255,255,0.85);
  transition: transform 500ms;
  transform-style: preserve-3d;
}
.my02 {
  margin: 30;
  font-size: 30px;
  transform: translate(50ch,2mm);
  text-align: center;
  color: rgba(255,255,255,0.85);
  transition: transform 500ms;
  transform-style: preserve-3d;
}
.my03 {
  margin: 30;
  font-size: 30px;
  transform: translate(50ch,2mm);
  text-align: center;
  color: rgba(255,255,255,0.85);
  transition: transform 500ms;
  transform-style: preserve-3d;
}
.my04 {
  margin: 30;
  font-size: 30px;
  transform: translate(45ch,10mm);
  text-align: center;
  color: rgba(255,255,255,0.85);
  transition: transform 500ms;
  transform-style: preserve-3d;
}
h1,h2,a{
	text-align:center;
	color:ivory;
}
.container section p{
	text-align:center;
	color: rgba(255,255,255,0.85);
}
.image{
width:1000px;
height:auto;
transform: translate(50ch,25mm);
}
.image02{
width:800px;
height:auto;
transform: translate(65ch,10mm);
}
.image03{
width:500px;
height:auto;
transform: translate(83ch,30mm);
}
.image04{
width:600px;
height:auto;
transform: translate(75ch,30mm);
}
.image05{
width:400px;
height:auto;
transform: translate(87ch,-35mm);
}

.container section label {
  display: block;
  position: absolute;
  top: 0;
  width: 100%;
  height: 100vh;
}
.menu {
  display: block;
  position: fixed;
  top: 20px;
  left: 25px;
  z-index: 1000;
  transform: 0deg;
  transition: all 200ms;
  width: 35px;
  height: 4px;
  background: rgba(0,0,0,0.25);
}
.menu::before,
.menu::after {
  content: '';
  display: block;
  position: absolute;
  width: 35px;
  height: 4px;
  background: rgba(0,0,0,0.25);
  transition: all 200ms;
}
.menu::before {
  top: 10px;
}
.menu::after {
  top: 20px;
}
.menu:hover {
  background: #fff;
}
.menu:hover::before,
.menu:hover::after {
  background: #fff;
}
.menu div,
.menu div label:nth-child(1) {
  display: block;
  width: 35px;
  height: 35px;
  position: absolute;
  top: -6px;
}
.menu div label:nth-child(2) {
  display: none;
}
#menu:checked + .container {
  transform: scale(0.65) translateY(-18%);
  transition: all 500ms;
  transform-style: preserve-3d;
}
#menu:checked + .container section {
  cursor: pointer;
  overflow: hidden;
  opacity: 1;
  box-shadow: 0 0 40px rgba(0,0,0,0.25);
  transform-style: preserve-3d;
}
#menu:checked + .container section h1 {
  transform: scale(0.5);
  transform-style: preserve-3d;
}
#menu:checked + .container + .menu {
  top: 30px;
  left: 20px;
  transform: rotate(225deg);
  transition: all 200ms;
  transform-origin: center center;
  background: #646464;
}
#menu:checked + .container + .menu::before,
#menu:checked + .container + .menu::after {
  background: #646464;
  transition: all 200ms;
}
#menu:checked + .container + .menu::before {
  opacity: 0;
  transition: opacity 0s;
}
#menu:checked + .container + .menu::after {
  margin-top: -20px;
  transform: rotate(90deg);
}
#menu:checked + .container + .menu div label:nth-child(2) {
  display: block;
  width: 35px;
  height: 35px;
  position: absolute;
  top: -6px;
}
#menu:checked + .container + .menu div label:nth-child(1) {
  display: none;
}
.container section.home {
  z-index: 99;
}
.container section.about {
  z-index: 98;
}
.container section.work {
  z-index: 97;
}
.container section.contact {
  z-index: 96;
}
#menu:checked + .container section.home {
  top: 192px;
}
#menu:checked + .container section.home:hover {
  top: 188px;
}
#menu:checked + .container section.about {
  top: 132px;
}
#menu:checked + .container section.about:hover {
  top: 128px;
}
#menu:checked + .container section.work {
  top: 72px;
}
#menu:checked + .container section.work:hover {
  top: 68px;
}
#menu:checked + .container section.contact {
  top: 12px;
}
#menu:checked + .container section.contact:hover {
  top: 8px;
}

/* :::::::::::::: Presentation css */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  --locked-color: #5fadbf;
  --unlocked-color: #ff5153;
}
.container01 {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 500px;
}
/* :::::::::::::: Required CSS */
/* Locked */
.lock {
  width: 200px;
  height: 200px;
  border: 5px solid var(--locked-color);
  border-radius: 15px;
  position: relative;
  cursor: pointer;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
.lock:after {
  content: "";
  display: block;
  background: var(--locked-color);
  width: 30px;
  height: 7px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -3.5px 0 0 -2px;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
.lock:before {
  content: "";
  display: block;
  width: 10px;
  height: 20px;
  bottom: 100%;
  position: absolute;
  left: 50%;
  margin-left: -8px;
  border: 3px solid var(--locked-color);
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom: 0;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
/* Locked Hover */
.lock:hover:before {
  height: 12px;
}
/* Unlocked */
.unlocked {
  transform: rotate(10deg);
}
.unlocked:before {
  bottom: 130%;
  left: 31%;
  margin-left: -11.5px;
  transform: rotate(-45deg);
}
.unlocked,
.unlocked:before {
  border-color: var(--unlocked-color);
}
.unlocked:after {
  background: var(--unlocked-color);
}
/* Unlocked Hover */
.unlocked:hover {
  transform: rotate(3deg);
}
.unlocked:hover:before {
  height: 40px;
  left: 40%;
  bottom: 124%;
  transform: rotate(-30deg);
}

.lock01{
	width:200px;
	background-color:#684d2d;
	color: rgba(255,255,255,0.85);
}
</style>
<body>
<input type=hidden id=hemailId value=${email }>
<input type=hidden id=hkakaoId value=${kakaoId }>
<input type=hidden id=hnaverId value=${naverId }>
<input type=hidden id=hpass value=${password }>
<input type=hidden id=hid value=${id }>
<input type=hidden id=jid value=${jjim }>

 <form>
	  <input type="radio" name="tab" id="menu"/>
	  <div class="container">
	    <input type="radio" name="tab" checked="checked" id="home"/>
	    <section class="home" >
	     	
	      <div class=my01>
		      <table>
			      <tr>
					<td>
						<h2>마이페이지입니다</h2>
					</td>
				</tr>
				<tr>			 
					<td>
						<h2>${email} 님안녕하세요</h2>
					</td>     
			      </tr>
				
		      </table>
			   
		        
	      </div>
	      <div>
	       <img class=image src="image/mypage01.jpg" >
	      </div>
	    
	      <label for="home"></label>
    	 
		
	     </section>
	
	    <input type="radio" name="tab" id="about"/>
	    <section class="about">
	      <h1 >추천장소</h1>
	      <label for="about"></label>
	      <br><br>
	    	<div class=my02>
	    		<table id=place01>
	    		
	    			<tr>
	    				<td>
	    					<a href="/">핫플레이스 바로가기</a>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>
	    					<a href="/">MD의 여행추천코스!</a>
	    				</td>
	    			</tr>
    				<tr>
	    				<td>
	    					   <a href="/">홈으로</a>
	    				</td>
	    			</tr>
	    		</table>
	    	</div>
	    	<div>
	    		<img class="image04" src="image/mypage04.jpg">
	    	</div>
	    </section>
	    <input type="radio" name="tab" id="work"/>
	    <section class="work">
	      <h1>게시판</h1>
	      <label for="work"></label>
	      <br><br>
	      <div class=my03>
	      	<table>
	      		<tr>
	      			<td>
	      				<a href="/">QNA로 이동하기</a>
	      			</td>
	      		</tr>
      			<tr>
	      			<td>
	      				<a href="/">게시판으로 이동하기</a>
	      			</td>
	      		</tr>
	      	</table>
	      </div>
	      <div>
	      	<img class="image02" src="image/mypage02.jpg">
	      </div>
	    </section>
	    <input type="radio" name="tab" id="contact"/>
	    <section class="contact">
	    <br><br>
	      <h1>개인정보</h1>
	      <label for="contact"></label>
	      <div class=my04>
	      	<table id=tbl04>
	      		<tr>
	      			<td>
	      				개인정보입니다
	      			</td>
	      		</tr>
	      	</table>
	      </div>
	    
	      <div class="container01">
			  <span class="lock"></span>
		  </div>
		  
			<div>
				<img class="image05" src="image/mypage05.jpg">
			</div>		  
		 

	    </section>
	
	    
	  </div>
	  <div class="menu">
	    <div>
	      <label for="menu"></label>
	      <label for="home"></label>
	    </div>
	  </div>
</form>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
//개인정보 수정하기 리스트
$(document)
.ready(function(){
	updateMy();
	$('#tbl04').hide();
	lock();
	
})
.on("click","#btnGo",function(){
	lock();
})


// .on('click','#btnGo',function(){
// 	console.log('되냐');
// 	setTimeout(function(){
// 		$('#tbl04').hide();
// 		$(".lock").show();
// 	},500);
// $(".lock").toggleClass("locked");
	
// })



function updateMy(){
	$('#tbl04').empty();
	$.ajax({
		type:"get",
		url:"/updateMy",
		data:{id:$('#hemailId').val()},
		dataType:'json',
		success:function(data){
			let str="";
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				console.log(ob)
				let kakao = ob['kakaoId'];
				let naver = ob['naverId'];
				console.log(kakao);
				console.log(naver);
				if(kakao==null){
					kakao="빈 값";
				}
				
				console.log(kakao);
				if(naver==null){
					naver="빈 값";
				}
				str+='<tr><td>아이디번호: '+ob['id']+'</td></tr><tr><td>이메일주소: '+ob['email']+'</td></tr>'
			}
			$('#tbl04').append(str)
		}
	})
};


function lock(){
	let flag="on";
	$( ".lock" ).click(function() {
		if(flag=='on'){
		  $(this).toggleClass('unlocked');
			  setTimeout(function() {
		       $('#tbl04').show();
		   		 }, 500); // 2000 밀리초 (2초) 후에 새 창을 엽니다.
		   	flag='off'	 
		} else if(flag=='off'){
			$(this).toggleClass('unlocked');
	    	console.log('되냐');
	    	setTimeout(function(){
	    		$('#tbl04').hide();
	    	},500);
			flag='on';
			
		}
	});
	$(".lock").show();
}
// $(".lock01").click(function(){
	  
// 	  setTimeout(function() {
// 	    $('#tbl04').hide();
// 	     $(".lock").show();
// 	  }, 500); // 2000 밀리초 (2초) 후에 새 창을 엽니다.
	
// });



</script>

</html>