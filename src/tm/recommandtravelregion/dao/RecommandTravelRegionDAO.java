package tm.recommandtravelregion.dao;

import java.util.ArrayList;

public interface RecommandTravelRegionDAO {

	public String searchLikeSpot(String userId);
	
	
	// Q) 리뷰상세페이지 좋아요 버튼은 user_id, sc_num 을 디비에 저장해주는데
	
	// 추천여행지 상세페이지 좋아요 버튼은 좋아요 버튼을 누르면 해당 여행지의 좋아요 개수가 증가해야 하고
	// 해당 여행지의 정보 + 좋아요 개수를 디비에 저장해야한다고 생각
	
	// 해댱 여행지 정보는 api 에서 받아오는거 같은데 그렇다면 이 정보를 구별하는 값은 뭐지?
	
	
	public void plusLikeBtn(String userId, String contentid);
	
	public void minusLikeBtn(String userId, String contentid);
	
	public String likeSpotList(String userId, String contentid);
	
	public ArrayList<String> findList();
}
