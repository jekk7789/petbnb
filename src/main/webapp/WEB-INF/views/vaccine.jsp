<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/vaccine.css" />
<title>예방접종</title>
</head>
<style>
.pet_add_popup {
    height: 80%; /* 높이를 화면의 80%로 설정합니다. */
    overflow-y: auto; /* 필요한 경우 수직 스크롤을 추가합니다. */
}
/* #petdata{
   display:none;
}
 */
</style>
<body>

<header id="herder">
     <%@ include file="/WEB-INF/views/include/header.jsp" %>
</header>
<input id=userid value=${email }>
<input id=pbirth >
<div class="container">
   
   <div class="s21_event_m_top pr">
      <div class="h21_top_cbox pr area">
         <h3 class=""> <span>예방접종일정</span></h3>
         <p class="s21_h3_text">
            반려견을 위한 예방접종일정을 준비했습니다.<br><br>
         </p>
      </div>
  </div>
   
   
</div>
   <hr>
    <div>
        <div class="tab" >
            <button class="tablinks">접종일정확인</button>
            <button class="tablinks">예방접종안내</button>
        </div>   
    </div>
    
<!-- 접종일정확인 s -->
      <div id="information">
       <h1>접종일정확인 </h1>
         <div class="je_wrap" id="vac_info">
         <p class="f_l_r f_c_b"><span class=""></span>접종필수</p>
            
            
      <div class="s21_shot_list">
            
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>종합예방접종 (DHPPL)</dt>
               <dd><span>접종주기</span>6~14주차에 2주 간격으로 각 1번씩 총 5회. 이후 매년마다 추가 접종</dd>
            </dl>
               <p class="s21_shot_pbx">
               홍역 : 전염성 강함. 치사율이 높고 신경계 관련 후유증 발생.<br />
               간염 : 황달, 식욕감퇴, 고열, 구토, 복통등의 증세.<br />
               파보장염 : 전염성 강함. 치사율이 높음.<br />
               파라인플루엔자 : 기관지 염증. 치사율이 높은편은 아니지만 어릴때는 위험<br />
               렙토스피라 : 인수공통전염병<br />
               </p>
            </div>
            
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>코로나 장염</dt>
               <dd><span>접종주기</span>6, 8주차에 각 1번씩 총 2회.이후 매년마다 추가 접종</dd>                     
            </dl>
            <p class="s21_shot_pbx">파보장염과 유사. 설사,구토, 열이 있고 식욕이 없어짐.</p>
            </div>
         
         
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">            
               <dt><span></span>켄넬코프</dt>
               <dd><span>접종주기</span>10, 12주차에 각 1번씩 총 2회.이후 매년마다 추가 접종</dd>
            </dl>
            <p class="s21_shot_pbx">기관/기관지염. 공기를 통해 감염. <br />마른 기침을 발생하여 폐렴으로 진행되기도 함.</p>
               </div>
               
               
         <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>광견병</dt>                     
               <dd><span>접종주기</span>16주차 이후 매년마다 추가 접종.</dd>                     
            </dl>
            <p class="s21_shot_pbx">행동이 난폭해지고 공격적으로 변함.<br />
                              개는 사람처럼 한번 접종하면 평생동안 면역을 갖지 못함.<br />
                              1년에 1회이상 추가 접종을 진행해야함.</p>
         </div>
               
                  
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>인플루엔자(신종플루)</dt>                     
               <dd><span>접종주기</span>14,16주차에 각 1번씩 총 2회. 이후 매년마다 추가 접종</dd>                     
            </dl>
            <p class="s21_shot_pbx">감염률이 높기 때문에, 강아지가 많이 모이는 곳에 가는 경우에는 접종을 권장.</p>
         </div>
                  
                  
                  <div class="s21_shot_list_bx">
                  <dl class="s21_shot_dl">
                     <dt>기생충 구충(내부)</dt>                     
                     <dd><span>투여주기</span>4주차에 구충제 투여. 3개월마다 투여</dd>                     
                  </dl>
                  <p class="s21_shot_pbx">반려동물의 몸속에 들어가면 장 속에만 머물지 않고 장기를 뚫고 혈관을 따라 이동하며 각종 문제를 일으킴.</p>
               </div>
                  
                  
                  <div class="s21_shot_list_bx">
                  <dl class="s21_shot_dl">
                     <dt>심장사상충</dt>
                     <dd><span>투여주기</span>모기발생기(5~11월) 매월 1회 투여</dd>
                  </dl>
                  <p class="s21_shot_pbx">모기를 타고 강아지의 혈관에 침투. 보통 폐동맥에 기생하기 시작해 수가 많아지면 심장까지 침범해 생명을 앗아감.</p>
               </div>
               
               
   </div>
      <div class="s21_shot_important">
         <h3>※ 백신 접종 시 참고 사항</h3>
         <ul>
            <li><span class="li_pd">-</span>접종 후 알러지 반응이 나타날 수 있기에, 최소 30분에서 길게는 2시간 까지 관찰을 해주세요.</li>
            <li><span class="li_pd">-</span>이전에 접종한 이력이 있는 백신이고 별 문제 없었다고 해도, 추가 접종 시 얼마든지 알러지 반응이 나타날 수 있기에 매번 추가 접종 시 마다 관찰이 필요합니다.</li>
            <li><span class="li_pd">-</span>백신은 동물병원 마감시간 직전 보다, 2시간 정도 여유있게 맞춰야 아나필라시스 쇼크 발생 시 원활한 대처가 가능합니다.</li>
            <li><span class="li_pd">-</span>필수 예방접종은 다음 해부터 추가 접종 시 예방접종별로 1대씩만(1차) 맞으면 됩니다.(생후 약 6주에 시작하는 최초 접종 시에만 1~5차에 걸쳐 진행)</li>
            <li><span class="li_pd">-</span>크게 걱정하지 않아도 되는 부작용은 기운이 없다거나, 밥을 조금 덜 먹는다거나, 미열이 있다거나 하는 경우입니다.</li>
            <li><span class="li_pd">-</span>즉각 병원으로 데려가야 하는 부작용은 "급성 아나필라시스 쇼크"라 해서, 얼굴이 붓고 피부에 발진이 일어나는 경우입니다.<Br><span class="pd20"></span>(눈 주위가 부으면서 눈이 작아진다 싶으면 얼굴이 붓는 것입니다.)</li>
            <li><span class="li_pd">-</span>모유를 먹고 자란 아이는 어미로부터 면역항체를 물려 받아 충분한 면역력을 형성하게 됩니다. <Br><span class="pd20"></span>이를 모체이행항체라 부르는데, 너무 어린 시기에 백신 접종 시 오히려 모체이행항체로 인해 백신 효과가 무효화 될 우려가 있습니다.<Br><span class="pd20"></span>출생 6~7주 사이가 되면 모체이행항체로 형성된 면역력이 약해져 질병에 노출되게 되는데,<Br><span class="pd20"></span>이 때 백신을 통해 면역력을 형성해야 모체이행항체로부터 방해도 받지 않고 백신 효과도 누릴 수 있게됩니다.</li>
         </ul>
      </div>
  </div>
 </div>
 
<!-- 예방접종안내 s -->

<div id="review">
   <h1>예방접종안내 </h1>
     <div >
          
      <div class="pet_add">
          <div class='dog'>
              <img src="image/강아지그림.jpg" alt="강아지그림" width="200" height="150">
          </div>
          <div class='dog'>
              <table id='tbldog2'>
                <tr>
                     <td colspan=2 id='petname'></td>
                  </tr>
                  <tr>
                      <td >생일</td><td id='petbirth'></td>
                  </tr>
                  <tr>
                      <td >동물등록번호</td><tdid='number'></td>
                  </tr>
                  <tr>
                      <td colspan=2><button type="button" id="btnMypet">반려견 등록 및 선택을 해주세요.</button>
                      <button id=dododo>예방접종보기</button></td>
                  </tr> 
              </table>
          </div>
      </div>
      
      <div id=petdata>
         <div class="s21_shot_list">
            
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>종합예방접종 (DHPPL)</dt>
            </dl>
               <p class="s21_shot_pbx">
            <table id=tbl_vaccine>
               <tr>
                  <td>1차</td><td class=ehppl ></td>
               </tr>
               <tr>
                  <td>2차</td><td class=ehppl ></td>
               </tr>
               <tr>
                  <td>3차</td><td class=ehppl ></td>
               </tr>
               <tr>
                  <td>4차</td><td class=ehppl ></td>
               </tr>
               <tr>
                  <td>5차</td><td class=ehppl ></td>
               </tr>
            </table>
               </p>
            </div>
            
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>코로나 장염</dt>
               <dd><span>접종주기</span>6, 8주차에 각 1번씩 총 2회.이후 매년마다 추가 접종</dd>                     
            </dl>
            <p class="s21_shot_pbx">파보장염과 유사. 설사,구토, 열이 있고 식욕이 없어짐.</p>
            </div>
         
         
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">            
               <dt><span></span>켄넬코프</dt>
               <dd><span>접종주기</span>10, 12주차에 각 1번씩 총 2회.이후 매년마다 추가 접종</dd>
            </dl>
            <p class="s21_shot_pbx">기관/기관지염. 공기를 통해 감염. <br />마른 기침을 발생하여 폐렴으로 진행되기도 함.</p>
               </div>
               
               
         <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>광견병</dt>                     
               <dd><span>접종주기</span>16주차 이후 매년마다 추가 접종.</dd>                     
            </dl>
            <p class="s21_shot_pbx">행동이 난폭해지고 공격적으로 변함.<br />
                              개는 사람처럼 한번 접종하면 평생동안 면역을 갖지 못함.<br />
                              1년에 1회이상 추가 접종을 진행해야함.</p>
         </div>
               
                  
            <div class="s21_shot_list_bx">
            <dl class="s21_shot_dl">
               <dt><span></span>인플루엔자(신종플루)</dt>                     
               <dd><span>접종주기</span>14,16주차에 각 1번씩 총 2회. 이후 매년마다 추가 접종</dd>                     
            </dl>
            <p class="s21_shot_pbx">감염률이 높기 때문에, 강아지가 많이 모이는 곳에 가는 경우에는 접종을 권장.</p>
         </div>
                  
                  
                  <div class="s21_shot_list_bx">
                  <dl class="s21_shot_dl">
                     <dt>기생충 구충(내부)</dt>                     
                     <dd><span>투여주기</span>4주차에 구충제 투여. 3개월마다 투여</dd>                     
                  </dl>
                  <p class="s21_shot_pbx">반려동물의 몸속에 들어가면 장 속에만 머물지 않고 장기를 뚫고 혈관을 따라 이동하며 각종 문제를 일으킴.</p>
               </div>
                  
                  
                  <div class="s21_shot_list_bx">
                  <dl class="s21_shot_dl">
                     <dt>심장사상충</dt>
                     <dd><span>투여주기</span>모기발생기(5~11월) 매월 1회 투여</dd>
                  </dl>
                  <p class="s21_shot_pbx">모기를 타고 강아지의 혈관에 침투. 보통 폐동맥에 기생하기 시작해 수가 많아지면 심장까지 침범해 생명을 앗아감.</p>
               </div>
      </div>
          
    </div>
       
         
               
   
   
   
   <!-- pet add popup -->
   <div class="pet_add_popup" id="pet_add_popup">
      <div>
         <span class="close_shot" onClick="$('#pet_add_popup').hide()" style="cursor: pointer;">&times;</span>
         <h2>내 반려견 등록</h2>
      </div>
      <div class="modal-body_shot">
   
         <div class="s21_shot_card_img">
            <p class="s21_shot_img_input">
               <img src="image/강아지그림.jpg" id="dog_pic" >
            </p>
         </div>
         
         <div class="s21_shot_card_text_pop">
            <p><input type="text" class="pet_input" id="dog_no" placeholder="등록번호" value=""></p>
            <p><input type="text" class="pet_input" id="dog_name" placeholder="반려견이름" value=""></p>
         <div>
         <div>
         <select name="birthY" id="birthY" class="pet_select" ></select>
         <select name="birthM" id="birthM" class="pet_select" ></select>
         <select name="birthD" id="birthD" class="pet_select" ></select>
         </div>
         <div class='petlist' >
         <table class='tbldog'>
         </table>
         </div>
      </div>
      <br>
      <button id="btn_add" >등록하기</button>
   </div>

 </div>
 
 
</div>
      
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>   
$(document)
.ready(function(){
   $("#information").hide();
   setDateBox();
   petload();
   
   var savedData = localStorage.getItem('selectedPet');
   if (savedData) {
       var data = JSON.parse(savedData);
       $('#petname').text(data.name);
       $('#number').text(data.number);
       $('#petbirth').text(data.birth);
   }
  
})
.on('click','.tablinks:eq(0)',function(){
   $("#review").hide(); 
    $("#information").show(); 
})
.on('click','.tablinks:eq(1)',function(){
   $("#information").hide(); 
    $("#review").show(); 
})
.on('click','#btn_add',function(){
   let birth =$("#birthY").val()+$("#birthM").val()+$("#birthD").val();
   
   $.ajax({
      type:'post',
      url:'petadd',
      data:{num:$("#dog_no").val(),name:$("#dog_name").val(),birth:birth,loginid:$('#userid').val()},
      dataType:'text',
      success:function(data){
         if(data==1){
            console.log("성공");
            petload();
         }
      }
   })  
   
})
.on('click','#btnMypet',function(){
   $('#pet_add_popup').show();
})
.on('click', '#choice', function() {
    var petId = $(this).closest('tr').find('input#petid').val();
 
    $.ajax({
       type:'post',
       url:'petchoice',
       data:{petId:petId},
       dataType:'json',
       success:function(data){
          localStorage.setItem('selectedPet', JSON.stringify(data));
          $('#petname').text(data.name); 
          $('#number').text(data.number); 
          $('#petbirth').text(data.birth); 
       }
    })
   
})
.on('click','#dododo',function(){
    /* var petbirth = new Date($('#petbirth').text()); */
    var petbirth = $('#petbirth').text();
    
    $.ajax({
       type:'post',
       url:'petvaccine',
       data:{petbirth:petbirth},
       dataType:'json',
       success:function(data){
          for(var i=0; i<data.length; i++){ 
             /* console.log(data[i]); */
             console.log(i);
              
          /*    $(".ehppl:eq(0)").text(data[0]);
             $(".ehppl:eq(1)").text(data[1]);
             $(".ehppl:eq(2)").text(data[2]);
             $(".ehppl:eq(3)").text(data[3]);
             $(".ehppl:eq(4)").text(data[4]); */
          } 
       }
    })
  
    /* var DHPPL1 = new Date(petbirth.getTime());
    DHPPL1.setDate(DHPPL1.getDate() + (6 * 7)); // 6주는 일수로 환산하여 더하기
    console.log( DHPPL1.toISOString().split('T')[0]);
    $('#ehppl').text(DHPPL1.toISOString().split('T')[0]); */
 });

function setDateBox(){
   var dt = new Date();
   var year = dt.getFullYear();
   var month = dt.getMonth() + 1;

   for (var y = year; y >= (year - 10); y--) {
         $("#birthY").append("<option value='" + y + "'>" + y + "년" + "</option>");
   }
   for (var i = 1; i <= 12; i++) {
         var paddedMonth = String(i).padStart(2, '0'); // 월을 두 자리로 표시
         $("#birthM").append("<option value='" + paddedMonth + "'>" + paddedMonth + "월" + "</option>");
   }
   for (var i = 1; i <= 31; i++) {
         var paddedDay = String(i).padStart(2, '0'); // 일을 두 자리로 표시
         $("#birthD").append("<option value='" + paddedDay + "'>" + paddedDay + "일" + "</option>");
   } 
   }
function petload(){
   $.ajax({
      type:'post',
      url:'petload',
      data:{loginid:$('#userid').val()},
      dataType:'json',
      success:function(data){
          for(var i=0; i<data.length; i++){
               let ob=data[i];
               let str='<tr><td colspan=2>'+ob.name+'</td>'+
                     '<td rowspan=3 ><input id=petid value="'+ob.id+'"></input><button id="choice">선택</button><button id=modify>수정</button><button id=delete>삭제</button></td></tr>'+
                     '<tr><td>생일</td><td>'+ob.birth+'</td></tr><tr><td>동물등록번호</td><td>'+ob.number+'</td></tr>';
              $('.tbldog').append(str);
          } 
      }      
   })
            
}




</script>

           
 


</body>
</html>
</body>
</html>