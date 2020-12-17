package board;

public class BoardDto {
	private Long boardId;
	private Long userId;
	private String boardTitle;
	private String boardContent;
	
	public Long getBoardId() {
		return this.boardId;
	}
	
	public void setBoardId(Long boardId) {
		this.boardId = boardId;
	}
	
	public Long getUserId() {
		return this.userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public String getBoardTitle() {
		return this.boardTitle;
	}
	
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getBoardContent() {
		return this.boardContent;
	}
	
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
}
