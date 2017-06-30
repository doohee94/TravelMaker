package tm.reviewlike.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeDAOImpl implements ReviewLikeDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "reviewlike";

	@Override
	public void insertReviewLike(String user_id, String sc_num) {
		
		HashMap map = new HashMap();
		map.put("user_id", user_id);
		map.put("sc_num", sc_num);
		
		ss.insert(namespace+".insertLike", map);
		
	}

	@Override
	public void deleteReviewLike(String user_id, String sc_num) {
		
		HashMap map = new HashMap();
		map.put("user_id", user_id);
		map.put("sc_num", sc_num);
		
		ss.delete(namespace+".deleteLike", map);
		
	}

}
