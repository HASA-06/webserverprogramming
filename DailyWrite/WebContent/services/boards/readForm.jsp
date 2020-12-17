<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	Long boardId = Long.parseLong(request.getParameter("boardId"));
	BoardDao boardDao = new BoardDao();

	BoardDto boardDto = boardDao.read(boardId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="background">
		<div class="total-area">
			<div class="form-box">
				<p class="form-title">글내용</p>
				<div class="no"><%= boardDto.getBoardId() %></div>
				<div class="title"><%= boardDto.getBoardTitle() %></div>
				<div class="content"><%= boardDto.getUserId() %></div>
				<div class="normal-textarea"><%= boardDto.getBoardContent() %></div>
				
				<div class="normal-button"><a href="list.jsp"><p class="normal-button-text">목록으로 가기</p></a></div>
				
				<%
					if(boardDto.getUserId() == Long.parseLong(session.getAttribute("userId").toString())) {
				%>
					<div class="normal-button">
						<a href="updateForm.jsp?boardId=<%= boardDto.getBoardId( )%>">
							<p class="normal-button-text">수정하기</p>
						</a>
					</div>
					<div class="normal-button">
						<a href="delete.jsp?boardId=<%= boardDto.getBoardId( )%>">
							<p class="normal-button-text">삭제하기</p>
						</a>
					</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>

<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

a { text-decoration:none ; color:#000000}

.total-area {
	width: 100%;
	padding-top: 100px;
}


.background {
	background: url("../../assets/commons/background.jpeg");
	border: 0;
	padding: 0;
	min-height: 100%;
	background-position: center;
	background-size: cover;
}

.form-box {
	margin: auto;
	background-color: white;
	width: 800px;
	height: 700px;
	border-radius: 10px;
	border: 3px solid black;
}

.form-title {
	float: left;
	margin: 20px auto 60px 20px;
	font-weight: 800;
	font-size: 40px;
	width: 100%;
	font-family: Impact, Charcoal, sans-serif;
}

form {
	float: left;
	margin: 20px auto 20px 20px;
}

.normal-textarea {
	float: left;
	width: 700px;
	height: 220px;
	margin: 30px 0 30px 50px;
	background-color: white;
	border: 2px solid #28A0FF;
	border-radius: 10px;
	font-size: 24px;
	font-weight: 700;
	padding: 20px;
}

.no {
	float: left;
	padding-left: 50px;
	width: 100px;
	font-size: 24px;
	font-family: Impact, Charcoal, sans-serif;
	font-weight: 600;
}

.title {
	float: left;
	width: 520px;
	text-align: left;
	font-size: 24px;
	font-family: Impact, Charcoal, sans-serif;
	font-weight: 600;
}

.content {
	float: left;
	width: 100px;
	font-size: 24px;
	font-family: Impact, Charcoal, sans-serif;
	font-weight: 600;
}

.normal-button {
	float: left;
	margin: 40px 0 10px 50px;
	width: 200px;
	height: 40px;
	background-color: #28A0FF;
	border-radius: 10px;
	border: 2px solid #28A0FF;
	text-align: center;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.normal-button:hover {
	cursor: pointer;
	background-color: #96C7ED;
}

.normal-button-text {
	margin-top: 10px;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}
</style>