package tm.totalre.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.totalre.dto.TotalreDTO;

@Service
public class TotalreDAOImpl implements TotalreDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	private String namespace = "totalre";

	@Override
	public TotalreDTO showReview(String id) {
		
		HashMap map = new HashMap();
		map.put("scnum", id);
		System.out.println("--------"+map.get("scnum"));
		
		TotalreDTO dto = ss.selectOne(namespace+".showReviewDetail",map);

		return dto;
	}

}
