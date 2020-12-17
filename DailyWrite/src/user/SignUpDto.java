package user;

public class SignUpDto {
	private Long userId;
	private String userEmail;
	private String userPassword;
	private String userNickname;
	private String userPhonenumber;
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public Long getUserId() {
		return this.userId;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getUserEamil() {
		return this.userEmail;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserPassword() {
		return this.userPassword;
	}
	
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	public String getUserNickname() {
		return this.userNickname;
	}
	
	public void setUserPhonenumber(String userPhonenumber) {
		this.userPhonenumber = userPhonenumber;
	}
	
	public String getUserPhonenumber() {
		return this.userPhonenumber;
	}
}
