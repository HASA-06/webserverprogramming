package friend;

public class FriendDto {
	private Long userRelationId;
	private Long userId;
	private String userNickname;
	private String userEmail;
	
	public void setUserRelationId(Long userRelationId) {
		this.userRelationId = userRelationId;
	}
	
	public Long getUserRelationId() {
		return this.userRelationId;
	}
	
	public Long getUserId() {
		return this.userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public String getUserEmail() {
		return this.userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getUserNickname() {
		return this.userNickname;
	}
	
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
}
