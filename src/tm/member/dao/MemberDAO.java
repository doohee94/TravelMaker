package tm.member.dao;

import java.util.List;

import tm.member.dto.MemberDTO;

public interface MemberDAO {

	/**
	 * 회원가입
	 */
	public int insert(MemberDTO memberdto);
	
	/**
	 * 회원정보보기
	 */
	/*public List<MemberDTO> list();*/
	public int update(MemberDTO memberdto);
	
	/**
	 * 회원수정
	 */
	public int modify(MemberDTO memberdto);
	
	/**
	 * 회원탈퇴
	 */
	public int delete(MemberDTO memberdto);
	
	/**
	 * ID찾기
	 */
	public MemberDTO searchId(String userName, String userEmail);
	
	/**
	 * PW찾기
	 */
	public MemberDTO searchPw(String userId, String userEmail);
	
	
}
