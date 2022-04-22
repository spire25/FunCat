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
public class BoardVO {
	/*
	 create table COMMUNITY  (  커뮤니티 
  COMMUNITY_NUM NUMBER not null primary key,  커뮤니티글번호
  PROJECT_NUM NUMBER not null,
  MEMBER_ID VARCHAR2(50) not null,  회원아이디 
  COMMUNITY_SUB VARCHAR2(200) not null,  커뮤니티제목 
  COMMUNITY_CON VARCHAR2(700) not null,  커뮤니티내용 
  COMMUNITY_DATE DATE DEFAULT SYSDATE, 커뮤니티등록일 
  COMMUNITY_MDATE DATE DEFAULT SYSDATE, 커뮤니티수정일 
  COMMUNITY_VIEW NUMBER not null, 커뮤니티조회수 
  constraint FK_COMMUNITY_PRO_NUM foreign key(PROJECT_NUM) references PROJECT(PROJECT_NUM),
  constraint FK_CM_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
*/
	 private int community_num; //커뮤니티 글번호
	 private int project_num; //프로젝트 글번호
	 private String member_id; //회원아이디
	 private String community_sub; //커뮤니티 제목
	 private String community_con; //커뮤니티 내용
	 private Date community_date;  //커뮤니티 등록일
	 private int community_view;  //커뮤니티 조회수
	 //변수 타입 이렇게 하면 되는지 통일하기
}
