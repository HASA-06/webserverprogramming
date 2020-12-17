package friend;

public class UserRelationDto {
	private Long userRelationId;
	private Long ownerUserId;
	private Long friendUserId;
	
	public Long getUserRelationId() {
		return this.userRelationId;
	}
	
	public void setUserRelationId(Long userRelationId) {
		this.userRelationId = userRelationId;
	}
	
	public Long getOwnerUserId() {
		return this.ownerUserId;
	}
	
	public void setOwnerUserId(Long ownerUserId) {
		this.ownerUserId = ownerUserId;
	}
	
	public Long getFriendUserId() {
		return this.friendUserId;
	}
	
	public void setFriendUserId(Long friendUserId) {
		this.friendUserId = friendUserId;
	}
}
