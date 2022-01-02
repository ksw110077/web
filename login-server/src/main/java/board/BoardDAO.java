package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class BoardDAO {
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	ArrayList<BoardDTO> contents = null;
	
	public ArrayList<BoardDTO> getBoard() {
		this.contents = new ArrayList<BoardDTO>();
		try {
			this.conn = DBManager.getConnection();
			String sql = "select* from board";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int code = this.rs.getInt(1);
				String title = this.rs.getString(2);
				String content = this.rs.getString(3);
				String id = this.rs.getString(4);
				String password = this.rs.getString(5);
				int view = this.rs.getInt(6);
				int like = this.rs.getInt(7);
				Timestamp date = this.rs.getTimestamp(8);
				BoardDTO temp = new BoardDTO(code, title, content, id, password, view, like, date);
				this.contents.add(temp);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.contents;
	}
	
	// CRUD

	// create
	
	public boolean addContent(BoardDTO board) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into board(title, content, id, password, date) values(?,?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, board.getTitle());
			this.pstmt.setString(2, board.getContent());
			this.pstmt.setString(3, board.getId());
			this.pstmt.setString(4, board.getPassword());
			this.pstmt.setTimestamp(5, board.getDate());
			this.pstmt.executeUpdate();
			System.out.println("게시물 작성 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
	// update
	
	public void updateContent(int code, String title, String content, String password) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "update board set title=?, content =?, password =?  where code = ?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, title);
			this.pstmt.setString(2, content);
			this.pstmt.setString(3, password);
			this.pstmt.setInt(4, code);
			this.pstmt.executeUpdate();
			System.out.println("게시물 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// delete
	
	public void delContent(int code) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "delete from board where code=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.pstmt.executeUpdate();
			System.out.println("게시물 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// search
	
	public BoardDTO searchDTO (int code) {
		getBoard();
		BoardDTO temp = null;
		for (int i = 0; i < this.contents.size(); i++) {
			if (this.contents.get(i).getCode() == code) {
				temp = this.contents.get(i);
			}
		}
		return temp;
	}
}
