package fc.noticeboard.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProjectBoardVO {
	/*
	create table PROJECT (  프로젝트
			   PROJECT_NUM NUMBER not null primary key,  프로젝트번호 
			   CREATOR_NUM NUMBER not null, 크리에이터번호
			   CATEGORY_NUM  NUMBER not null, 카테고리번호
			   PROJECT_SUB VARCHAR2(200) not null,  프로젝트제목 
			   PROJECT_GOAL NUMBER not null,  목표금액 
			   PROJECT_COMMENT VARCHAR2(500) not null,  요약 
			   PROJECT_DETAIL VARCHAR2(700) not null, 스토리 
			   PROJECT_PRICE NUMBER not null, 후원금액 
			   PROJECT_OPEN DATE DEFAULT SYSDATE,  프로젝트오픈일 
			   PROJECT_CLOSE DATE DEFAULT SYSDATE, 프로젝트종료일 
			   PROJECT_DATE DATE DEFAULT SYSDATE, 작성일 
			   PROJECT_MDATE DATE DEFAULT SYSDATE, 수정일 
			   PROJECT_LEVEL VARCHAR2(20) not null, 프로젝트단계 
			   PROJECT_THUMBNAIL VARCHAR2(200) not null,
			   constraint CK_PROJECT_LV CHECK (PROJECT_LEVEL IN('펀딩중', '펀딩완료', '펀딩실패', '펀딩대기')),
			   constraint FK_PROJ_CREATOR_NUM foreign key(CREATOR_NUM) references CREATOR(CREATOR_NUM),
			   constraint FK_PROJ_CATEGORY_NUM foreign key(CATEGORY_NUM) references CATEGORY(CATEGORY_NUM)
			);
			create sequence SEQ_PROJ_NUM increment by 1 start with 1 nocache;
			
	*/
	
	private int project_num;
	private int creator_num;
	private int category_num;
	private String project_sub;
	private int project_goal;
	private String project_comment;
	private String project_detail;
	private int project_price;
	private Date project_open;
	private Date project_close;
	private Date project_date;
	private Date project_mdate;
	private String project_level;
	private String project_thumbnail;
	
	
	
	
		
}
