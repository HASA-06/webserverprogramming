package user;

public class FindPasswordDto {
	private String userEmail;
	private String userPassword;
	private String userPhonenumber;
	
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
	
	public void setUserPhonenumber(String userPhonenumber) {
		this.userPhonenumber = userPhonenumber;
	}
	
	public String getUserPhonenumber() {
		return this.userPhonenumber;
	}
}
