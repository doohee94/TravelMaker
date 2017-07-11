package tm.step1.dao;

import java.util.List;

import tm.member.dto.MemberDTO;
import tm.step1.dto.StepDTO;

public interface Step1DAO {

	/** 동행자 검색 */
	public List<MemberDTO> fellowsearch(String modalsearchplace, String userId);
	 
}
