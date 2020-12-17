package user;

public class SignInDto {
	private String userEmail;
	private String userPassword;
	
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
}
