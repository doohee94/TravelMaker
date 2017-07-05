package tm.step1.dao;

import java.util.List;

import tm.member.dto.MemberDTO;
import tm.step1.dto.StepDTO;

public interface Step1DAO {

//	public List<Step1DTO> Step1list();
	/*회원의 기록을 */
	public List<MemberDTO> fellowsearch(String modalsearchplace);
	 
}
