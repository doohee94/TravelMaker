package tm.recommandtravelregion.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommandTravelRegionDAOImpl implements RecommandTravelRegionDAO {

	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "recommand";
	
	@Override
	public String searchLikeSpot(String userId) {
		
		
		HashMap map = new HashMap();		
		map.put("userId",userId);
		System.out.println("받아온거"+userId);
		String likespot = ss.selectOne(namespace+".recommandUserId",map);
		return likespot;
	}

	
	
	@Override
	public void plusLikeBtn(String userId){
		
		HashMap map = new HashMap();
		
		map.put("user_id", userId);
		
		// 해당 여행지를 식별할 수 있는 값
		map.put(key, value);
		
		// 좋아요 버튼 개수
		map.put(key, value);
		
		ss.insert(namespace+".plusLike", map);
	}
	
	
	@Override
	public void minusLikeBtn(){
		
		HashMap map = new HashMap();
		
		map.put("user_id", user_id);
		
		// 해당 여행지를 식별할 수 있는 값
		map.put(key, value);
		
		// 좋아요 버튼 개수
		map.put(key, value);
		
		ss.delete(namespace+".minusLike", map);
		
	}
	
	
	
	
}
