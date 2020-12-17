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
	<title>DAILY WRITER</title>
</head>
<body>
	<div class="background">
		<div class="total-area">
			<div class="form-box">
				<p class="form-title">SIGN·IN</p>
		
				<form method="POST" action="signIn.jsp">
					<p class="normal-input-label">E·MAIL</p><input class="normal-input" type="text" name="userEmail"/>
					<p class="normal-input-label">PW</p><input class="normal-input" type="password" name="userPassword"/>
					<input class="normal-button-2" type="submit" value="로그인 하기">
					<a href="findPasswordForm.jsp">
						<div class="normal-button">
							<p class="normal-button-text">비밀번호 찾기</p>
						</div>
					</a>
					<a href="signUpForm.jsp">
						<div class="normal-button">
							<p class="normal-button-text">회원가입</p>
						</div>
					</a>
					<div class="error-box"><%= errorList.get(errorType) %></div>
				</form>
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
	margin: 34px 0 0 30px;
	width: 120px;
	font-size: 24px;
	font-weight: 700;
}

.normal-input {
	float: left;
	width: 500px;
	height: 60px;
	margin: 20px 0 50px 0;
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

.normal-button {
	float: left;
	margin: 40px 0 10px 50px;
	width: 300px;
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

.normal-button:hover {
	cursor: pointer;
	background-color: #96C7ED;
}

.normal-button-text {
	color: white;
	font-size: 18px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.error-box {
	float: left;
	margin: 40px 0 0 50px;
	text-shadow: 4px;
	font-size: 18px;
	font-weight: 600;
	
}
</style>