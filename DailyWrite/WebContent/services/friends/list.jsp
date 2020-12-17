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
	<a href="/daily_write/services/boards/list.jsp"><div>글 목록으로 가기</div></a>
	<div>
		친구목록
		<table>
			<tr>
				<th>ID</th>
				<th>닉네임</th>
				<th>Email</th>
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
						<td><div><a href="delete.jsp?userRelationId=<%= myFriendList.get(i).getUserRelationId() %>">친구에서 제외</a></div></td>
				</tr>
		<%
				}
			}
		%>
		</table>
	</div>
	
	<div>
		<table>
			<tr>
				<th>ID</th>
				<th>닉네임</th>
				<th>Email</th>
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
						<td><div><a href="add.jsp?userId=<%= userList.get(i).getUserId() %>">친구로 삼기</a></div></td>
				</tr>
		<%
				}
			}
		%>
		</table>
	</div>
	<div><%= errorList.get(errorType.intValue()) %></div>
</body>
</html>