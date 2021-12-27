package user;

import java.sql.Timestamp;

public class UserDTO {
	// DTO (Data Transfer Object) = (JAVA에서는) Bean(자바가 커피라서 커피콩) = VO ( read only) = Entity Object = POJO(플레인 JAVA Object)

	// 캡슐화
	private int code;
	private String id, pw;
	private Timestamp regDate; // (java.spl에서)
	
	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	public UserDTO(int code, String id, String pw, Timestamp regDate) {
		this.code = code;
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}
	
	public int getCode() {
		return code;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%d) %s/%s (%s)", this.code, this.id, this.pw, this.regDate);
	}
}
