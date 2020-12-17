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
	errorList.add("중복된 아이디 입니다");
	errorList.add("비밀번호와 비밀번호 확인이 일치하지 않습니다");
	errorList.add("핸드폰번호는 11자리입니다");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	<title>DAILY WRITER</title>
</head>
<body>
	회원가입
	<form method="POST" action="signUp.jsp">
		<input type="text" name="userEmail"/>
		<input type="password" name="userPassword"/>
		<input type="password" name="userPasswordAccept"/>
		<input type="text" name="userNickname"/>
		<input type="text" name="userPhonenumber"/>
		<input type="submit" value="회원가입 하기">
	</form>
	<div><a href="signInForm.jsp">로그인 화면으로</a></div>
	<div><%= errorList.get(errorType) %></div>
</body>

<style>
body {
	background: url("assets/commons/background.jpeg");
}
</style>