<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/theme.css" />
<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
<title>미니샵</title>
</head>
<style>
main {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: flex-start;
  }
   .pet_item {
    width: calc(25% - 20px);
    margin-bottom: 20px;
    box-sizing: border-box;
  }
  .pet_item a {
    text-decoration: none;
    color: inherit;
    display: block; /* 앵커 요소를 블록 요소로 변경하여 이미지와 텍스트가 세로로 배치되도록 합니다. */
    text-align: center; /* 텍스트를 가운데 정렬합니다. */
  }

  .pet_item img {
    width: 100%;
    height: auto;
  }

 .pet_item-image {
  width: 100%;
  height: 300px;
  overflow: hidden;
  display: flex;
  align-items: center;
}

.pet_item-image img {
  width: 100%;
}

#middle_area .row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0 -15px;
}

#middle_area  {
    padding: 0 15px;
    margin-bottom: 20px; /* 각 요소의 아래쪽 여백 추가 */
}
.item_img{
   width: 100%;
   height: 300px;
   overflow: hidden; 
   display: flex;
   align-items: center;
   
}

</style>
<body>

  <header id="herder">
      <%@ include file="include/header.jsp" %>
  </header>

  <main>
   
      <h1>애견용품</h1>
      <hr >
     <div id="middle_area">
     
       <div class="row" >           
           <c:forEach items="${itemList}" var="item">
            <input type="hidden" id="id" value=${item.id }>
               <div class="pet_item">     
                <a href="#" onclick="openPop(${item.id });">
                 <div style="text-align: center; padding: 30px;">
                   <div class=item_img >
                   <img style="width: 100%;  "src="/image/${item.img}" alt="상품이미지"/>  
                   </div>
                   <div>
                     <h4 >${item.title}</h4>
                     <fmt:formatNumber pattern="###,###" value="${item.price}" />원                 
                   </div>
                 </div>
                 </a>
            </div>
           </c:forEach>
       
       
      </div>

  </main>


</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
   
})
.on('click','#buy',function(){
   openPop();
})
 function openPop(id){
  var popup = window.open('http://localhost:8081/goodorder?id='+id, '리뷰', 'width=700px,height=800px,scrollbars=yes');
 
}   

</script>

</html>