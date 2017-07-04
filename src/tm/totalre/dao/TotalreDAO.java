package tm.totalre.dao;

import java.util.ArrayList;

import tm.totalre.dto.TotalreDTO;

public interface TotalreDAO {
	
	public TotalreDTO showReview(String _id);
	
	public int checkLike(String user_id, String _id);
	
	public ArrayList reviewList();

}
