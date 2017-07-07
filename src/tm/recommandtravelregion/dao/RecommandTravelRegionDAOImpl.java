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

}
