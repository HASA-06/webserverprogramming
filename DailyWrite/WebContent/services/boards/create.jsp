<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	final int SUCCESS = 0;
	
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = new BoardDto();
	
	boardDto.setBoardTitle(boardTitle);
	boardDto.setBoardContent(boardContent);
	boardDto.setUserId(Long.parseLong(session.getAttribute("userId").toString()));
	
	if(boardTitle.equals("") || boardContent.equals("")) {
		response.sendRedirect("createForm.jsp?errorMessage=2");
	} else {
		boolean isCreate = boardDao.save(boardDto);
		
		if(isCreate) {
			response.sendRedirect("list.jsp");
		} else {
			response.sendRedirect("createForm.jsp?errorMessage=1");
		}
	}
%>