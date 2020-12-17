<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	Long userId = Long.parseLong(session.getAttribute("userId").toString());
	Long newFriendUserId = Long.parseLong(request.getParameter("userId"));
	
	FriendDao friendDao = new FriendDao();
	
	Long saveFriendResult = friendDao.addFriend(userId, newFriendUserId);
	
	if(saveFriendResult == -1) {
		response.sendRedirect("list.jsp?errorMessage=1");
	} else {
		response.sendRedirect("list.jsp?newFrienduserId=" + newFriendUserId + "&savedUserRelationId=" + saveFriendResult);
	}
%>