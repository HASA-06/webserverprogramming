<%@page import="user.UserDao"%>
<%@page import="user.FindPasswordDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");

	final int SUCCESS = 0;
	
	String userEmail = request.getParameter("userEmail");
	String userPhonenumber = request.getParameter("userPhonenumber");
	String userPassword = request.getParameter("userPassword");
	String userPasswordAccept = request.getParameter("userPasswordAccept");
	
	UserDao userDao = new UserDao();
	FindPasswordDto findPasswordDto = new FindPasswordDto();
	
	findPasswordDto.setUserEmail(userEmail);
	findPasswordDto.setUserPhonenumber(userPhonenumber);
	findPasswordDto.setUserPassword(userPassword);
	
	if(!userPassword.equals(userPasswordAccept)) {
		response.sendRedirect("findPasswordForm.jsp?errorMessage=3");
	} else {
		int findPasswordResult = userDao.findPassword(findPasswordDto);
		
		if(findPasswordResult == SUCCESS) {
			response.sendRedirect("signInForm.jsp");
		} else {
			response.sendRedirect("findPasswordForm.jsp?errorMessage=" + findPasswordResult );
		}
	}
%>