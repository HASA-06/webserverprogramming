<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	Long boardId = Long.parseLong(request.getParameter("boardId"));
	
	BoardDao boardDao = new BoardDao();
	
	boolean isDelete = boardDao.delete(boardId);
	
	if(isDelete) {
		response.sendRedirect("list.jsp");
	} else {
		response.sendRedirect("readForm.jsp?boardId=" + boardId);
	}
%>