package tm.step1.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.member.dto.MemberDTO;
import tm.step1.dto.StepDTO;

@Service
public class Step1DAOImpl implements Step1DAO{
	  
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace ="step1";
	
	/** 동행자 검색*/
	@Override
	public List<MemberDTO> fellowsearch(String modalsearchplace, String userId){
		HashMap map = new HashMap();
		map.put("id", modalsearchplace);
		map.put("userId", userId);
		
		List<MemberDTO> list = ss.selectList(namespace+".step1list", map);
		
		return list;
	}

}