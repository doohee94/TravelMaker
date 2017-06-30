package tm.totalre.dao;

import tm.reviewlike.dto.ReviewLikeDTO;
import tm.totalre.dto.TotalreDTO;

public interface TotalreDAO {
	
	public TotalreDTO showReview(String _id);
	
	public int checkLike(String user_id, String _id);

}
