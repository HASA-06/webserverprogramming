<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	Long boardId = Long.parseLong(request.getParameter("boardId"));

	int errorType = request.getParameter("errorMessage") == null ? 0 : Integer.parseInt(request.getParameter("errorMessage"));
	
	List<String> errorList = new ArrayList<>();
	errorList.add("");
	errorList.add("데이터베이스 에러, 관리자에게 문의하세요");
	errorList.add("타이틀, 내용에 빈 내용은 입력하실 수 없습니다.");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="background">
		<div class="total-area">
			<div class="form-box">
				<p class="form-title">수정하기</p>
				<form method="POST" action="update.jsp">
					<input type="hidden" name="boardId" value="<%= boardId %>"/>
					<p class="normal-input-label">Title</p><input class="normal-input" type="text" name="boardTitle"/>
					<p class="normal-input-label">Content</p><textarea class="normal-textarea" name="boardContent" rows="5"></textarea>
					<input class="normal-button-2" type="submit" value="수정하기">
					<div class="normal-button-2"><a href="readForm.jsp?boardId=<%= boardId %>"><p class="normal-button-2-text">글로 돌아가기</p></a></div>
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

.normal-textarea {
	float: left;
	width: 500px;
	height: 220px;
	margin: 10px 0 30px 0;
	background-color: white;
	border: 2px solid #28A0FF;
	border-radius: 10px;
	font-size: 24px;
	font-weight: 700;
	padding: 20px;
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