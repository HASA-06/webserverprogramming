<%@page import="user.UserDto"%>
<%@page import="user.SignInDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	final int SUCCESS = 0;
	
	String userEmail = request.getParameter("userEmail");
	String userPassword = request.getParameter("userPassword");
	
	UserDao userDao = new UserDao();
	SignInDto signInDto = new SignInDto();
	
	signInDto.setUserEmail(userEmail);
	signInDto.setUserPassword(userPassword);
	
	UserDto signInResult = userDao.signIn(signInDto);
	
	if(userEmail.equals("") || userPassword.equals("")) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("signInForm.jsp?errorMessage=" + 2);
	} else {
		if(signInResult != null) {
			session.setAttribute("userId", signInResult.getUserId());
			session.setAttribute("userEmail", signInResult.getUserEmail());
			session.setAttribute("userNickname", signInResult.getUserNickname());
			
			response.sendRedirect("/daily_write/services/boards/list.jsp");
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("signInForm.jsp?errorMessage=" + 1);
		}
	}
%>
