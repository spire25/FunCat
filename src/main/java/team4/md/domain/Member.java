package team4.md.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email_check;
	private Date member_rdate;
	private String member_check;
	private String member_role;
	
	public Member(String member_id, String member_pw, String member_name, String member_phone, String member_email_check) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email_check = member_email_check;
	}
	
	public Member(String member_id, String member_pw) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
	}
}
