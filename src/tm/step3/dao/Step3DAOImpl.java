package tm.step3.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Step3DAOImpl implements Step3DAO {

	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "stepthree";
	
	@Override
	public String searchUser(String searchUserID) {
		
		HashMap map = new HashMap();		
		map.put("userId",searchUserID);
		System.out.println("받아온거"+searchUserID);
		String userId = ss.selectOne(namespace+".stepthreeSearchId",map);
		
		return userId;
	}

}
