package board;

import java.sql.Timestamp;
import java.util.Calendar;

public class CommentsDTO {
	// 게시물 code
	private int parentID;
	// no 넘버가 따로?
	private int no;
	// 작성자
	private String commenter;
	// comments
	private String comments;
	// 작성시간
	private Timestamp date;

	public CommentsDTO(int parentID, String commenter, String comments) {
		this.parentID = parentID;
		this.commenter = commenter;
		this.comments = comments;
		this.date = new Timestamp(Calendar.getInstance().getTimeInMillis());
	}
	public CommentsDTO(int parentID, int no, String commenter, String comments, Timestamp date) {
		this.parentID = parentID;
		this.no = no;
		this.commenter = commenter;
		this.comments = comments;
		this.date = date;
	}

	public int getParentID() {
		return parentID;
	}

	public int getNo() {
		return no;
	}

	public String getCommenter() {
		return commenter;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Timestamp getDate() {
		return date;
	}

}
