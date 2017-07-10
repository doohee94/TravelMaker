package tm.mylist.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MylistDAOImpl implements MylistDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mylist";
	
	@Override
	public String findReview(String _id) {
		
		HashMap map = new HashMap();		
		map.put("_id",_id);
		System.out.println("마이리스트"+_id);
		String totalre_num = ss.selectOne(namespace+".searchNum",map);
		System.out.println("받아온값"+totalre_num);
		return totalre_num;
	}

	@Override
	public void deleteReview(String _id) {
		HashMap map = new HashMap();		
		map.put("_id",_id);
		//리뷰 삭제
		ss.delete(namespace+".delete", map);
		//해당 리뷰의 댓글 삭제
		ss.delete(namespace+".deleteReply",map);
		//해당 리뷰의 좋아요 삭제
		ss.delete(namespace+".deleteLike",map);
		//해당 리뷰의 해시태그 삭제
		ss.delete(namespace+".deleteHashtag",map);
		
	}

}
