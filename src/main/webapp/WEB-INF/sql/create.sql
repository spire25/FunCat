/* ���� ����*/
--sqlplus / as sysdba
--alter session set "_oracle_script"=true;
--create user team4 identified by java;
--grant connect, resource, unlimited tablespace to team4;
--conn team4/java;
--select * from tab;

-- ���̺�       ( �� �𵨸� )      ( Į�� )

-- MEMBER        ȸ��	      MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL_CHECK, MEMBER_RDATE, MEMBER_CHECK 
--                            ( ȸ�����̵�, ȸ����й�ȣ, ȸ����, ��ȭ��ȣ, �̸��ϼ��ſ���, ȸ��������, ũ�������Ϳ��� )
-- BLACKLIST     ������Ʈ      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( ������Ʈ��ȣ, ȸ�����̵�, Ȱ����������, Ȱ��������, �����Ű�� )
-- ADDRESS       ���������       ADDR_NUM, MEMBER_ID, ADDR_NAME, ADDR_RECIVER, ADDR_PHONE, ADDR_POST, ADDR_ROADNAME, ADDR_DETAIL
--                            ( �������ȣ, ȸ�����̵�, �������, �޴���, �޴��̹�ȣ, �����ȣ, ���θ��ּ�, ���ּ�)
-- CATEGORY      ī�װ�        CATEGORY_NUM, CATEGORY_SUB
--                            ( ī�װ���ȣ, ī�װ��� )
-- CREATOR       ũ��������       CREATOR_NUM, CREATOR_TYPE, CREATOR_PHONE, CREATOR_CHECK, CREATOR_NAME
--                            ( ũ�������͹�ȣ, ����ڱ���, ũ����������ȭ��ȣ, ���������������ǿ���, ũ���������̸�)
-- PROJECT       ������Ʈ        PROJECT_NUM, CREATOR_NUM, CATEGORY_NUM, PROJECT_SUB, PROJECT_GOAL, PROJECT_COMMENT, PROJECT_DETAIL, PROJECT_PRICE, PROJECT_OPEN, PROJECT_CLOSE, PROJECT_DATE, PROJECT_MDATE, PROJECT_LEVEL
--                            ( ������Ʈ��ȣ, ũ�������͹�ȣ, ī�װ���ȣ, ������Ʈ����, ��ǥ�ݾ�, ���, ���丮, �Ŀ��ݾ�, ������Ʈ������, ������Ʈ������, �ۼ���, ������, ������Ʈ�ܰ� )
-- REWARD        ������         REWARD_NUM, PROJECT_NUM, REWARD_SUB, REWARD_PRICE, REWARD_CNT, REWARD_DATE
--                            ( �������ȣ, ������Ʈ��ȣ, �������, �ݾ�, ���Ѽ���, �߼۽�����)
-- ORDER         �ֹ�	      ORDER_NUM, ADDR_NUM, REWARD_NUM, MEMBER_ID, ORDER_NAME, ORDER_PRICE, ORDER_DATE, ORDER_STATEMENT, ORDER_OPTION, ORDER_DELIVERY
--                            ( �ֹ���ȣ, �������ȣ, �������ȣ, ȸ�����̵�, �ֹ���, �ֹ��ݾ�, �ֹ�����, �ֹ�����, �Է¿ɼǳ���, ��۴ܰ� )
-- PAYMENT       ����           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( ������ȣ, �������ȣ, �ֹ���ȣ, ȸ�����̵�, �������, �����ݾ�, ��������, �������νð� )
-- COMMUNITY     Ŀ�´�Ƽ        COMMUNITY_NUM, MEMBER_ID, COMMUNITY_SUB, COMMUNITY_CON, COMMUNITY_DATE, COMMUNITY_MDATE, COMMUNITY_VIEW
--                            ( Ŀ�´�Ƽ�۹�ȣ, ȸ�����̵�, Ŀ�´�Ƽ����, Ŀ�´�Ƽ����, Ŀ�´�Ƽ�����, Ŀ�´�Ƽ������, Ŀ�´�Ƽ��ȸ�� )
-- COMMUNITY_REPLY  Ŀ�´�Ƽ���   COM_RE_NUM, MEMBER_ID, COMMUNITY_NUM, COM_RE_CON, COM_RE_DATE, COM_RE_MDATE
--                            ( ��۹�ȣ, ȸ�����̵�, Ŀ�´�Ƽ�۹�ȣ, ��۳���, �ۼ���, ������ )
-- REPORT        �Ű�           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( �Ű��ȣ, ��۹�ȣ, �Ű����, �Ű���, �Ű�ó������ )
-- QNA           �����Խ���       QNA_NUM, QNA_SUB, QNA_CON, QNA_DATE, QNA_VIEW, QNA_CHECK
--                            ( �����Խ��ǹ�ȣ, ����, ����, �ۼ���, ��ȸ��, �亯���� )
-- QNA_REPLY     �����Խ��Ǵ��    QNA_NUM, QNA_RE_NUM, QNA_RE_CON, QNA_RE_DATE, QNA_RE_NAME
--                            ( �����Խ��ǹ�ȣ, ��۹�ȣ, ����, �ۼ���, �ۼ��� )
-- NOTICE        ��������        NOTICE_NUM, NOTICE_SUB, NOTICE_CON, NOTICE_DATE, NOTICE_VIEW
--                            ( �������׹�ȣ, ������������, �������׳���, �ۼ���, ��ȸ�� )

create table MEMBER ( /* ȸ������ */
   MEMBER_ID VARCHAR2(50) not null primary key, /* ȸ�����̵� */
   MEMBER_PW VARCHAR2(30) not null, /*��й�ȣ*/
   MEMBER_NAME VARCHAR2(50) not null, /* ȸ���� */
   MEMBER_PHONE VARCHAR2(13) not null, /* ��ȭ��ȣ */
   MEMBER_EMAIL_CHECK CHAR(1) not null, /* �̸��ϼ��ſ��� */
   MEMBER_RDATE DATE DEFAULT SYSDATE, /* ȸ�������� */
   MEMBER_CHECK CHAR(1) not null, /* ũ�������Ϳ��� */
   constraint UQ_MEMBER unique(MEMBER_NAME),
   constraint CK_MEMBER_E CHECK (MEMBER_EMAIL_CHECK IN('Y', 'N')),
   constraint CK_MEMBER_C CHECK (MEMBER_CHECK IN('Y', 'N'))
);

-- BLACKLIST     ������Ʈ      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( ������Ʈ��ȣ, ȸ�����̵�, Ȱ����������, Ȱ��������, �����Ű�� )

create table ADDRESS ( /* ��������� */
   ADDR_NUM NUMBER not null primary key, /* �������ȣ */
   MEMBER_ID VARCHAR2(50) not null, /* ȸ�����̵� */
   ADDR_NAME VARCHAR2(100) not null, /* ������� */
   ADDR_RECIVER VARCHAR2(50) not null, /* �޴��� */
   ADDR_PHONE VARCHAR2(13) not null, /* �޴��̹�ȣ */
   ADDR_POST VARCHAR2(5) not null, /* �����ȣ */
   ADDR_ROADNAME VARCHAR2(500) not null, /* ���θ��ּ� */
   ADDR_DETAIL VARCHAR2(500) not null, /* ���ּ� */
   constraint FK_ADDR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_ADDR_NUM increment by 1 start with 1 nocache;


create table CATEGORY ( /* ī�װ� */
   CATEGORY_NUM NUMBER not null primary key, /* ī�װ���ȣ */
   CATEGORY_SUB VARCHAR2(100) not null /* ī�װ��� */
);
create sequence SEQ_CATEGORY_NUM increment by 1 start with 1 nocache;

create table CREATOR ( /* ũ�������� */
   CREATOR_NUM NUMBER not null primary key, /* ũ�������͹�ȣ */
   MEMBER_ID VARCHAR2(50) not null,
   CREATOR_TYPE CHAR(1) not null, /*����ڱ���*/
   CREATOR_PHONE VARCHAR2(13) not null, /* ����ó */
   CREATOR_CHECK VARCHAR2(13) not null, /* �������� ���� ���� ���� */
   CREATOR_NAME CHAR(50) not null, /* ũ�������� �̸� */
   constraint FK_CREATOR_MEMER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID),
   constraint CK_CREATOR_T CHECK (CREATOR_TYPE IN('Y', 'N')),
   constraint CK_CREATOR_C CHECK (CREATOR_CHECK IN('Y', 'N')),
   constraint UQ_CREATOR unique(CREATOR_NAME)
);
create sequence SEQ_CREATOR_NUM increment by 1 start with 1 nocache;

create table PROJECT ( /* ������Ʈ */
   PROJECT_NUM NUMBER not null primary key, /* ������Ʈ��ȣ */
   CREATOR_NUM NUMBER not null, /*ũ�������͹�ȣ*/
   CATEGORY_NUM  NUMBER not null, /*ī�װ���ȣ*/
   PROJECT_SUB VARCHAR2(200) not null, /* ������Ʈ���� */
   PROJECT_GOAL NUMBER not null, /* ��ǥ�ݾ� */
   PROJECT_COMMENT VARCHAR2(500) not null, /* ��� */
   PROJECT_DETAIL VARCHAR2(700) not null,/* ���丮 */
   PROJECT_PRICE NUMBER not null,/* �Ŀ��ݾ� */
   PROJECT_OPEN DATE DEFAULT SYSDATE, /* ������Ʈ������ */
   PROJECT_CLOSE DATE DEFAULT SYSDATE,/* ������Ʈ������ */
   PROJECT_DATE DATE DEFAULT SYSDATE,/* �ۼ��� */
   PROJECT_MDATE DATE DEFAULT SYSDATE,/* ������ */
   PROJECT_LEVEL VARCHAR2(20) not null,/* ������Ʈ�ܰ� */
   constraint CK_PROJECT_LV CHECK (PROJECT_LEVEL IN('�ݵ���', '�ݵ��Ϸ�', '�ݵ�����', '�ݵ����')),
   constraint FK_PROJ_CREATOR_NUM foreign key(CREATOR_NUM) references CREATOR(CREATOR_NUM),
   constraint FK_PROJ_CATEGORY_NUM foreign key(CATEGORY_NUM) references CATEGORY(CATEGORY_NUM)
);
create sequence SEQ_PROJ_NUM increment by 1 start with 1 nocache;

create table REWARD  ( /* ������ */
   REWARD_NUM NUMBER not null primary key, /* �������ȣ */
   PROJECT_NUM NUMBER not null, /* ������Ʈ��ȣ */
   REWARD_SUB VARCHAR2(200) not null, /* ������� */
   REWARD_PRICE NUMBER not null, /* �ݾ� */
   REWARD_CNT NUMBER not null, /* ���Ѽ��� */
   REWARD_DATE DATE DEFAULT SYSDATE /* �߼۽����� */
);
create sequence SEQ_REWARD_NUM increment by 1 start with 1 nocache;

create table MEM_ORDER ( /* �ֹ� */
   ORDER_NUM NUMBER not null primary key, /* �ֹ���ȣ */
   ADDR_NUM NUMBER not null, /* �������ȣ */
   REWARD_NUM NUMBER not null, /* �������ȣ */
   MEMBER_ID VARCHAR2(50) not null, /* ȸ�����̵� */
   ORDER_NAME VARCHAR2(50) not null, /* �ֹ��� */
   ORDER_PRICE NUMBER not null, /* �ֹ��ݾ� */
   ORDER_DATE DATE DEFAULT SYSDATE, /* �ֹ����� */
   ORDER_STATEMENT VARCHAR2(20) not null, /* �ֹ����� */
   ORDER_OPTION VARCHAR2(100), /* �Է¿ɼǳ��� */
   ORDER_DELIVERY VARCHAR2(20) not null, /* ��۴ܰ� */
   constraint CK_MEM_ORDER_STATE CHECK (ORDER_STATEMENT IN('��������', '�����Ϸ�', '��������', '�ݵ����')),
   constraint CK_MEM_ORDER_DELIVERY CHECK (ORDER_DELIVERY IN('�����غ�', '�߼��غ�', '�߼���', '���޿Ϸ�')),
   constraint FK_OR_ADDR_NUM foreign key(ADDR_NUM) references ADDRESS(ADDR_NUM),
   constraint FK_OR_REWARD_NUM foreign key(REWARD_NUM) references REWARD(REWARD_NUM),
   constraint FK_OR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_MORDER_NUM increment by 1 start with 1 nocache;

-- PAYMENT       ����           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( ������ȣ, �������ȣ, �ֹ���ȣ, ȸ�����̵�, �������, �����ݾ�, ��������, �������νð� )

create table COMMUNITY  ( /* Ŀ�´�Ƽ */
   COMMUNITY_NUM NUMBER not null primary key, /* Ŀ�´�Ƽ�۹�ȣ */
   MEMBER_ID VARCHAR2(50) not null, /* ȸ�����̵� */
   COMMUNITY_SUB VARCHAR2(200) not null, /* Ŀ�´�Ƽ���� */
   COMMUNITY_CON VARCHAR2(700) not null, /* Ŀ�´�Ƽ���� */
   COMMUNITY_DATE DATE DEFAULT SYSDATE, /* Ŀ�´�Ƽ����� */
   COMMUNITY_MDATE DATE DEFAULT SYSDATE, /* Ŀ�´�Ƽ������ */
   COMMUNITY_VIEW NUMBER not null, /* Ŀ�´�Ƽ��ȸ�� */
   constraint FK_CM_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID)
);
create sequence SEQ_COMMUNITY_NUM increment by 1 start with 1 nocache;

create table COMMUNITY_REPLY  ( /* Ŀ�´�Ƽ��� */
   COM_RE_NUM NUMBER not null primary key, /* ��۹�ȣ */
   MEMBER_ID VARCHAR2(50) not null, /* ȸ�����̵� */
   COMMUNITY_NUM NUMBER not null, /* Ŀ�´�Ƽ�۹�ȣ */
   COM_RE_CON VARCHAR2(200) not null, /* Ŀ�´�Ƽ���� */
   COM_RE_DATE DATE DEFAULT SYSDATE, /* Ŀ�´�Ƽ����� */
   COM_RE_MDATE DATE DEFAULT SYSDATE, /* Ŀ�´�Ƽ������ */
   constraint FK_CMR_MEMBER_ID foreign key(MEMBER_ID) references MEMBER(MEMBER_ID),
   constraint FK_CMR_CM_NUM foreign key(COMMUNITY_NUM) references COMMUNITY(COMMUNITY_NUM)
);
create sequence SEQ_COM_RE_NUM increment by 1 start with 1 nocache;

-- REPORT        �Ű�           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( �Ű��ȣ, ��۹�ȣ, �Ű����, �Ű���, �Ű�ó������ )

create table QNA   ( /* �����Խ��� */
   QNA_NUM NUMBER not null primary key, /* �����Խ��ǹ�ȣ */
   QNA_SUB VARCHAR2(200) not null, /* ���� */
   QNA_CON VARCHAR2(700) not null, /* �ۼ��� */
   QNA_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
   QNA_VIEW NUMBER not null, /* ��ȸ�� */
   QNA_CHECK VARCHAR2(12), /* �亯���� */
   constraint CK_QNA_CHECK CHECK (QNA_CHECK IN('�亯���', '�亯�Ϸ�'))
);
create sequence SEQ_QNA_NUM increment by 1 start with 1 nocache;

create table QNA_REPLY  ( /* �����Խ��Ǵ�� */
   QNA_RE_NUM NUMBER not null primary key, /* �����Խ��ǹ�ȣ */
   QNA_NUM NUMBER not null, /* ���� */
   QNA_RE_CON VARCHAR2(700) not null, /* �ۼ��� */
   QNA_RE_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
   QNA_RE_NAME VARCHAR2(50) not null, /* ��ȸ�� */
   constraint FK_QNA_NUM foreign key(QNA_NUM) references QNA(QNA_NUM)
);
create sequence SEQ_QNA_RE_NUM increment by 1 start with 1 nocache;

create table NOTICE  ( /* �������� */
   NOTICE_NUM NUMBER not null primary key, /* �������׹�ȣ */
   NOTICE_SUB VARCHAR2(200) not null, /* ������������ */
   NOTICE_CON VARCHAR2(700) not null, /* �������׳��� */
   NOTICE_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
   NOTICE_VIEW NUMBER not null /* ��ȸ�� */
);
create sequence SEQ_NOTICE_NUM increment by 1 start with 1 nocache;

commit;
select TNAME from TAB;
