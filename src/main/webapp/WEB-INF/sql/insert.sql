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

-- MEMBER
insert into MEMBER values ('aa@naver.com', 'aa', 'yy', '010-1111-2222', 'Y', SYSDATE, 'Y');
insert into MEMBER values ('bb@naver.com', 'bb', 'yn', '010-1111-1234', 'Y', SYSDATE, 'N');
insert into MEMBER values ('cc@naver.com', 'cc', 'nn', '010-1111-3456', 'N', SYSDATE, 'N');
insert into MEMBER values ('dd@naver.com', 'dd', 'ny', '010-1111-4578', 'N', SYSDATE, 'Y');
insert into MEMBER values ('kosmo01@naver.com', '1234', '기적의피스타치오', '010-3445-2990', 'N', SYSDATE, 'Y');
insert into MEMBER values ('kosmo02@naver.com', 'asdf', '피자빵', '010-1233-7200', 'N', SYSDATE, 'Y');
--select * from MEMBER;


-- BLACKLIST
--select * from BLACKLIST;

-- ADDRESS
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '학원', '김나미', '010-2034-1432', 08505, '서울특별시 금천구 가산디지털2로 123(가산동)', '월드메르디앙 2차 413호');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '우리집', '김나미', '010-2344-1672', 03489, '서울시 은평구 수색로 270', '201호');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '회사', '김나미', '010-2344-1672', 13473, '경기 성남시 분당구 판교로 185', '3층');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'bb@naver.com', '우리집', '김김밥', '010-3879-2144', 03925, '서울 마포구 월드컵북로 402', 'KGIT센터 1층 광장 김밥천국 상암 본점');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'kosmo01@naver.com', '우리집', '박하나', '010-0922-3272', 03489, '서울시 은평구 수색로 270', '204호');
--select * from ADDRESS;


-- CATEGORY
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '푸드');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '영화');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '공연');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '음악');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '반려동물');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '잡화');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '뷰티');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '굿즈');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '리빙');
--select * from CATEGORY;

-- CREATOR
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'aa@naver.com', 'Y', '010-2034-1432', 'Y', '코스모매니지먼트');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'N', '031-3021-5532', 'Y', '우나 UNAH');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'Y', '031-3021-5532', 'Y', '(주)마인딩그룹');
--select * from CREATOR;


-- PROJECT
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 1, '프로젝트 제목', 500000, '프로젝트 간단소개', '프로젝트 스토리', 0, '22/04/22', '22/05/30', SYSDATE, SYSDATE, '펀딩대기');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 2, 9, '창의적인 인테리어, 아이템 플랜테리어의 혁신! 식물집사로 봄을 준비하세요',
			500000, '누구나 한 번 쯤은 꿈꿔보는 식집사의 생활! 물이 줄어들면 보닛이 들리는 혁신적인 디자인! 뿌리부터 충분히 적시는 저면관수를 통해 물 주는 고민도 순삭! 이제 식집사도 슬기롭게!',
			'스토리', 0, '22/03/22', '22/04/30', SYSDATE, SYSDATE, '펀딩중');
--select * from PROJECT;



-- REWARD
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '슈퍼얼리버드1', 42000, 50, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '슈퍼얼리버드2', 52700, 50, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '얼리버드1', 32000, 80, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '얼리버드2', 28900, 100, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '그린웨이브 화분 옐로우', 37000, 30, '22/05/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '그린웨이브 화분 블루', 35000, 30, '22/05/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '배양토세트', 15000, 80, '22/05/30');
--select * from REWARD;



-- MEM_ORDER
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 5, 7, 'kosmo01@naver.com', '박하나', 15000, SYSDATE, '결제예약', '상토로 바꿔주세요', '선물준비');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 6, 'aa@naver.com', '김나미', 35000, SYSDATE, '결제예약', null, '선물준비');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 5, 'aa@naver.com', '김나미', 37000, SYSDATE, '결제예약', null, '선물준비');
--select * from MEM_ORDER;



-- COMMUNITY
-- 여기 id말고 닉네임 들어가게 테이블 고쳐야함
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 1, 'aa@naver.com', '프로젝트 공지', '프로젝트 공지 내용', SYSDATE, SYSDATE, 0);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[오픈이벤트]참여하세요', '3월 27일 (일) PM11:59까지 펀딩하면 추첨을 통해 10만원 상당 식물 및 화분을 드립니다!', SYSDATE, SYSDATE, 26);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[72시간 EVENT]', '펀딩시작후 72시간 내에 펀딩하면 추첨을 통해 LED식물조명을 드립니다..', SYSDATE, SYSDATE, 15);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '오픈 예정 TOP20 감사합니다', '관심 가져주신 서포터 여러분께 감사드립니다!', SYSDATE, SYSDATE, 21);
--select * from COMMUNITY;



-- COMMUNITY_REPLY
-- 여기 id말고 닉네임 들어가게 테이블 고쳐야함
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'kosmo02@naver.com', 2, '기대중입니다ㅎㅎ', SYSDATE, SYSDATE);
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'cc@naver.com', 2, '예쁠 것 같고, 기능도 좋아보여요 ㅎㅎ', SYSDATE, SYSDATE);
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'kosmo01@naver.com', 2, '좋은 아이디어 제품으로 초보식집사에게 희망을!', SYSDATE, SYSDATE);
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'dd@naver.com', 3, '얼리버드 남았는데 다들 저렴하게 데려가세요!', SYSDATE, SYSDATE);
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'aa@naver.com', 3, '알고 펀딩한거 아닌데 72시간 범주에 들어왔네요 ㅎㅎ 감사합니다', SYSDATE, SYSDATE);
insert into COMMUNITY_REPLY values (SEQ_COM_RE_NUM.nextval, 'kosmo02@naver.com', 4, '기대중입니다ㅎㅎ', SYSDATE, SYSDATE);
--select * from COMMUNITY_REPLY;


-- QNA
insert into QNA values (SEQ_QNA_NUM.nextval, '질문게시판제목', '질문내용', SYSDATE, 12, '답변완료');
insert into QNA values (SEQ_QNA_NUM.nextval, '질문게시판제목', '질문내용', SYSDATE, 34, '답변대기');
--select * from QNA;



-- QNA_REPLY
insert into QNA_REPLY values (SEQ_QNA_RE_NUM.nextval, 1, '질문에 대한 답변', SYSDATE, 'aa');
--select * from QNA_REPLY;



-- NOTICE
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '후원을 했는데 후원목록이 안 나와요', '후원하신 계정이 아닌 다른 계정으로 로그인하셨을 수 있습니다. 로그인 계쩡을 확인해주세요!', SYSDATE, 712);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '여러 개의 리워드를 후원하고 싶어요', '한 프로젝트당 한 개의 선물만 선택하여 후원할 수 있습니다. 다만 창작자에게 문의 후 창작자가 이를 반영하여 리워드를 전할 수 있습니다.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '선물 전달일이 지났는데 배송이 안 와요', '창작자가 프로젝트 페이지 내 "커뮤니티"에 변동사항에 대한 업데이트를 올렸는지 먼저 확인해주세요.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '사업자 없는 개인도 펀딩할 수 있나요?', '펀캣은 사업자/개인 여부에 관계없이 프로젝트 진행이 가능합니다. 최소 자격 요건을 확인해주세요!', SYSDATE, 95);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '선물 전달이 지연될 것 같아요', '배송 일정의 지연으로 예상 전달일보다 발송이 늦어진다면, 후원자께서 안심하고 기다리실 수 있도록 커뮤니티에 배송 지연에 대한 공지를 게시해주세요.', SYSDATE, 34);
--select * from NOTICE;







-- creator 테이블에 '개인정보수집동의여부' 칼럼이 필요한지?
-- REWARD 테이블에 발송시작일 없어도 되지 않을까?
-- REWARD 테이블에 제목 외에도 '상품구성요소' 내용이 담긴 칼럼이 필요할 것 같음
-- MEMBER 테이블에 크리에이터 인지아닌지 구분하는...칼럼 넣으면 편하지 않을까..?
-- MEM_ORDER 테이블에 프로젝트 번호 들어가야하지 않나??
-- MEM_ORDER 테이블에 '주문 수량' 칼럼 필요하지 않을까

-- QNA, QNA_REPLY 테이블
-- >>> 로그인한 사람만 글을 올리고 답변을 달거면 참조키도 달아줘야 함


