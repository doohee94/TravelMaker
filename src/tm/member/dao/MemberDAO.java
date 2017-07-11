package tm.member.dao;

import java.util.List;

import tm.member.dto.LikelocDTO;
import tm.member.dto.MemberDTO;

public interface MemberDAO {

	/**
	 * 회원가입
	 */
	public int insert(MemberDTO memberdto);
	
	/**
	 * ID중복체크
	 */
	public int idcheck(String userid);
	
	/**
	 * Email 체크
	 */
	public int emailcheck(String useremail);
	
	/**
	 * 회원정보보기
	 */
	public MemberDTO update(MemberDTO memberdto);
	
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
	
	/**
	 * 관심지역 추가
	 */
	public int insertLoc(LikelocDTO likelocdto);
	
	/**
	 * 관심지역 가져오기likeloclist
	 */
	public List<LikelocDTO> likeloclist(String id);
	
	/**
	 * 관심지역 수정
	 */
	public int likelocmodify(LikelocDTO likelocdto);
}
