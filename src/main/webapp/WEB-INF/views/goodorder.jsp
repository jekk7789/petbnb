<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 이미지 스타일링 */
.itemImage {
    display: block; /* 이미지를 블록 요소로 설정하여 가로 정렬합니다. */
    margin-bottom: 20px; /* 이미지 아래 여백 추가 */
}

/* 상품 이름 스타일링 */
.itemName {
    font-size: 20px; /* 상품 이름 폰트 크기 설정 */
    font-weight: bold; /* 상품 이름을 굵게 설정 */
    padding-bottom: 10px; /* 상품 이름 아래쪽 여백 추가 */
}

/* 테이블 스타일링 */
table {
    width: 100%; /* 테이블을 부모 요소의 전체 너비로 설정 */
    border-collapse: collapse; /* 테이블 셀 경계를 합칩니다. */
    margin-bottom: 20px; /* 테이블 아래 여백 추가 */
}

/* 테이블 셀 스타일링 */
table td {
    padding: 10px; /* 셀 내부 여백 설정 */
    border: 1px solid #ddd; /* 셀 테두리 설정 */
}

/* 수량 입력란 스타일링 */
#result {
    text-align: right; /* 텍스트 오른쪽 정렬 */
    width: 80px; /* 너비 설정 */
    height: 30px; /* 높이 설정 */
    font-size: 20px; /* 폰트 크기 설정 */
}

/* 버튼 스타일링 */
.int {
    width: 40px; /* 너비 설정 */
    height: 30px; /* 높이 설정 */
}

/* 장바구니/구매 버튼 스타일링 */
    button {
    padding: 10px 20px; /* 내부 여백 설정 */
    font-size: 18px; /* 폰트 크기 설정 */
    background-color: #a1660e; /* 배경색 설정 */
    color: #fff; /* 텍스트 색상 설정 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 상태로 표시 */
}

button:hover {
    background-color: #e6c926; /* 호버 시 배경색 변경 */
}
</style>
</head>
<body>

   <input type="hidden" id="id" value=${id }>
   <input type="hidden" id="userid" value=${email }>
            

   <div >
     <img class="itemImage"style="width: 280px;"  ><br>
   </div>
 
     <table>
       <tr><td colspan="2" class="itemName"></td></tr>
       <tr>
         <td>판매가</td>
         <td class="itemPrice"></td>
       </tr>
       <tr>
         <td>배송비</td>
         <td >2,500원</td>
       </tr>
       <tr>
         <td>수량</td>
         <td>
           <input type="text" id="result" readonly value="1" style="text-align: right;">
           <input type="button" onclick='count("plus")' value="+" class="int">
           <input type="button" onclick='count("minus")' value="-" class="int">
         </td>
       </tr>
       <tr>
        <td>총액</td>
         <td>
            <input type="text" id="sum" readonly>
         </td>
       </tr>
       <tr>
        <td>상세설명</td>
         <td >
            펫팔 미니샵의 상품입니다. 
         </td>
       </tr>
     </table>
                                                      
    <button id='basket'>장바구니/구매</button>


</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
   item();   
})
.on('click','#basket',function(){
	let orderid=$("#id").val();
	let userid=$("#userid").val();
    let title=$(".itemName").text();
    let price=$(".itemPrice").text();
    let img=$(".item_img").attr("src");
    let count=$("#result").val();
    let amount = price * count;
    
    console.log("orderid: ",orderid)
    console.log("userid: ",userid)
    console.log("title: ",title)
    console.log("price: ",price)
    console.log("img: ",img)
    console.log("count: ",count)
    console.log("amount: ",amount)
    
    $.ajax({
        type: 'post', 
        url: '/basket', 
        data: {
        	orderid: orderid,
        	userid: userid,
            title: title,
            price: price,
            count: count,
            amount: amount,
            img: img
        }, 
        dataType:'text',
        success: function(data) {
            if(data==="1"){
            	console.log('상품이 장바구니에 추가되었습니다.');
            	window.close();
            }
        }
	})
});

function item(){
   $.ajax({
      type: 'post', 
        url: '/itemLoad',
        data: {id:$('#id').val()}, 
        dataType: 'json',
        success: function(data) {
        
           $('.itemName').text(data.title); // 이름
           $('.itemPrice').text(data.price); //개별 아이디
           $('#sum').val(data.price);
          
        }
   });
} 

function count(type){
	   let number=$('#result').val();
	    if(type === 'plus') {
	         number = parseInt(number) + 1;
	     }else if(type === 'minus')  {
	         number = parseInt(number) - 1;
	         if(number<1){
	            return false;
	         }
	   }
	    $('#result').val(number); // 수량
	    $('#sum').val(number*$('.itemPrice').text()); // 총 구매 가격 
	}

</script>
</html>
