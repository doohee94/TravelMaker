package tm.totalre.dao;

import java.util.ArrayList;

import tm.totalre.dto.TotalreDTO;
import tm.totalre.dto.reviewReplyDTO;

public interface TotalreDAO {
	
	public TotalreDTO showReview(String _id);
	
	public int checkLike(String user_id, String _id);
	
	public ArrayList reviewList(String searchContent);
	
	public int insertReview(TotalreDTO totalreDTO);
	
	public int insertHashtag(TotalreDTO totalreDTO);
	
	public reviewReplyDTO insertReply(reviewReplyDTO reviewReplyDTO);
}
