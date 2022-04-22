package funcat.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
	/*create table COMMUNITY_REPLY  (  커뮤니티댓글 
			   COM_RE_NUM NUMBER not null primary key, 댓글번호 
			   MEMBER_ID VARCHAR2(50) not null,  회원아이디 
			   COMMUNITY_NUM NUMBER not null, 커뮤니티 댓글 글번호 
			   COM_RE_CON VARCHAR2(200) not null,  커뮤니티 댓글 내용 
			   COM_RE_DATE DATE DEFAULT SYSDATE,  커뮤니티 댓글 등록일 
			   COM_RE_MDATE DATE DEFAULT SYSDATE,  커뮤니티 댓글 수정일 
			   constraint FK_CMR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID),
			   constraint FK_CMR_CM_NUM foreign key(COMMUNITY_NUM) references COMMUNITY(COMMUNITY_NUM)
			);
			create sequence SEQ_COM_RE_NUM increment by 1 start with 1 nocache;*/
	
	private int com_re_num;  //댓글번호
	private int community_num;  //커뮤니티 글 번호
	private String member_id;  //회원 아이디
	private String com_re_con;  //댓글 내용
	private Date com_re_date;  //댓글 등록일
	//private Date com_re_mdate;  //댓글 수정일
	
	/*public int getCom_re_num() {
		return com_re_num;
	}
	public void setCom_re_num(int com_re_num) {
		this.com_re_num = com_re_num;
	}
	public int getCommunity_num() {
		return community_num;
	}
	public void setCommunity_num(int community_num) {
		this.community_num = community_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCom_re_con() {
		return com_re_con;
	}
	public void setCom_re_con(String com_re_con) {
		this.com_re_con = com_re_con;
	}
	public Date getCom_re_date() {
		return com_re_date;
	}
	public void setCom_re_date(Date com_re_date) {
		this.com_re_date = com_re_date;
	}
	/*public Date getCom_re_mdate() {
		return com_re_mdate;
	}
	public void setCom_re_mdate(Date com_re_mdate) {
		this.com_re_mdate = com_re_mdate;
	}*/ //댓글 수정일 관련*/

}
