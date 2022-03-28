/* 계정 생성*/
--sqlplus / as sysdba
--alter session set "_oracle_script"=true;
--create user team4 identified by java;
--grant connect, resource, unlimited tablespace to team4;
--conn team4/java;
--select * from tab;

-- 테이블       ( 논리 모델명 )      ( 칼럼 )

-- MEMBER        회원	      MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL_CHECK, MEMBER_RDATE, MEMBER_CHECK 
--                            ( 회원아이디, 회원비밀번호, 회원명, 전화번호, 이메일수신여부, 회원가입일, 크리에이터여부 )
-- BLACKLIST     블랙리스트      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( 블랙리스트번호, 회원아이디, 활동중지여부, 활동중지일, 누적신고수 )
-- ADDRESS       배송지관리       ADDR_NUM, MEMBER_ID, ADDR_NAME, ADDR_RECIVER, ADDR_PHONE, ADDR_POST, ADDR_ROADNAME, ADDR_DETAIL
--                            ( 배송지번호, 회원아이디, 배송지명, 받는이, 받는이번호, 우편번호, 도로명주소, 상세주소)
-- CATEGORY      카테고리        CATEGORY_NUM, CATEGORY_SUB
--                            ( 카테고리번호, 카테고리명 )
-- CREATOR       크리에이터       CREATOR_NUM, CREATOR_TYPE, CREATOR_PHONE, CREATOR_CHECK, CREATOR_NAME
--                            ( 크리에이터번호, 사업자구분, 크리에이터전화번호, 개인정보수집동의여부, 크리에이터이름)
-- PROJECT       프로젝트        PROJECT_NUM, CREATOR_NUM, CATEGORY_NUM, PROJECT_SUB, PROJECT_GOAL, PROJECT_COMMENT, PROJECT_DETAIL, PROJECT_PRICE, PROJECT_OPEN, PROJECT_CLOSE, PROJECT_DATE, PROJECT_MDATE, PROJECT_LEVEL
--                            ( 프로젝트번호, 크리에이터번호, 카테고리번호, 프로젝트제목, 목표금액, 요약, 스토리, 후원금액, 프로젝트오픈일, 프로젝트종료일, 작성일, 수정일, 프로젝트단계 )
-- REWARD        리워드         REWARD_NUM, PROJECT_NUM, REWARD_SUB, REWARD_PRICE, REWARD_CNT, REWARD_DATE
--                            ( 리워드번호, 프로젝트번호, 리워드명, 금액, 제한수량, 발송시작일)
-- ORDER         주문	      ORDER_NUM, ADDR_NUM, REWARD_NUM, MEMBER_ID, ORDER_NAME, ORDER_PRICE, ORDER_DATE, ORDER_STATEMENT, ORDER_OPTION, ORDER_DELIVERY
--                            ( 주문번호, 배송지번호, 리워드번호, 회원아이디, 주문인, 주문금액, 주문일자, 주문상태, 입력옵션내용, 배송단계 )
-- PAYMENT       결제           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( 결제번호, 배송지번호, 주문번호, 회원아이디, 결제방식, 결제금액, 결제일자, 결제승인시각 )
-- COMMUNITY     커뮤니티        COMMUNITY_NUM, MEMBER_ID, COMMUNITY_SUB, COMMUNITY_CON, COMMUNITY_DATE, COMMUNITY_MDATE, COMMUNITY_VIEW
--                            ( 커뮤니티글번호, 회원아이디, 커뮤니티제목, 커뮤니티내용, 커뮤니티등록일, 커뮤니티수정일, 커뮤니티조회수 )
-- COMMUNITY_REPLY  커뮤니티댓글   COM_RE_NUM, MEMBER_ID, COMMUNITY_NUM, COM_RE_CON, COM_RE_DATE, COM_RE_MDATE
--                            ( 댓글번호, 회원아이디, 커뮤니티글번호, 댓글내용, 작성일, 수정일 )
-- REPORT        신고           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( 신고번호, 댓글번호, 신고사유, 신고일, 신고처리여부 )
-- QNA           질문게시판       QNA_NUM, QNA_SUB, QNA_CON, QNA_DATE, QNA_VIEW, QNA_CHECK
--                            ( 질문게시판번호, 제목, 내용, 작성일, 조회수, 답변상태 )
-- QNA_REPLY     질문게시판댓글    QNA_NUM, QNA_RE_NUM, QNA_RE_CON, QNA_RE_DATE, QNA_RE_NAME
--                            ( 질문게시판번호, 댓글번호, 내용, 작성일, 작성자 )
-- NOTICE        공지사항        NOTICE_NUM, NOTICE_SUB, NOTICE_CON, NOTICE_DATE, NOTICE_VIEW
--                            ( 공지사항번호, 공지사항제목, 공지사항내용, 작성일, 조회수 )

create table MEMBER ( /* 회원정보 */
   MEMBER_ID VARCHAR2(50) not null primary key, /* 회원아이디 */
   MEMBER_PW VARCHAR2(30) not null, /*비밀번호*/
   MEMBER_NAME VARCHAR2(50) not null, /* 회원명 */
   MEMBER_PHONE VARCHAR2(13) not null, /* 전화번호 */
   MEMBER_EMAIL_CHECK CHAR(1) not null, /* 이메일수신여부 */
   MEMBER_RDATE DATE DEFAULT SYSDATE, /* 회원가입일 */
   MEMBER_CHECK CHAR(1) not null, /* 크리에이터여부 */
   constraint UQ_MEMBER unique(MEMBER_NAME),
   constraint CK_MEMBER_E CHECK (MEMBER_EMAIL_CHECK IN('Y', 'N')),
   constraint CK_MEMBER_C CHECK (MEMBER_CHECK IN('Y', 'N'))
);

-- BLACKLIST     블랙리스트      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( 블랙리스트번호, 회원아이디, 활동중지여부, 활동중지일, 누적신고수 )

create table ADDRESS ( /* 배송지관리 */
   ADDR_NUM NUMBER not null primary key, /* 배송지번호 */
   MEMBER_ID VARCHAR2(50) not null, /* 회원아이디 */
   ADDR_NAME VARCHAR2(100) not null, /* 배송지명 */
   ADDR_RECIVER VARCHAR2(50) not null, /* 받는이 */
   ADDR_PHONE VARCHAR2(13) not null, /* 받는이번호 */
   ADDR_POST VARCHAR2(5) not null, /* 우편번호 */
   ADDR_ROADNAME VARCHAR2(500) not null, /* 도로명주소 */
   ADDR_DETAIL VARCHAR2(500) not null, /* 상세주소 */
   constraint FK_ADDR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_ADDR_NUM increment by 1 start with 1 nocache;


create table CATEGORY ( /* 카테고리 */
   CATEGORY_NUM NUMBER not null primary key, /* 카테고리번호 */
   CATEGORY_SUB VARCHAR2(100) not null /* 카테고리명 */
);
create sequence SEQ_CATEGORY_NUM increment by 1 start with 1 nocache;

create table CREATOR ( /* 크리에이터 */
   CREATOR_NUM NUMBER not null primary key, /* 크리에이터번호 */
   MEMBER_ID VARCHAR2(50) not null,
   CREATOR_TYPE CHAR(1) not null, /*사업자구분*/
   CREATOR_PHONE VARCHAR2(13) not null, /* 연락처 */
   CREATOR_CHECK VARCHAR2(13) not null, /* 개인정보 수집 동의 여부 */
   CREATOR_NAME CHAR(50) not null, /* 크리에이터 이름 */
   constraint FK_CREATOR_MEMER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID),
   constraint CK_CREATOR_T CHECK (CREATOR_TYPE IN('Y', 'N')),
   constraint CK_CREATOR_C CHECK (CREATOR_CHECK IN('Y', 'N')),
   constraint UQ_CREATOR unique(CREATOR_NAME)
);
create sequence SEQ_CREATOR_NUM increment by 1 start with 1 nocache;

create table PROJECT ( /* 프로젝트 */
   PROJECT_NUM NUMBER not null primary key, /* 프로젝트번호 */
   CREATOR_NUM NUMBER not null, /*크리에이터번호*/
   CATEGORY_NUM  NUMBER not null, /*카테고리번호*/
   PROJECT_SUB VARCHAR2(200) not null, /* 프로젝트제목 */
   PROJECT_GOAL NUMBER not null, /* 목표금액 */
   PROJECT_COMMENT VARCHAR2(500) not null, /* 요약 */
   PROJECT_DETAIL VARCHAR2(700) not null,/* 스토리 */
   PROJECT_PRICE NUMBER not null,/* 후원금액 */
   PROJECT_OPEN DATE DEFAULT SYSDATE, /* 프로젝트오픈일 */
   PROJECT_CLOSE DATE DEFAULT SYSDATE,/* 프로젝트종료일 */
   PROJECT_DATE DATE DEFAULT SYSDATE,/* 작성일 */
   PROJECT_MDATE DATE DEFAULT SYSDATE,/* 수정일 */
   PROJECT_LEVEL VARCHAR2(20) not null,/* 프로젝트단계 */
   constraint CK_PROJECT_LV CHECK (PROJECT_LEVEL IN('펀딩중', '펀딩완료', '펀딩실패', '펀딩대기')),
   constraint FK_PROJ_CREATOR_NUM foreign key(CREATOR_NUM) references CREATOR(CREATOR_NUM),
   constraint FK_PROJ_CATEGORY_NUM foreign key(CATEGORY_NUM) references CATEGORY(CATEGORY_NUM)
);
create sequence SEQ_PROJ_NUM increment by 1 start with 1 nocache;

create table REWARD  ( /* 리워드 */
   REWARD_NUM NUMBER not null primary key, /* 리워드번호 */
   PROJECT_NUM NUMBER not null, /* 프로젝트번호 */
   REWARD_SUB VARCHAR2(200) not null, /* 리워드명 */
   REWARD_PRICE NUMBER not null, /* 금액 */
   REWARD_CNT NUMBER not null, /* 제한수량 */
   REWARD_DATE DATE DEFAULT SYSDATE /* 발송시작일 */
);
create sequence SEQ_REWARD_NUM increment by 1 start with 1 nocache;

create table MEM_ORDER ( /* 주문 */
   ORDER_NUM NUMBER not null primary key, /* 주문번호 */
   ADDR_NUM NUMBER not null, /* 배송지번호 */
   REWARD_NUM NUMBER not null, /* 리워드번호 */
   MEMBER_ID VARCHAR2(50) not null, /* 회원아이디 */
   ORDER_NAME VARCHAR2(50) not null, /* 주문인 */
   ORDER_PRICE NUMBER not null, /* 주문금액 */
   ORDER_DATE DATE DEFAULT SYSDATE, /* 주문일자 */
   ORDER_STATEMENT VARCHAR2(20) not null, /* 주문상태 */
   ORDER_OPTION VARCHAR2(100), /* 입력옵션내용 */
   ORDER_DELIVERY VARCHAR2(20) not null, /* 배송단계 */
   constraint CK_MEM_ORDER_STATE CHECK (ORDER_STATEMENT IN('결제예약', '결제완료', '결제실패', '펀딩취소')),
   constraint CK_MEM_ORDER_DELIVERY CHECK (ORDER_DELIVERY IN('선물준비', '발송준비', '발송중', '전달완료')),
   constraint FK_OR_ADDR_NUM foreign key(ADDR_NUM) references ADDRESS(ADDR_NUM),
   constraint FK_OR_REWARD_NUM foreign key(REWARD_NUM) references REWARD(REWARD_NUM),
   constraint FK_OR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_MORDER_NUM increment by 1 start with 1 nocache;

-- PAYMENT       결제           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( 결제번호, 배송지번호, 주문번호, 회원아이디, 결제방식, 결제금액, 결제일자, 결제승인시각 )

create table COMMUNITY  ( /* 커뮤니티 */
   COMMUNITY_NUM NUMBER not null primary key, /* 커뮤니티글번호 */
   MEMBER_ID VARCHAR2(50) not null, /* 회원아이디 */
   COMMUNITY_SUB VARCHAR2(200) not null, /* 커뮤니티제목 */
   COMMUNITY_CON VARCHAR2(700) not null, /* 커뮤니티내용 */
   COMMUNITY_DATE DATE DEFAULT SYSDATE, /* 커뮤니티등록일 */
   COMMUNITY_MDATE DATE DEFAULT SYSDATE, /* 커뮤니티수정일 */
   COMMUNITY_VIEW NUMBER not null, /* 커뮤니티조회수 */
   constraint FK_CM_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_COMMUNITY_NUM increment by 1 start with 1 nocache;

create table COMMUNITY_REPLY  ( /* 커뮤니티댓글 */
   COM_RE_NUM NUMBER not null primary key, /* 댓글번호 */
   MEMBER_ID VARCHAR2(50) not null, /* 회원아이디 */
   COMMUNITY_NUM NUMBER not null, /* 커뮤니티글번호 */
   COM_RE_CON VARCHAR2(200) not null, /* 커뮤니티제목 */
   COM_RE_DATE DATE DEFAULT SYSDATE, /* 커뮤니티등록일 */
   COM_RE_MDATE DATE DEFAULT SYSDATE, /* 커뮤니티수정일 */
   constraint FK_CMR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID),
   constraint FK_CMR_CM_NUM foreign key(COMMUNITY_NUM) references COMMUNITY(COMMUNITY_NUM)
);
create sequence SEQ_COM_RE_NUM increment by 1 start with 1 nocache;

-- REPORT        신고           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( 신고번호, 댓글번호, 신고사유, 신고일, 신고처리여부 )

create table QNA   ( /* 질문게시판 */
   QNA_NUM NUMBER not null primary key, /* 질문게시판번호 */
   QNA_SUB VARCHAR2(200) not null, /* 제목 */
   QNA_CON VARCHAR2(700) not null, /* 작성일 */
   QNA_DATE DATE DEFAULT SYSDATE, /* 작성일 */
   QNA_VIEW NUMBER not null, /* 조회수 */
   QNA_CHECK VARCHAR2(12), /* 답변상태 */
   constraint CK_QNA_CHECK CHECK (QNA_CHECK IN('답변대기', '답변완료'))
);
create sequence SEQ_QNA_NUM increment by 1 start with 1 nocache;

create table QNA_REPLY  ( /* 질문게시판댓글 */
   QNA_RE_NUM NUMBER not null primary key, /* 질문게시판번호 */
   QNA_NUM NUMBER not null, /* 제목 */
   QNA_RE_CON VARCHAR2(700) not null, /* 작성일 */
   QNA_RE_DATE DATE DEFAULT SYSDATE, /* 작성일 */
   QNA_RE_NAME VARCHAR2(50) not null, /* 조회수 */
   constraint FK_QNA_NUM foreign key(QNA_NUM) references QNA(QNA_NUM)
);
create sequence SEQ_QNA_RE_NUM increment by 1 start with 1 nocache;

create table NOTICE  ( /* 공지사항 */
   NOTICE_NUM NUMBER not null primary key, /* 공지사항번호 */
   NOTICE_SUB VARCHAR2(200) not null, /* 공지사항제목 */
   NOTICE_CON VARCHAR2(700) not null, /* 공지사항내용 */
   NOTICE_DATE DATE DEFAULT SYSDATE, /* 작성일 */
   NOTICE_VIEW NUMBER not null /* 조회수 */
);
create sequence SEQ_NOTICE_NUM increment by 1 start with 1 nocache;

commit;
select TNAME from TAB;
