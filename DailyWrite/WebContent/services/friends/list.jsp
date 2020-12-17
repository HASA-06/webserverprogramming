<%@page import="java.util.ArrayList"%>
<%@page import="friend.FriendDto"%>
<%@page import="friend.FriendDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	Long newFriendUserId = request.getParameter("newFriendUserId") == null ? null : Long.parseLong(request.getParameter("newFriendUserId"));
	Long savedUserRelationId = request.getParameter("savedUserRelationId") == null ? null : Long.parseLong(request.getParameter("savedUserRelationId"));
	Long errorType = request.getParameter("errorMessage") == null ? 0 : Long.parseLong(request.getParameter("errorMessage"));
	Long deleteUserRelationId = request.getParameter("deleteUserRelationId") == null ? 0 : Long.parseLong(request.getParameter("deleteUserRelationId"));
	
	List<String> errorList = new ArrayList<>();
	errorList.add("");
	errorList.add("데이터베이스 에러, 관리자에게 문의하세요");
	errorList.add("타이틀, 내용에 빈 내용은 입력하실 수 없습니다.");
	
	FriendDao friendDao = new FriendDao();

	List<FriendDto> friendDtoList = friendDao.friendList(Long.parseLong(session.getAttribute("userId").toString()));
	List<FriendDto> myFriendList = new ArrayList<FriendDto>();
	List<FriendDto> userList = new ArrayList<FriendDto>();
	
	if(friendDtoList != null && friendDtoList.size() != 0) {
		for(int i = 0; i < friendDtoList.size(); i++) {
			if(newFriendUserId != null && savedUserRelationId != null) {
				if(friendDtoList.get(i).getUserId() == newFriendUserId) {
					friendDtoList.get(i).setUserRelationId(savedUserRelationId);
				}
			}
			
			if(deleteUserRelationId != null) {
				if(friendDtoList.get(i).getUserRelationId() == deleteUserRelationId) {
					int returnValue = -1;
					
					friendDtoList.get(i).setUserRelationId((long)returnValue);
				}
			}
			
			if(friendDtoList.get(i).getUserRelationId() == -1) {
				userList.add(friendDtoList.get(i));
			} else {
				myFriendList.add(friendDtoList.get(i));
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="background">
		<div class="total-area">
			<div class="area">
				<div class="normal-button"><a href="/daily_write/services/boards/list.jsp"><p class="normal-button-text">글 목록으로 가기</a></div>
				<div class="half-area">
					<p>친구목록</p>
					<div>
						<table>
							<tr>
								<th>ID</th>
								<th>닉네임</th>
								<th>Email</th>
								<th></th>
							</tr>
						<%
							if(myFriendList == null || myFriendList.size() == 0) {
						%>
							<tr>
								<td>아직 친구가 존재하지않아요. 신청해주세요 :(</td>
							</tr>
						<%
							} else {
								for(int i = 0; i < myFriendList.size(); i++) {
						%>
								<tr>
									
										<td><%= myFriendList.get(i).getUserId() %></td>
										<td>
											<%= myFriendList.get(i).getUserNickname() %>
										</td>
										<td><%= myFriendList.get(i).getUserEmail() %></td>
										<td><div class="small-button"><a href="delete.jsp?userRelationId=<%= myFriendList.get(i).getUserRelationId() %>"><p class="small-button-text">친구에서 제외</p></a></div></td>
								</tr>
						<%
								}
							}
						%>
						</table>
					</div>
				</div>
				<div class="half-area ml-2">
					<p>유저목록</p>
					<div>
						<table>
							<tr>
								<th>ID</th>
								<th>닉네임</th>
								<th>Email</th>
								<th></th>
							</tr>
						<%
							if(userList == null || userList.size() == 0) {
						%>
							<tr>
								<td>친구로 삼을 사람이 존재하지 않아요 :(</td>
							</tr>
						<%
							} else {
								for(int i = 0; i < userList.size(); i++) {
						%>
								<tr>
									
										<td><%= userList.get(i).getUserId() %></td>
										<td>
											<%= userList.get(i).getUserNickname() %>
										</td>
										<td><%= userList.get(i).getUserEmail() %></td>
										<td><div class="small-button"><a href="add.jsp?userId=<%= userList.get(i).getUserId() %>"><p class="small-button-text">친구로 삼기</p></a></div></td>
								</tr>
						<%
								}
							}
						%>
						</table>
					</div>
				</div>
			</div>
			<div><%= errorList.get(errorType.intValue()) %></div>
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
	padding-top: 10px;
}


.background {
	background: url("../../assets/commons/background.jpeg");
	border: 0;
	padding: 0;
	min-height: 100%;
	background-position: center;
	background-size: cover;
}

.ml-2 {
	margin-left: 10%;
}

.half-area {
	float: left;
	width: 45%;
	background-color: white;
	border-radius: 10px;
}

.middle-area {
	float: left;
	width: 10%;
	background-color: black;
}

.half-area > p {
	padding-left: 20px;
	font-size: 24px;
	font-weight: 600;
	font-family: Impact, Charcoal, sans-serif;
}

.area {
	width: 1200px;
	margin: 0 auto 0 auto;
}


.normal-button {
	float: left;
	margin: 40px 800px 40px 50px;
	width: 200px;
	height: 40px;
	background-color: #28A0FF;
	border-radius: 10px;
	border: 2px solid #28A0FF;
	text-align: center;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.normal-button:hover {
	cursor: pointer;
	background-color: #96C7ED;
}

.normal-button-text {
	margin-top: 10px;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

table {
	margin: 0 auto 100px auto;
	width: 500px;
	background-color: white;
	border-radius: 10px;
	border: 1.5px solid #28A0FF;
}

tr {
	font-size: 14px;
	font-family: Impact, Charcoal, sans-serif;
	font-weight: 600;
}

th {
	background-color: #28A0FF;
}

td {
	font-size: 20px;
	font-family: Georgia, Serif;
	font-weight: 500;
	text-align: center;
}

.small-button {
	margin-left: 10px;
	width: 100px;
	height: 20px;
	background-color: #28A0FF;
	border-radius: 10px;
	border: 2px solid #28A0FF;
	text-align: center;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}

.small-button:hover {
	cursor: pointer;
	background-color: #96C7ED;
}

.small-button-text {
	margin: 0;
	color: white;
	font-size: 14px;
	font-weight: 800;
	font-family: Impact, Charcoal, sans-serif;
}
</style>