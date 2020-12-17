<%@page import="user.SignUpDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <%
	request.setCharacterEncoding("UTF-8");
	final int SUCCESS = 0;
	
	String userEmail = request.getParameter("userEmail");
	String userPassword = request.getParameter("userPassword");
	String userPasswordAceept = request.getParameter("userPasswordAccept");
	String userNickname = request.getParameter("userNickname");
	String userPhonenumber = request.getParameter("userPhonenumber");
	
	UserDao userDao = new UserDao();
	SignUpDto signUpDto = new SignUpDto();
	
	signUpDto.setUserEmail(userEmail);
	signUpDto.setUserPassword(userPassword);
	signUpDto.setUserNickname(userNickname);
	signUpDto.setUserPhonenumber(userPhonenumber);
	
	int signUpResult = userDao.signUp(signUpDto);
	
	if(!userPassword.equals(userPasswordAceept)) {
		response.sendRedirect("signUpForm.jsp?errorMessage=3");
	} else if(userPhonenumber.length() != 11) {
		response.sendRedirect("signUpForm.jsp?errorMessage=4");
	} else {
		if(signUpResult == SUCCESS) {
			response.sendRedirect("signInForm.jsp");
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("signUpForm.jsp?errorMessage=" + signUpResult);
		}
	}
%>
 