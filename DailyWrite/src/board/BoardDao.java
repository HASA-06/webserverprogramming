package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import daily_write.Config;

public class BoardDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDao() {
		Config config = new Config();
		
		try {
			Class.forName(config.getDriverName());
			conn = DriverManager.getConnection(config.getDBUrl(), config.getId(), config.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardDto> list() {
		final String LIST_QUERY = "SELECT * FROM board";
		
		try {
			pstmt = conn.prepareStatement(LIST_QUERY);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<BoardDto> boardList = new ArrayList<BoardDto>();
				BoardDto boardDto;
				do {
					boardDto = new BoardDto();
					boardDto.setBoardId(rs.getLong(1));
					boardDto.setBoardTitle(rs.getString(2));
					boardDto.setBoardContent(rs.getString(3));
					boardDto.setUserId(rs.getLong(4));
					
					boardList.add(boardDto);
				} while(rs.next());
				conn.close();
				
				return boardList;
			} else {
				conn.close();
				
				return null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean save(BoardDto boardDto) {
		final String SAVE_QUERY = "INSERT INTO board VALUES(?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SAVE_QUERY);
			pstmt.setString(1, null);
			pstmt.setString(2, boardDto.getBoardTitle());
			pstmt.setString(3, boardDto.getBoardContent());
			pstmt.setLong(4, boardDto.getUserId());
			
			pstmt.executeUpdate();
			
			conn.close();
			
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean update(BoardDto boardDto) {
		final String FIND_ONE_QUERY = "SELECT * FROM board WHERE board_id=? AND user_id=?";
		final String UPDATE_QUERY = "UPDATE board SET board_title=?, board_content=? WHERE board_id=? AND user_id=?";
		
		try {
			pstmt = conn.prepareStatement(FIND_ONE_QUERY);
			
			pstmt.setLong(1, boardDto.getBoardId());
			pstmt.setLong(2, boardDto.getUserId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement(UPDATE_QUERY);
				
				pstmt.setString(1, boardDto.getBoardTitle());
				pstmt.setString(2, boardDto.getBoardContent());
				pstmt.setLong(3, boardDto.getBoardId());
				pstmt.setLong(4, boardDto.getUserId());
				
				pstmt.executeUpdate();
				
				conn.close();
				
				return true;
			} else {
				conn.close();
				
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public BoardDto read(Long boardId) {
		final String FIND_ONE_QUERY = "SELECT * FROM board WHERE board_id=?";
		
		try {
			pstmt = conn.prepareStatement(FIND_ONE_QUERY);
			
			pstmt.setLong(1, boardId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setBoardId(boardId);
				boardDto.setBoardTitle(rs.getString(2));
				boardDto.setBoardContent(rs.getString(3));
				boardDto.setUserId(rs.getLong(4));
				
				return boardDto;
			} else {
				conn.close();
				
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean delete(Long boardId) {
		final String DELETE_QUERY = "DELETE FROM board WHERE board_id=?";
		
		try {
			pstmt = conn.prepareStatement(DELETE_QUERY);
			
			pstmt.setLong(1, boardId);
			
			pstmt.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
