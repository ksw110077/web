package rentCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import util.DBManager;

public class RentcarDAO {
	private RentcarDAO() {
	}

	private static RentcarDAO instance = new RentcarDAO();

	public static RentcarDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 렌트카
	ArrayList<Rentcar> rentcar = new ArrayList<Rentcar>();
	// 회원
	ArrayList<Member> member = new ArrayList<>();
	// 게시물
	ArrayList<Board> contents = new ArrayList<>();

	// 예약 내역?

	// CRUD

	// Create

	// Member
	public boolean addMember(Member member) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into  member(id, pw, name, email, gender) values(?,?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, member.getId());
			this.pstmt.setString(2, member.getPw());
			this.pstmt.setString(3, member.getName());
			this.pstmt.setString(4, member.getEmail());
			this.pstmt.setInt(5, member.getGender());
			this.pstmt.executeUpdate();
			System.out.println("회원가입 완료");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Board

	public boolean addContent(Board board) {
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

	
	// Read

	// Rentcar
	public ArrayList<Rentcar> getRentcar() {
		this.rentcar = new ArrayList<Rentcar>();

		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from rentcar";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);

			while (this.rs.next()) {
				int no = this.rs.getInt(1);
				String name = this.rs.getString(2);
				int category = this.rs.getInt(3);
				int price = this.rs.getInt(4);
				int usepeople = this.rs.getInt(5);
				String company = this.rs.getString(6);
				String img = this.rs.getString(7);
				String info = this.rs.getString(8);

				Rentcar temp = new Rentcar(no, name, category, price, usepeople, company, img, info);

				this.rentcar.add(temp);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return rentcar;
	}

	// Member
	public ArrayList<Member> getMember() {
		this.member = new ArrayList<Member>();

		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from member";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);

			while (this.rs.next()) {
				String id = this.rs.getString(1);
				String pw = this.rs.getString(2);
				String name = this.rs.getString(3);
				String email = this.rs.getString(4);
				int gender = this.rs.getInt(5);
				Member temp = new Member(id, pw, name, email, gender);
				this.member.add(temp);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return member;
	}

	// Board
	public ArrayList<Board> getBoard() {
		this.contents = new ArrayList<Board>();
		System.out.println("겟보드 실패위치");
		try {
			this.conn = DBManager.getConnection();
			String sql = "select* from board";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				int code = this.rs.getInt(1);
				String title = this.rs.getString(2);
				String content = this.rs.getString(3);
				String id = this.rs.getString(4);
				String password = this.rs.getString(5);
				int view = this.rs.getInt(6);
				int like = this.rs.getInt(7);
				Timestamp date = this.rs.getTimestamp(8);
				Board temp = new Board(code, title, content, id, password, view, like, date);
				this.contents.add(temp);
				System.out.println("겟보드 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.contents;
	}

	// Update

	// Board

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

	// Delete

	// Member
	public boolean delMember(String id, String pw) {
		if (chkMember(id, pw)) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "delete from member where id=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.executeUpdate();
				System.out.println("회원탈퇴 완료");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// Board

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

	// Search
	public Member chkMember(String id) {
		getMember();
		for (int i = 0; i < this.member.size(); i++) {
			if (this.member.get(i).getId().equals(id)) {
				return this.member.get(i);
			}
		}
		return null;
	}

	public boolean chkMember(String id, String pw) {
		getMember();
		for (int i = 0; i < this.member.size(); i++) {
			if (this.member.get(i).getId().equals(id) && this.member.get(i).getPw().equals(pw)) {
				return true;
			}
		}
		return false;
	}

}
