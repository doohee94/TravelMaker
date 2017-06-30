package tm.totalre.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.reviewlike.dto.ReviewLikeDTO;
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

	@Override
	public int checkLike(String user_id, String _id) {
		
		HashMap map = new HashMap();
		map.put("user_id", user_id);
		map.put("sc_num", _id);
	
		
		int result = ss.selectOne(namespace+".checkLike",map);
		
		return result;
	}

}
