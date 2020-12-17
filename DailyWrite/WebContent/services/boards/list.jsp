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
	<div>
		<a href="createForm.jsp">
			<div>등록하기</div>
		</a>
		<a href="/daily_write/services/friends/list.jsp">
			<div>친구 목록으로</div>
		</a>
		<table>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>유저</th>
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
					
						<td><%= i %></td>
						<td>
							<a href="readForm.jsp?boardId=<%= boardDataList.get(i).getBoardId() %>">
								<%= boardDataList.get(i).getBoardTitle() %>
							</a>
						</td>
						<td><%= boardDataList.get(i).getUserId() %></td>
					
				</tr>
		<%
				}
			}
		%>
		</table>
	</div>
</body>
</html>