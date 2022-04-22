package funcat.bd.domain;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Mypage {
	
	//로그인 후 마이페이지
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email_check;
	private Date member_rdate;
	private String member_check;
	
	//내 주문내역 조회
	private long order_num;
	private long addr_num;
	private long reward_num;
	private String order_name;
	private long order_price;
	private Date order_date;
	private String order_statement;
	private String order_option;
	private String order_delivery;
	
	//크리에이터 신청, 조회
	private long creator_num;
	private String creator_type;
	private String creator_phone;
	private String creator_check;
	private String creator_name;
	
	//프로젝트조회 조회
	private long project_num;
	private long category_num;
	private String project_sub;
	private String project_goal;
	private String project_comment;
	private String project_detail;
	private String project_price;
	private Date project_open;
	private Date project_close;
	private Date project_date;
	private Date project_mdate;
	private String project_level;
	private String project_thumbnail;
	
	//카테고리
	private String category_sub;
	
	//리워드
	private String reward_sub;
	private long reward_price;
	private long reward_cnt;
	private Date reward_date;
}