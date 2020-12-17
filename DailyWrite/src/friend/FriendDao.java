package friend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import daily_write.Config;
import user.UserDto;

public class FriendDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private final int DATABASE_ERROR=1;
	private final int SUCCESS=0;
	
	public FriendDao() {
		Config config = new Config();
		
		try {
			Class.forName(config.getDriverName());
			conn = DriverManager.getConnection(config.getDBUrl(), config.getId(), config.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<FriendDto> friendList(Long userId) {
		final String FIND_FRIEND_QUERY = "SELECT \r\n"
				+ "    u.user_id,\r\n"
				+ "    u.user_email,\r\n"
				+ "    u.user_nickname,\r\n"
				+ "    IFNULL(ur.user_relation_id, - 1) AS is_friend\r\n"
				+ "FROM\r\n"
				+ "    user AS u\r\n"
				+ "LEFT JOIN\r\n"
				+ "	(\r\n"
				+ "		SELECT\r\n"
				+ "			*\r\n"
				+ "		FROM\r\n"
				+ "			user_relation AS ur\r\n"
				+ "		WHERE\r\n"
				+ "			ur.owner_user_id = ?\r\n"
				+ "    ) AS ur\r\n"
				+ "ON u.user_id = ur.friend_user_id\r\n"
				+ "WHERE u.user_id != ?;";
		
		try {
			pstmt = conn.prepareStatement(FIND_FRIEND_QUERY);
			
			pstmt.setLong(1, userId);
			pstmt.setLong(2, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<FriendDto> friendList = new ArrayList<FriendDto>();
				FriendDto friendDto;
				
				do {
					friendDto = new FriendDto();
					friendDto.setUserRelationId(rs.getLong(4));
					friendDto.setUserId(rs.getLong(1));
					friendDto.setUserEmail(rs.getString(2));
					friendDto.setUserNickname(rs.getString(3));
					
					friendList.add(friendDto);
				} while(rs.next());
				
				
				conn.close();
				
				return friendList;
			} else {
				conn.close();
				
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Long addFriend(Long ownerUserId, Long friendUserId) {
		final String ADD_FRIEND_QUERY = "INSERT INTO user_relation VALUES (?, ?, ?)";
		final String GET_LAST_FRIEND = "SELECT user_relation_id FROM user_relation WHERE owner_user_id = ? AND friend_user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(ADD_FRIEND_QUERY);
			
			pstmt.setString(1, null);
			pstmt.setLong(2, ownerUserId);
			pstmt.setLong(3, friendUserId);
			
			if(pstmt.executeUpdate() == 1) {
				pstmt = conn.prepareStatement(GET_LAST_FRIEND);
				
				pstmt.setLong(1, ownerUserId);
				pstmt.setLong(2, friendUserId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Long newUserRelationId = rs.getLong(1);
					
					return newUserRelationId;
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return (long)DATABASE_ERROR;
	}
	
	public boolean deleteFriend(Long userRelationId) {
		final String DELETE_FRIEND_QUERY = "DELETE FROM user_relation WHERE user_relation_id = ?";
		
		try {
			pstmt = conn.prepareStatement(DELETE_FRIEND_QUERY);
			
			pstmt.setLong(1, userRelationId);
			
			pstmt.executeUpdate();
			
			conn.close();
			
			return true;
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
}
