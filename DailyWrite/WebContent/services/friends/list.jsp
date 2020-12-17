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
	errorList.add("�����ͺ��̽� ����, �����ڿ��� �����ϼ���");
	errorList.add("Ÿ��Ʋ, ���뿡 �� ������ �Է��Ͻ� �� �����ϴ�.");
	
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
	<a href="/daily_write/services/boards/list.jsp"><div>�� ������� ����</div></a>
	<div>
		ģ�����
		<table>
			<tr>
				<th>ID</th>
				<th>�г���</th>
				<th>Email</th>
			</tr>
		<%
			if(myFriendList == null || myFriendList.size() == 0) {
		%>
			<tr>
				<td>���� ģ���� ���������ʾƿ�. ��û���ּ��� :(</td>
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
						<td><div><a href="delete.jsp?userRelationId=<%= myFriendList.get(i).getUserRelationId() %>">ģ������ ����</a></div></td>
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
				<th>�г���</th>
				<th>Email</th>
			</tr>
		<%
			if(userList == null || userList.size() == 0) {
		%>
			<tr>
				<td>ģ���� ���� ����� �������� �ʾƿ� :(</td>
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
						<td><div><a href="add.jsp?userId=<%= userList.get(i).getUserId() %>">ģ���� ���</a></div></td>
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