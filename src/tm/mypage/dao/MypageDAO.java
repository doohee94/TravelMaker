package tm.mypage.dao;

import java.util.ArrayList;
import java.util.List;

import tm.mypage.dto.LikeSpotDTO;
import tm.mypage.dto.QnaDTO;
import tm.mypage.dto.StempDTO;
import tm.totalre.dto.TotalreDTO;

public interface MypageDAO {
	public List<LikeSpotDTO> listSpot(String userId);
	
	public Integer deleteSpot (String likespotNum );

	public int deleteSchedule(String likescNum);

	public List<QnaDTO> listQnA(String userId, int pageNum);

	public int inputQna(String userId,String qnaType,String qnaContent);

	public List<StempDTO> ListStemp(String userId);

	public List<StempDTO> listNotStemp(String userId);
	
	public ArrayList selectLikeReview(String userId);
	
	public TotalreDTO selectReview(String scNum);

	int findPage(String userId);
}
