package tm.recommandtravelregion.dao;

import java.util.ArrayList;
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
	public void plusLikeBtn(String userId, String contentid){
		
		HashMap map = new HashMap();
		
		map.put("userId", userId);
		
		// 해당 여행지를 식별할 수 있는 값
		map.put("contentid", contentid);
		
		
		ss.insert(namespace+".plusLike", map);
	}
	
	
	@Override
	public void minusLikeBtn(String userId, String contentid){
		
		HashMap map = new HashMap();
		
		map.put("userId", userId);
		
		// 해당 여행지를 식별할 수 있는 값
		map.put("contentid", contentid);
		
		
		ss.delete(namespace+".minusLike", map);
		
	}


	

	@Override
	public String likeSpotList(String userId, String contentid) {
		

		HashMap map = new HashMap();
		
		map.put("userId", userId);
		
		// 해당 여행지를 식별할 수 있는 값
		map.put("contentid", contentid);
		
		String result = ss.selectOne(namespace+".findLikeSpot", map);
		
		
		return result;
	}



	@Override
	public ArrayList<String> findList() {
		
		ArrayList list = (ArrayList)ss.selectList(namespace+".findList");
		
		
		return list;
	}
	
	
	
	
}
