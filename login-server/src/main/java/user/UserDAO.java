package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import util.DBManager;

public class UserDAO {
	// ctrl + shift + s 전체 저장
	// DAO(Data Access Object)
	// ㄴ 데이터베이스에 대한 접근 처리

	// 1. 싱글톤 패턴으로 만들기
	private UserDAO() {
	}

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	// 2. 데이터 베이스 연동 준비
	private Connection conn = null; // DB에 실제 연결을 함
	private PreparedStatement pstmt = null; // sql 쿼리를 execute 해줌
	private ResultSet rs = null; // execute한 쿼리실행 결과물을 받는 역할

	private ArrayList<UserDTO> users = null;

	// 3. DB 연동하기
//	public Connection getConnection() {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//
//			String url = "jdbc:mysql://localhost:3306/loginServer?serverTimezone=UTC";
//			String user = "root";
//			String password = "vp$dnl^3020";
//			this.conn = DriverManager.getConnection(url, user, password);
//			if (this.conn != null) {
//				System.out.println("DB연동 성공!");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return this.conn;
//	}

	// 4. 연동된 DB에서 데이터 불러오기
	public ArrayList<UserDTO> getUsers() {
		this.users = new ArrayList<UserDTO>();
		try {
			this.conn = DBManager.getConnection(); // DB연동하기
			String sql = "select* from users";
			this.pstmt = this.conn.prepareStatement(sql); // 연동된 DB에 쿼리를 날리 준비
			this.rs = this.pstmt.executeQuery(); // 쿼리를 날리면서 RsultSet을 반환 받음

			while (this.rs.next()) {
				// ********** 중요!!! sql은 인덱스가 1부터 시작 ***********
				int code = this.rs.getInt(1);
				String id = this.rs.getString(2);
				String pw = this.rs.getString(3);
				Timestamp regDate = this.rs.getTimestamp(4);

				UserDTO user = new UserDTO(code, id, pw, regDate);
				this.users.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return this.users;
	}

	// 5. CRUD
	// ㄴ Create Read Update Delete

	public boolean addUser(UserDTO user) {
		if(checkDuplId(user.getId())) {			
			try {
				this.conn = DBManager.getConnection();
				String sql = "insert into users(id, pw, regDate) values(?, ?, ?)"; // sql 쿼리의 포멧 = ?
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, user.getId());
				this.pstmt.setString(2, user.getPw());
				this.pstmt.setTimestamp(3, new Timestamp(Calendar.getInstance().getTimeInMillis()));
				this.pstmt.executeUpdate();
				System.out.println("회원가입 성공");
				
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	private boolean checkDuplId(String id) {
		this.users = getUsers();
		for(UserDTO user : this.users) {
			if(id.equals(user.getId())) {
				return false;
			}
		}
		return true;
	}
	
	public boolean checkLogin(String id, String pw) {
		this.users = getUsers();
		for(UserDTO user : this.users) {
			if(id.equals(user.getId()) && pw.equals(user.getPw())) {
				return true;
			}
		}
		return false;
	}
}