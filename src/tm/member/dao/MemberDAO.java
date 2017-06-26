package tm.member.dao;

import tm.member.dto.MemberDTO;

public interface MemberDAO {

	/**
	 * 회원가입
	 */
	public int insert(MemberDTO memberdto);
}
