package tm.admin.dao;

import java.util.HashMap;
import java.util.List;

import tm.admin.dto.AdminMemberDTO;

public interface AdminDAO {
	
	/**
	 * MemberList
	 * 회원 목록을 가져옴
	 */
	public List<AdminMemberDTO> MemberList();
	
	/**
	 * Membershow
	 * 한 회원 정보를 가져옴
	 * @param id
	 * @return AdminMemberDTO
	 */
	public AdminMemberDTO Membershow(String id);
	
	/**
	 * Membersearch
	 * 회원 검색 결과 리스트를 출력
	 */
	public List<AdminMemberDTO> Membersearch(String sel, String con);
	
}
