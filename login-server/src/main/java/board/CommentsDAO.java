package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class CommentsDAO {
	private CommentsDAO() {}
	private static CommentsDAO instance = new CommentsDAO();
	public static CommentsDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	ArrayList<CommentsDTO> list = new ArrayList<CommentsDTO>();
	public ArrayList<CommentsDTO> getComments(){
		this.list = new ArrayList<CommentsDTO>();
		try {
			this.conn = DBManager.getConnection();
			String sql = "select*from comments";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			while(this.rs.next()) {
				int parentID = this.rs.getInt(1);
				int no = this.rs.getInt(2);
				String commenter = this.rs.getString(3);
				String comments = this.rs.getString(4);
				Timestamp date = this.rs.getTimestamp(5);
				CommentsDTO temp = new CommentsDTO(parentID, no, commenter, comments, date);
				this.list.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.list;
	}
	
	public boolean addComments(CommentsDTO comments) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into comments(parentID, commenter, comments, date) value (?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, comments.getParentID());
			this.pstmt.setString(2, comments.getCommenter());
			this.pstmt.setString(3, comments.getComments());
			this.pstmt.setTimestamp(4, comments.getDate());
			this.pstmt.executeUpdate();
			System.out.println("댓글 추가 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public void updateComments(int no, String comments) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "update comments set comments=? where no = ?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, comments);
			this.pstmt.setInt(2, no);
			this.pstmt.executeUpdate();
			System.out.println("댓글 수정 완료");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public boolean delComments(int no) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "delete from comments where no=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.executeUpdate();
			System.out.println("댓글 삭제 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	

}
