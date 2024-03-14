<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>도그비앤비</title>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CMontserrat:300,400,500,600,700,800,900">
    <link rel="stylesheet" href="/css/bootstrap.css">
    
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fittext/1.2.0/jquery.fittext.min.js"></script>

</head>
<style>
.bn5 {
  padding: 0.6em 2em;
  border: none;
  outline: none;
  color: rgb(255, 255, 255);
  background-color:transparent;
  cursor: pointer;
  position: relative;
  z-index: 0;
  border-radius: 10px;
}

.bn5:before {
  content: "";
  background: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
  position: absolute;
  top: -2px;
  left: -2px;
  background-size: 400%;
  z-index: -1;
  filter: blur(5px);
  width: calc(100% + 4px);
  height: calc(100% + 4px);
  animation: glowingbn5 20s linear infinite;
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  border-radius: 10px;
}

@keyframes glowingbn5 {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 400% 0;
  }
  100% {
    background-position: 0 0;
  }
}

.bn5:active {
  color: #000;
}

.bn5:active:after {
  background: transparent;
}

.bn5:hover:before {
  opacity: 1;
}

.bn5:after {
  z-index: -1;
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background-color:transparent;
  left: 0;
  top: 0;
  border-radius: 10px;
}

</style>
<body data-spy="scroll" data-target=".navbar" data-offset="70">
    
    <section class="home svg_shape bg_image" id="home" style="background-image: url(/image/modern-1.jpg)">
        
        <div class="full_height">
            
            <nav class="navbar navbar-default nav_scroll navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <!-- LOGO -->
                        <a class="navbar-brand" href="#">petB&B</a>

                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <c:choose>
		                            <c:when test="${not empty email}">
		                                <a href="/logout">logout</a>
		                            </c:when>
		                            <c:otherwise>
		                                <a href="/login" class="btn-11">login</a>
		                            </c:otherwise>
		                        </c:choose>
                            </li>
                            <li>
                                <a href="/notice" >notice</a>
                            </li>
                            <li>
                                <a href="#services" >Services</a>
                            </li>
                            <li>
                                <a href="#portfolio" >Portfolio</a>
                            </li>
                            <li>
                                <a href="#contact" >Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navigation" style="margin-top: 100px;">
                    <p>이색기들 너네어디감?</p>
                    <form method=get action=search>
      						<input name=search><input type=submit value=&#128269;>
      				</form>
                    <a href="#">도그 비 앤 비</a>
                        <a class="bn5" href="store?text=반려동물용품">애견용품점</a>
                        <a class="bn5" href="store?text=동물병원">동물병원</a>
                        <a class="bn5" href="store?text=동물약국">동물약국</a>
                        <a class="bn5" href="store?text=식당,카페,문예회관">문화시설</a>
                        <a class="bn5" href="store?text=펜션">숙박시설</a>
                    </div>
            </nav>
            
            <div class="display-table">
                <div class="display-table-cell">
                    <div class="container">
                        <h3>
							<c:if test="${not empty email}">
								<p>로그인한 사용자: ${email}님 환영합니다.</p>
		                    </c:if></h3>
                        <h1 class="cd-headline letters rotate-2 is-full-width">
                            <span class="cd-words-wrapper">
                                <b class="is-visible">반려동물</b>
                                <b>서비스 이용하기</b>
                            </span>
                        </h1>
                    </div>
                    
                </div>
            </div>
            <div class="container go_down_container">
                <div class="go_down">
                    <a href="#about" class="smooth_scroll">
                        
                    </a>
                </div>
            </div>
        </div><!--.full_height-->
    </section>


</body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js"
  integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js"></script>
    
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/animateHeader.js"></script>
    <script src="/js/custom.js"></script>
<script>

Kakao.init('d129ecc6b869c11eb7e257e7089bcf6b');

//카카오로그아웃  
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('로그인을 해주세요.');
      return
    }
    Kakao.Auth.logout(function() {
        // 카카오 로그아웃 성공 후 서버 측 로그아웃 요청
        fetch('/logout')
            .then(response => window.location.reload()) // 페이지 새로고침
            .catch(error => console.error('Error:', error));
    });
}

//카카오톡 탈퇴
function unlinkApp() {
    Kakao.API.request({
        url: '/v1/user/unlink',
    })
    .then(function(res) {
        alert('success: ' + JSON.stringify(res));
        deleteCookie();
    })
    .catch(function(err) {
        alert('fail: ' + JSON.stringify(err));
    });
}



// deleteCookie 함수 정의
function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
</script>

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("HFRL2GVTFZRzg3tprpNh", "http://localhost:8081/home");
	var state = naver_id_login.getUniqState();
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);

</script>
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	    naver_id_login.getProfileData('프로필항목명');
	    let email = naver_id_login.getProfileData('email');
	    let nickname = naver_id_login.getProfileData('nickname');
	    let id = naver_id_login.getProfileData('id'); // 수정된 부분: 변수 이름을 id로 변경
	    console.log(email);
	    console.log(nickname);
	    console.log(id);
	    // Ajax 요청으로 이메일 정보를 컨트롤러로 전송
	    $.ajax({
	        type: "POST",
	        url: "/naverLogin",
	        data: { email: email, naverId: id },
	        success: function(data) {
	            if(data === '1'){
	            	window.location.href = '/home';
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText); // 에러 시 콘솔에 출력
	        }
	    });
	}
	
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
</html>