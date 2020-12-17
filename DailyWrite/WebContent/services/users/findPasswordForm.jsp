<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int errorType = request.getParameter("errorMessage") == null ? 0 : Integer.parseInt(request.getParameter("errorMessage"));
	
	List<String> errorList = new ArrayList<String>();
	errorList.add("");
	errorList.add("데이터베이스 에러, 관리자에게 문의하세요");
	errorList.add("해당되는 유저 정보가 없습니다");
	errorList.add("비밀번호와 비밀번호 확인이 일치하지 않습니다");
	errorList.add("공란없이 전부 채워주세요");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	<title>DAILY WRITER</title>
</head>
<body>
	<div class="background">
		<div class="total-area">
			<div class="form-box">
				<p class="form-title">비밀번호 변경</p>
				<form method="POST" action="findPassword.jsp">
					<p class="normal-input-label">E·MAIL</p><input class="normal-input" type="text" name="userEmail"/>
					<p class="normal-input-label">PHONE</p><input class="normal-input" type="text" name="userPhonenumber"/>
					<p class="normal-input-label">N PW</p><input class="normal-input" type="password" name="userPassword"/>
					<p class="normal-input-label">N PWR</p><input class="normal-input" type="password" name="userPasswordAccept"/>
					<input class="normal-button-2" type="submit" value="비밀번호 변경하기">
					<div class="normal-button-2"><a href="signInForm.jsp"><p class="normal-button-2-text">로그인 화면으로</p></a></div>
				</form>
				
				<div class="error-box"><%= errorList.get(errorType) %></div>
			</div>
		</div>
	</div>
</body>

<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

a { text-decoration:none ; color:#000000}

.total-area {
	width: 100%;
	padding-top: 100px;
}


.background {
	background: url("../../assets/commons/background.jpeg");
	border: 0;
	padding: 0;
	min-height: 100%;
	background-position: center;
	background-size: cover;
}

.form-box {
	margin: auto;
	background-color: white;
	width: 800px;
	height: 700px;
	border-radius: 10px;
	border: 3px solid black;
}

.form-title {
	float: left;
	margin: 20px auto 20px 20px;
	font-weight: 800;
	font-size: 40px;
	font-family: Impact, Charcoal, sans-serif;
}

form {
	float: left;
	margin: 20px auto 20px 20px;
}


.normal-input-label {
	float: left;
	display: block;
	margin: 14px 0 0 30px;
	width: 120px;
	font-size: 24px;
	font-weight: 700;
}

.normal-input {
	float: left;
	width: 500px;
	height: 40px;
	margin: 10px 0 30px 0;
	background-color: white;
	border: 2px solid #28A0FF;
	border-radius: 10px;
	font-size: 24px;
	font-weight: 700;
}

.normal-input:active {
	border: 2px solid #96C7ED;
}

.normal-button-2 {
	float: left;
	margin: 10px 0 0 80px;
	width: 600px;
	height: 60px;
	background-color: #28A0FF;
	border-radius: 10px;
	border: 2px solid #28A0FF;
	text-align: center;
	color: white;
	font-size: 18px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.normal-button-2:hover{
	cursor: pointer;
	background-color: #96C7ED;
}

.normal-button-2-text {
	color: white;
	font-size: 18px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.error-box {
	float: left;
	margin: 20px 0 0 50px;
	text-shadow: 4px;
	font-size: 18px;
	font-weight: 600;
	
}
</style>