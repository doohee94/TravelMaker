package tm.registreview.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.totalre.dto.TotalreDTO;

@Service
public class registReviewDAOImpl implements registReviewDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "registReview";

	@Override
	public int insertReview(TotalreDTO totalreDTO) {
		
		int result = ss.insert(namespace+".insertReview", totalreDTO);
		
		return result;
	}

}
