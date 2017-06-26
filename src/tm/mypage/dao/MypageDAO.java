package tm.mypage.dao;

import java.util.List;

import tm.mypage.dto.LikeSpotDTO;

public interface MypageDAO {
	public List<LikeSpotDTO> listSpot(String userId);
	
	public Integer deleteSpot (String userId , String likespotNum );
}
