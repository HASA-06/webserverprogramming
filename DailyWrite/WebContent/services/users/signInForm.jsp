<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int errorType = request.getParameter("errorMessage") == null ? 0 : Integer.parseInt(request.getParameter("errorMessage"));
	
	List<String> errorList = new ArrayList<>();
	errorList.add("");
	errorList.add("데이터베이스 에러, 관리자에게 문의하세요");
	errorList.add("비밀번호가 일치하지 않습니다");
	errorList.add("가입된 유저가 존재하지 않습니다");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인
	<form method="POST" action="signIn.jsp">
		<input type="text" name="userEmail"/>
		<input type="password" name="userPassword"/>
		<input type="submit" value="로그인 하기">
	</form>
	<div><a href="findPasswordForm.jsp">비밀번호 찾기</a></div>
	<div><a href="signUpForm.jsp">회원가입</a></div>
	<div><%= errorList.get(errorType) %></div>
</body>
</html>