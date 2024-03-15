<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/notice.css" />
    <link rel="stylesheet" href="css/noticecss.css" />
</head>
<body>
<form method="post" action="/upload" enctype="multipart/form-data">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항-수정</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <input type=hidden name="id" value="${alList.id}">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" value="${alList.title}"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <%
    						String email = (String) session.getAttribute("email");
							String admin = email.split("@")[0];
						%>
                        <dd><input type="text" name="writer" value="<%= admin %>" readonly></dd>
                    </dl>
                    <dl>
                        <dt>파일 추가</dt>
                        <dd><input type="file" name='file' id="n_image"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="detail">${alList.detail}</textarea>
                </div>
            </div>
            <div class="bt_wrap">
            	<input class="on1" type="submit" id="notice" value="수정">
                <a href="/notice">취소</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>
