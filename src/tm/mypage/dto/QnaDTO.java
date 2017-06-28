package tm.mypage.dto;

public class QnaDTO {
	/*
CREATE TABLE QNA (
	qna_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_qna_num PRIMARY KEY, -- QnA번호
	user_id     VARCHAR2(50)   NOT NULL, -- 회원ID
	qna_date    DATE           NOT NULL, -- 날짜
	qna_type    VARCHAR2(50)   NOT NULL, -- 문의/신고타입
	qna_content VARCHAR2(1024) NOT NULL, -- 내용
	qna_reply   VARCHAR2(1024) NULL,     -- 답변내용
	CONSTRAINT fk_tm_qna_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);
	*/
	
	private String qnaNum;
	private String userId;
	private String qnaDate;
	private String qnaType;
	private String qnaContent;
	private String qnaReply;
	
	public String getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(String qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	

	
}

