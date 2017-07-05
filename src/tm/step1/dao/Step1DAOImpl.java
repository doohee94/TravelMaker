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
	
	@Override
	public List<MemberDTO> fellowsearch(String modalsearchplace){
		HashMap map = new HashMap();
	
		map.put("id", modalsearchplace);
		System.out.println(map.toString());
		List<MemberDTO> list = ss.selectList(namespace+".step1list", map);
		System.out.println(list.get(0).getUserId());
		return list;
	}

//	@Override
//	public List<Step1DTO> Step1list() {
//		
//		List<Step1DTO> list = ss.selectList(namespace+".step1list");
//		
//		return list;
//		
//	}
}