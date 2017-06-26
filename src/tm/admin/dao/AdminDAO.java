package tm.admin.dao;

import java.util.HashMap;
import java.util.List;

import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;
import tm.admin.dto.AdminadDTO;
import tm.alliance.dto.AllianceDTO;

public interface AdminDAO {
	
	
	/************** 회원 ******************/
	
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
	
	
	/************** QNA ******************/
	
	/**
	 * qnalist
	 * QNA 전체 리스트를 출력
	 */
	public List<AdminQnaDTO> qnalist();
	
	
	/**
	 * qnareply
	 * QNA 답변 저장
	 */
	public int qnareply(AdminQnaDTO adminQnaDTO);
	
	
	/************** 광고 ******************/
	
	/**
	 * adlist
	 * 광고 리스트 출력
	 */
	public List<AdminadDTO> adlist();
	
	/**
	 * adadinsert
	 * 광고 추가
	 */
	public int adadinsert(AdminadDTO adminadDTO);
	
	/**
	 * addelete
	 * 광고 삭제
	 */
	public int addelete(String num);
	
	
	/************** 제휴 ******************/
	

	/**
	 * alsearch
	 * 제휴 검색 리스트 출력
	 */
	public List<AllianceDTO> alsearch(String partnercomname);
	
	/**
	 * adallist
	 * 제휴 리스트 출력
	 */
	public List<AllianceDTO> adallist();
	
	/**
	 * allianceDel
	 * 제휴 삭제 / 거절
	 */
	public int allianceDel(String num); 
	
	/**
	 * adminalup
	 * 제휴 승인
	 */
	public int adminalup(String num);

	
	/**
	 * stateupdate 
	 * 제휴 타입 변경
	 */
	public int typeupdate(AllianceDTO allianceDTO); 
	
}
