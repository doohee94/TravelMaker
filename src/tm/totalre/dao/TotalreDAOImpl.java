package tm.totalre.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import tm.totalre.dto.TotalreDTO;

public class TotalreDAOImpl implements TotalreDAO {
	
	SqlSessionTemplate ss;
	private String namespace = "totalre";

	@Override
	public TotalreDTO showReview(String _id) {
		
		HashMap map = new HashMap();
		map.put("sc_num", _id);
		
		TotalreDTO dto = ss.selectOne(namespace+".showReviewDetail",map);

		return dto;
	}

}
