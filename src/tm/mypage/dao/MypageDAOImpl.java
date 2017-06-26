package tm.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.mypage.dto.LikeSpotDTO;

@Service
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mypage";
		
	
	/*
	listSpot
	HashMap map에 userId를 넣어 db에서 userId와 일치하는 관심지역 list를 불러옴
	*/
	@Override
	public List<LikeSpotDTO> listSpot(String userId) {
		HashMap map = new HashMap();
		map.put("userId",userId);
		System.out.println("유저아이디"+userId);
		List<LikeSpotDTO> list = ss.selectList(namespace+".listspot",map);
		return list;
	}
	/*
	deleteSpot
	HashMap map에 userId와likespotNum을 넣어 db에서 userid와 일치하는 관심지역 list를 불러옴
	*/
	@Override
	public Integer deleteSpot(String userId,String likespotNum) {
		HashMap map = new HashMap();
		map.put("userId",userId);
		map.put("likespotNum",likespotNum);
		int result = ss.delete(namespace+".deletespot",map);
		return result;
	}

}

