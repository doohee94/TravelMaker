package tm.reviewlike.dao;

public interface ReviewLikeDAO {

	public void insertReviewLike(String user_id, String sc_num);
	
	public void deleteReviewLike(String user_id, String sc_num);
}
