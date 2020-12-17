<%@page import="board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BoardDao boardDao = new BoardDao();

	List<BoardDto> boardDataList = boardDao.list();
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
			<div class="ml-20">
				<p class="sub-title-text">Board List</p>
				<div class="normal-button">
					<a href="createForm.jsp">
						<p class="normal-button-text">등록하기</p>
					</a>
				</div>
				<div class="normal-button">
				<a href="/daily_write/services/friends/list.jsp">
					<p class="normal-button-text">친구 목록으로</p>
				</a>
				
			</div>
			</div>
		</div>
		<div class="total-area">
			<table>
				<tr>
					<th class="no">No</th>
					<th >TITLE</th>
					<th class="userId">USER ID</th>
				</tr>
			<%
				if(boardDataList == null) {
			%>
				<tr>
					<td>게시글이 존재하지 않습니다 :(</td>
				</tr>
			<%
				} else {
					for(int i = 0; i < boardDataList.size(); i++) {
			%>
					<tr>
						
							<td class="no"><%= i + 1 %></td>
							<td class="title">
								<a href="readForm.jsp?boardId=<%= boardDataList.get(i).getBoardId() %>">
									<%= boardDataList.get(i).getBoardTitle() %>
								</a>
							</td>
							<td class="userId"><%= boardDataList.get(i).getUserId() %></td>
						
					</tr>
			<%
					}
				}
			%>
			</table>
		</div>
	</div>
</body>
</html>

<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

a { text-decoration:none ; color:#000000}

.total-area {
	width: 100%;
	padding-top: 10px;
}

.ml-20 {
	margin-left: 100px;
	margin-bottom: 50px;
}

.background {
	background: url("../../assets/commons/background.jpeg");
	border: 0;
	padding: 0;
	min-height: 100%;
	background-position: center;
	background-size: cover;
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

table {
	margin: 0 auto 0 auto;
	width: 1000px;
	background-color: white;
	border-radius: 10px;
	border: 1.5px solid #28A0FF;
}

tr {
	font-size: 24px;
	font-family: Impact, Charcoal, sans-serif;
	font-weight: 600;
}

th {
	background-color: #28A0FF;
}

td {
	font-size: 30px;
	font-family: Georgia, Serif;
	font-weight: 500;
	text-align: center;
}

.no {
	width: 100px;
}

.title {
	width: 740px;
	text-align: left;
	padding-left: 10px;
}

.userId {
	width: 100px;
}

.sub-title-text {
	margin-left: 50px;
	font-size: 60px;
	font-weight: 900;
	color: white;
	font-family: Georgia, Serif;
}
</style>