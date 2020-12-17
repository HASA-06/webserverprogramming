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
	<div><%= boardDto.getBoardId() %></div>
	<div><%= boardDto.getBoardTitle() %></div>
	<div><%= boardDto.getUserId() %></div>
	<div><%= boardDto.getBoardContent() %></div>
	
	<a href="list.jsp">목록으로 가기</a>
	
	<%
		if(boardDto.getUserId() == Long.parseLong(session.getAttribute("userId").toString())) {
	%>
			<a href="updateForm.jsp?boardId=<%= boardDto.getBoardId( )%>">
				<div>수정하기</div>
			</a>
			<a href="delete.jsp?boardId=<%= boardDto.getBoardId( )%>">
				<div>삭제하기</div>
			</a>
	<%
		}
	%>
</body>
</html>