<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	Long userRelationId = Long.parseLong(request.getParameter("userRelationId"));
	
	FriendDao friendDao = new FriendDao();
	
	boolean isDelete = friendDao.deleteFriend(userRelationId);
	
	if(!isDelete) {
		response.sendRedirect("list.jsp?errorMessage=1");
	} else {
		response.sendRedirect("list.jsp?deleteUserRelationId=" + userRelationId);
	}
%>