package tm.totalre.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.reviewlike.dto.ReviewLikeDTO;
import tm.totalre.dto.TotalreDTO;
import tm.totalre.dto.reviewReplyDTO;

@Service
public class TotalreDAOImpl implements TotalreDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	private String namespace = "totalre";

	@Override
	public TotalreDTO showReview(String id) {
		
		HashMap map = new HashMap();
		map.put("scnum", id);
		System.out.println("--------"+map.get("scnum"));
		
		TotalreDTO dto = ss.selectOne(namespace+".showReviewDetail",map);

		return dto;
	}

	@Override
	public int checkLike(String user_id, String _id) {
		
		HashMap map = new HashMap();
		map.put("user_id", user_id);
		map.put("sc_num", _id);
	
		
		int result = ss.selectOne(namespace+".checkLike",map);
		
		return result;
	}

	@Override
	public ArrayList<TotalreDTO> reviewList(String searchContent) {
		
		HashMap map = new HashMap();
		map.put("searchContent", searchContent);
		
		ArrayList<TotalreDTO> list = (ArrayList)ss.selectList(namespace+".reviewList",map);
		
		return list;
	}
	
	@Override
	   public int insertReview(TotalreDTO totalreDTO) {
	      
	      int result = ss.insert(namespace+".insertReview", totalreDTO);
	      
	      return result;
	   }

	@Override
	public int insertHashtag(TotalreDTO totalreDTO) {

		int result = ss.insert(namespace+".insertHashtag",totalreDTO);
		return result;
	}

	@Override
	public ArrayList showReply(String _id) {
		
		HashMap map = new HashMap();
		map.put("scNum", _id);
		
		ArrayList<reviewReplyDTO> list = (ArrayList)ss.selectList(namespace+".showReply",map);
		return list;
	}

	@Override
	public int insertReply(reviewReplyDTO reviewReplyDTO) {
		
		int result = ss.insert(namespace+".insertReply",reviewReplyDTO);
		
		
		return result;
	}
	
	

}
