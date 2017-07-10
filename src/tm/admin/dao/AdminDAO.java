package tm.admin.dao;

import java.util.HashMap;
import java.util.List;

import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;
import tm.admin.dto.AdminStempDTO;
import tm.admin.dto.AdminadDTO;
import tm.alliance.dto.AllianceDTO;

public interface AdminDAO {
	
	
	/************** 페이징 ******************/
	//회원 / 광고 / QNA
	public int[] SettingPageNum(String table, int countpage, int pageNum, String sel, String con);
	//제휴
	public int[] SettingPageNum(int type, int countpage, int pageNum, int state, String str);
	
	/************** 회원 ******************/
	
	/**
	 * MemberList
	 * 회원 목록을 가져옴
	 */
	public List<AdminMemberDTO> MemberList();
	public List<AdminMemberDTO> MemberList(int startnum, int endnum);
	
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
	public List<AdminMemberDTO> Membersearch(String sel, String con, int startnum, int endnum);
	
	
	/************** QNA ******************/
	
	/**
	 * qnalist
	 * QNA 전체 리스트를 출력
	 */
	public List<AdminQnaDTO> qnalist();
	public List<AdminQnaDTO> qnalist(int startnum, int endnum);
	
	
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
	public List<AdminadDTO> adlist(int startnum, int endnum);
	public List<AdminadDTO> adsearch(int startnum, int endnum, String partnerComname);
	
	
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
	
	/**
	 * adminadshow
	 * 광고 보기
	 */
	public AdminadDTO adminadshow(String num);
	
	/**
	 * adupdate
	 * 광고 수정
	 */
	public int adupdate(AdminadDTO adminadDTO);
	
	/**
	 * adcheck
	 * 광고 설정
	 */
	public int adcheck(String num, String state);
	
	
	/************** 스탬프 ******************/
	/**
	 * stemp
	 * 스탬프 리스트
	 */
	public List<AdminStempDTO> stemp();
	public List<AdminStempDTO> stemp(int startnum, int endnum);
	
	/**
	 * insertstemp
	 * 스탬프 추가
	 */
	public String insertstemp(AdminStempDTO adminStempDTO);
	
	/**
	 * searchstemp
	 */
	public List<AdminStempDTO> searchstemp(int startnum, int endnum, String partnerName);
	
	/**
	 * showStemp
	 * 스탬프 하나의 정보
	 */
	public AdminStempDTO showStemp(String parstempNum);
	
	/**
	 * stempupdate
	 * 스탬프 정보 수정
	 */
	public int stempupdate(AdminStempDTO adminStempDTO);
	
	/**
	 * stempcreation
	 * 스탬프 이미지 등록
	 */
	public int stempcreation(String num);
	
	
	
	/************** 제휴 ******************/
	

	/**
	 * alsearch
	 * 제휴 검색 리스트 출력 
	 */
	public List<AllianceDTO> alsearch(String partnercomname);
	public List<AllianceDTO> alsearch(int startnum, int endnum,String partnercomname);
	public List<AllianceDTO> alsearchRec(int startnum, int endnum,String partnercomname);
	
	/**
	 * adallist
	 * 제휴 리스트 출력
	 */
	public List<AllianceDTO> adallist();
	public List<AllianceDTO> adallist(int startnum, int endnum);
	public List<AllianceDTO> adallistRec(int startnum, int endnum);
	
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
