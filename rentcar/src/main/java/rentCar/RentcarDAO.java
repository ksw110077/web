package rentCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

public class RentcarDAO {
	private RentcarDAO() {}
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
	// 예약 내역?
	
	// load
	
	public ArrayList<Rentcar> getRentcar() {
		this.rentcar = new ArrayList<Rentcar>();
		
		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from rentcar";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			
			while(this.rs.next()) {
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
	
	public ArrayList<Member> getMember() {
		this.member = new ArrayList<Member>();
		
		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from member";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			
			while(this.rs.next()) {
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
	
	
	// CRUD
	
	// Create
	
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
	
	
	// Read
	
	public Member chkMember(String id) {
		getMember();
		for(int i = 0; i < this.member.size(); i++) {
			if(this.member.get(i).getId().equals(id)) {
				return this.member.get(i);
			}
		}
		return null;
	}
	
	public boolean chkMember(String id, String pw) {
		getMember();
		for(int i = 0; i < this.member.size(); i++) {
			if(this.member.get(i).getId().equals(id) && this.member.get(i).getPw().equals(pw)) {
				return true;
			}
		}
		return false;
	}
	
	// Update
	
	
	
	// Delete
	public boolean delMember(String id, String pw) {
		if(chkMember(id, pw)) {
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
}
