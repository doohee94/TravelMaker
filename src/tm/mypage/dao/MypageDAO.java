package tm.mypage.dao;

import java.util.List;

import tm.mypage.dto.LikeSpotDTO;
import tm.mypage.dto.QnaDTO;

public interface MypageDAO {
	public List<LikeSpotDTO> listSpot(String userId);
	
	public Integer deleteSpot (String likespotNum );

	public List listSchedule(String userId);

	public int deleteSchedule(String likescNum);

	public List<QnaDTO> listQnA(String userId);

	public int inputQna(String userId,String qnaType,String qnaContent);
}
