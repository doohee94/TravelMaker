package tm.mobile.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MobileDAOImpl implements MobileDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mobile";
	
	/**
	 * inputPlace
	 * userId, parstempNum 값을 HashMap map에 담아서 
	 * DB에 입력값 저장후 성공하면 성공값을 result로 리턴받음
	 * return = result  
	 */
	public int inputPlace(String userId, String parstempNum) {
		//HashMap map객체 생성후 각각 담음
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("parstempNum", parstempNum);
		int result = 0;
		//DB에 입력후 result에 결과값을 받음
		result = ss.insert(namespace+".insert",map);
		return result;
	}

}