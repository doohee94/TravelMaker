CREATE TABLE partner (
	partner_num       VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_partner_num PRIMARY key, -- 제휴번호
	partner_reginum   VARCHAR2(50)   NOT NULL, -- 사업자등록번호
	partner_comname   VARCHAR2(50)   NOT NULL, -- 회사명
	partner_photo     VARCHAR2(50)   ,         -- 사업자등록증사진경로
	partner_photofake VARCHAR2(500)  ,         -- 사업자등록증 가짜이름
	partner_ceoname   VARCHAR2(50)   NOT NULL, -- 대표명
	partner_email     VARCHAR2(50)   NOT NULL, -- EMAIL
	partner_tel       VARCHAR2(50)   NOT NULL, -- 연락처
	partner_content   VARCHAR2(1024) NOT NULL, -- 문의내용
  partner_date      date           NOT NULL, -- 등록일
	partner_state     NUMBER         NOT NULL, -- 승인/비승인상태
	partner_type      NUMBER         NOT NULL  -- 제휴종류상태
);

CREATE SEQUENCE seq_partner
INCREMENT BY 1
START WITH 1;

CREATE TABLE member (
  user_id       VARCHAR2(50)    NOT NULL CONSTRAINT pk_tm_user_id PRIMARY KEY, -- 회원ID
  user_pw       VARCHAR2(50)    NOT NULL, -- 비밀번호
  user_name     VARCHAR2(50)    NOT NULL, -- 이름
  user_nick     VARCHAR2(50)    NOT NULL, -- 닉네임
  user_addr     VARCHAR2(100)   NOT NULL, -- 주소
  user_tel      VARCHAR2(50)    NOT NULL, -- 전화번호
  user_type     NUMBER          NOT NULL, -- 회원타입
  user_date     DATE            NOT NULL  -- 가입날짜
);

CREATE SEQUENCE seq_member
INCREMENT BY 1
START WITH 1;


CREATE TABLE QNA (
	qna_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_qna_num PRIMARY KEY, -- QnA번호
	user_id     VARCHAR2(50)   NOT NULL, -- 회원ID
  qna_date    DATE           NOT NULL, -- 날짜
	qna_type    VARCHAR2(50)   NOT NULL, -- 문의/신고타입
	qna_content VARCHAR2(1024) NOT NULL, -- 내용
	qna_reply   VARCHAR2(1024) NULL,     -- 답변내용
  CONSTRAINT fk_tm_qna_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seq_qna
INCREMENT BY 1
START WITH 1;
commit;
