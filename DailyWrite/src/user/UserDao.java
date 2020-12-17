package user;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import daily_write.Config;

public class UserDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private final int DATABASE_ERROR=1;
	private final int SUCCESS=0;
	
	public UserDao() {
		Config config = new Config();
		
		try {
			Class.forName(config.getDriverName());
			conn = DriverManager.getConnection(config.getDBUrl(), config.getId(), config.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public UserDto signIn(SignInDto signInDto) {
		final String SIGN_IN_QUERY = "SELECT * FROM user WHERE user_email=?";
		
		try {
			pstmt = conn.prepareStatement(SIGN_IN_QUERY);
			
			pstmt.setString(1, signInDto.getUserEamil());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(3).equals(signInDto.getUserPassword())) {
					UserDto userDto = new UserDto();
					userDto.setUserId(rs.getLong(1));
					userDto.setUserEmail(rs.getString(2));
					userDto.setUserNickname(rs.getString(4));
					
					conn.close();
					
					return userDto;
				} else {
					conn.close();
					
					return null;
				}
			}
			
			conn.close();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int signUp(SignUpDto signUpDto) {
		final String DUPLICATE_CHECK_QUERY = "SELECT * FROM user WHERE user_email=?";
		final String SIGN_UP_QUERY = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(DUPLICATE_CHECK_QUERY);
			
			pstmt.setString(1, signUpDto.getUserEamil());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				conn.close();
				
				return 2;
			} else {
				pstmt = conn.prepareStatement(SIGN_UP_QUERY);
				
				pstmt.setString(1, null);
				pstmt.setString(2, signUpDto.getUserEamil());
				pstmt.setString(3, signUpDto.getUserPassword());
				pstmt.setString(4, signUpDto.getUserNickname());
				pstmt.setString(5, signUpDto.getUserPhonenumber());
				
				pstmt.executeUpdate();
				
				conn.close();
				
				return SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return DATABASE_ERROR;
	}
	
	public int findPassword(FindPasswordDto findPasswordDto) {
		final String USER_CHECK_QUERY = "SELECT * FROM user WHERE user_email=? AND user_phonenumber=?";
		final String PASSWORD_CHANGE_QUERY = "UPDATE user SET user_password=? WHERE user_email=? AND user_phonenumber=?";
		
		try {
			pstmt = conn.prepareStatement(USER_CHECK_QUERY);
			
			pstmt.setString(1, findPasswordDto.getUserEamil());
			pstmt.setString(2, findPasswordDto.getUserPhonenumber());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement(PASSWORD_CHANGE_QUERY);
				
				pstmt.setString(1, findPasswordDto.getUserPassword());
				pstmt.setString(2, findPasswordDto.getUserEamil());
				pstmt.setString(3, findPasswordDto.getUserPhonenumber());
				
				pstmt.executeUpdate();
				
				conn.close();
				
				return SUCCESS;
			} else {
				conn.close();
				return 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return DATABASE_ERROR;
	}
}
