<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	final int SUCCESS = 0;
	
	Long boardId = Long.parseLong(request.getParameter("boardId"));
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	Long userId = Long.parseLong(session.getAttribute("userId").toString());
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = new BoardDto();
	
	boardDto.setBoardId(boardId);
	boardDto.setBoardTitle(boardTitle);
	boardDto.setBoardContent(boardContent);
	boardDto.setUserId(userId);
	
	if(boardId == null || boardTitle == null || boardTitle.equals("") || boardContent == null || boardContent.equals("") || userId == null) {
		response.sendRedirect("updateForm.jsp?boardId=" + boardId + "&errorMessage=2");
	} else {
		boolean isUpdate = boardDao.update(boardDto);
		
		if(isUpdate) {
			response.sendRedirect("readForm.jsp?boardId=" + boardId);
		} else {
			response.sendRedirect("updateForm.jsp?boardId=" + boardId + "&errorMessage=1");
		}
	}
%>