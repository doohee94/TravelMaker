package tm.step1.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.step1.dto.Step1DTO;

@Service
public class Step1DAOImpl implements Step1DAO{
	 
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace ="step1";
	
	@Override
	public List<Step1DTO> fellowsearch(String con){
		HashMap map = new HashMap();
	
		map.put("con", con);
		
		List<Step1DTO> list = ss.selectList(namespace+".step1list", map);
		return list;
	}

	@Override
	public List<Step1DTO> Step1list() {
		
		List<Step1DTO> list = ss.selectList(namespace+".step1list");
		
		return list;
		
	}
}