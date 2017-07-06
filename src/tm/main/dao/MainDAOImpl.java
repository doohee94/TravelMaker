package tm.main.dao;

import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.main.dto.TotalreDTO;

@Service
public class MainDAOImpl implements MainDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "main";
	
	/**
	 * loadAd
	 * DB에서 이미지 주소를 받아 list로 담는다.
	 * list의 임의의 숫자 i번째 주소값을 불러온다.
	 * 받아온 주소를 imgPath에 담아 리턴시긴다. 
	 */
	@Override
	public String loadAd() {
		//db에서 광고리스트를 받아 adList에 담기
		List<String> adList = ss.selectList(namespace+".selectad");
		//임의의 수를 만들기위해 Random 선언
		Random random = new Random();
		//adList의 크기 안에서 임의의 수 i를 생성시킴
		int i = random.nextInt(adList.size());
		//adList의 i번째 광고 이미지 주소를 받아옴
		String imgPath = adList.get(i).toString();
		//받아온 이미지주소를 리턴시킴
		return imgPath;
	}
	/**
	 * loadReview
	 * DB에서 리뷰 중에 좋아요 수가 높은 top3의 컬럼들을 가져와 list에 담음
	 * 가져온 list를 리턴시킨다.
	 */
	@Override
	public List<TotalreDTO> loadReview() {
		//db에서 컬럼을 받아 list로 담음
		List<TotalreDTO> list = ss.selectList(namespace+".selectreview");
		//list를 리턴
		return list;
	}

}
