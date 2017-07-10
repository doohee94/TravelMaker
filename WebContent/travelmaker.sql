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
	partner_type      NUMBER         NOT NULL,  -- 제휴종류상태
	partner_addr	  varchar(100)				-- 회사 주소
);

CREATE SEQUENCE seq_partner
INCREMENT BY 1
START WITH 1;

partner_state
10 : 비승인
20 : 승인

partner_type
0 :승인대기
10:제휴만
20:광고등록
30:스탬프등록
40:광고+스탬프


CREATE TABLE member (
	user_id			VARCHAR2(50)    NOT NULL CONSTRAINT pk_tm_user_id PRIMARY KEY, -- 회원ID
	user_pw			VARCHAR2(50)    NOT NULL, -- 비밀번호
	user_name		VARCHAR2(50)    NOT NULL, -- 이름
	user_nick		VARCHAR2(50)    NOT NULL, -- 닉네임
	user_addr		VARCHAR2(100)   NOT NULL, -- 주소
	user_tel		VARCHAR2(50)    NOT NULL, -- 전화번호
	user_type		NUMBER          NOT NULL, -- 회원타입
	user_date		DATE            NOT NULL  -- 가입날짜
	user_email		VARCHAR2(50)	NOT NULL  -- 이메일
);

CREATE SEQUENCE seq_member
INCREMENT BY 1
START WITH 1;

user_type
회원 : 10
탈퇴한회원 : 20
관리자 : 30

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

CREATE TABLE advertisement (
	ad_num       VARCHAR2(50)  NOT NULL CONSTRAINT pk_tm_ad_num PRIMARY KEY, -- 광고번호
	partner_num  VARCHAR2(50)  NOT NULL, -- 제휴번호
	ad_title     VARCHAR2(50)  NULL,     -- 타이틀
	ad_photo     VARCHAR2(50)  NOT NULL, -- 광고사진이름
	ad_photofake VARCHAR2(500) NOT NULL, -- 광고사진가짜이름
	ad_check     NUMBER        NOT NULL, -- 체크
	ad_stdate    DATE          NOT NULL, -- 시작날짜
	ad_eddate    DATE          NOT NULL, -- 끝날짜
	CONSTRAINT fk_tm_partner_num FOREIGN Key (partner_num) REFERENCES partner(partner_num)
);

CREATE SEQUENCE seq_advertisement
INCREMENT BY 1
START WITH 1;

CREATE TABLE member (
	user_id			VARCHAR2(50)    NOT NULL CONSTRAINT pk_tm_user_id PRIMARY KEY, -- 회원ID
	user_pw			VARCHAR2(50)    NOT NULL, -- 비밀번호
	user_name		VARCHAR2(50)    NOT NULL, -- 이름
	user_nick		VARCHAR2(50)    NOT NULL, -- 닉네임
	user_addr		VARCHAR2(100)   NOT NULL, -- 주소
	user_tel		VARCHAR2(50)    NOT NULL, -- 전화번호
	user_type		NUMBER          NOT NULL, -- 회원타입
	user_date		DATE            NOT NULL,  -- 가입날짜
	user_email		VARCHAR2(50)	NOT NULL  -- 이메일
);

CREATE SEQUENCE seq_member
INCREMENT BY 1
START WITH 1;

CREATE TABLE likespot (
	likespot_num	VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_likespot_num PRIMARY KEY, -- 관심여행지번호
	user_id			VARCHAR2(50)   NOT NULL,       -- 회원ID
	likespot_name	VARCHAR2(50)   NOT NULL,    -- 지역이름
	likespot_reason	VARCHAR2(50)   NOT NULL,    -- 이유
	CONSTRAINT fk_tm_likespot_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seq_likespot
INCREMENT BY 1
START WITH 1;

CREATE TABLE likeloc (
	likeloc_num  VARCHAR2(50) NOT NULL CONSTRAINT pk_tm_likeloc_num PRIMARY KEY, -- 관심지역번호
	user_id      VARCHAR2(50) NOT NULL, -- 회원ID
	likeloc_name VARCHAR2(50) NOT NULL,  -- 지역이름
	CONSTRAINT fk_tm_likeloc_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seq_likeloc
INCREMENT BY 1
START WITH 1;


CREATE TABLE totalre (
	totalre_num      	VARCHAR2(50)  NOT NULL CONSTRAINT pk_tm_totalre_num PRIMARY KEY, -- 전체 리뷰 번호
	user_id				VARCHAR2(50)   NOT NULL,	--회원 아이디 
	sc_num				VARCHAR2(50)   NOT NULL,	--일정 번호 
	totalre_title		VARCHAR2(50)   NOT NULL,	--리뷰 제목 
	totalre_content		VARCHAR2(1024)   NOT NULL,	--리뷰 내용 
	totalre_photo4		VARCHAR2(50)   NOT NULL,	--사진 4 
	totalre_photo4fake	VARCHAR2(500)   NOT NULL,	--사진 4 가짜 
	totalre_photo3		VARCHAR2(50)   NOT NULL,	--사진 3
	totalre_photo3fake	VARCHAR2(500)   NOT NULL,	--사진 3 가짜 
	totalre_photo2		VARCHAR2(50)   NOT NULL,	--사진 2
	totalre_photo2fake	VARCHAR2(500)   NOT NULL,	--사진 2 가짜 
	totalre_photo1		VARCHAR2(50)   NOT NULL,	--사진 1
	totalre_photo1fake	VARCHAR2(500)   NOT NULL,	--사진 1 가짜 
	totalre_likecount	VARCHAR2(50)   NOT NULL,	--좋아요수
	CONSTRAINT fk_tm_totalre_user_id FOREIGN Key (user_id) REFERENCES member(user_id)	
);

CREATE SEQUENCE seq_totalre
INCREMENT BY 1
START WITH 1;

CREATE TABLE likesc (
	likesc_num		VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_likesc_num PRIMARY KEY, -- 관심일정번호
	user_id			VARCHAR2(50)   NOT NULL,    -- 회원ID
	sc_num			VARCHAR2(50)   NOT NULL,    -- 지역이름
	likesc_reason	VARCHAR2(50)   NOT NULL,    -- 이유
	CONSTRAINT fk_tm_likesc_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seq_likesc
INCREMENT BY 1
START WITH 1;

CREATE TABLE stemp (
	stemp_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_stemp_num PRIMARY KEY, -- 스템프 번호
	parstemp_num   VARCHAR2(50)   NOT NULL, -- 제휴 스템프 번호
	user_id       VARCHAR2(50)   NOT NULL, -- 회원ID
	stemp_date    DATE,                    -- 찍은 날짜
	CONSTRAINT fk_tm_stemp_user_id FOREIGN Key (user_id) REFERENCES member(user_id),
    CONSTRAINT fk_tm_stemp_parstemp_num FOREIGN Key (parstemp_num) REFERENCES parstemp(parstemp_num)
);

CREATE SEQUENCE seq_stemp
INCREMENT BY 1
START WITH 1;

CREATE TABLE parstemp (
	parstemp_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_parstemp_num PRIMARY KEY, --제휴 스템프 번호
	partner_num      VARCHAR2(50)   NOT NULL, -- 제휴ID
	partner_name     VARCHAR2(50)   NOT NULL, -- 제휴스템프 지점명
	partner_addr     VARCHAR2(50)   NOT NULL, -- 지점 주소
	parstemp_qrcodeimg VARCHAR2(20)			  -- QR이미지
    CONSTRAINT fk_tm_stemp_partner_num FOREIGN Key (partner_num) REFERENCES partner(partner_num)
);
CREATE SEQUENCE seq_parstemp
INCREMENT BY 1
START WITH 1;


create table reviewlike(
  user_id varchar2(50) not null,	-- 유저 ID
  sc_num varchar2(50) not null,		-- 좋아요 누른 리뷰 번호
  CONSTRAINT fk_tm_reviewlike_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);


commit;
