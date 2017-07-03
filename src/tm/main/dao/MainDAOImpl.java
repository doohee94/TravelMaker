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
		System.out.println("받아오기 전입니다");
		List<String> adList = ss.selectList(namespace+".selectad");
		Random random = new Random();
		int i = random.nextInt(adList.size());
		String imgPath = adList.get(i).toString();
		System.out.println("랜덤이미지는 : "+imgPath);
		return imgPath;
	}
	/**
	 * loadReview
	 * DB에서 리뷰 중에 좋아요 수가 높은 top3의 컬럼들을 가져와 list에 담음
	 * 가져온 list를 리턴시킨다.
	 */
	@Override
	public List<TotalreDTO> loadReview() {
		System.out.println("디비타기전");
		List<TotalreDTO> list = ss.selectList(namespace+".selectreview");
		for(int i = 0 ; i<list.size(); i++){
			System.out.println((i)+"번째 사진주소는 : "+list.get(i).getTotalrePhoto1fake());
			System.out.println((i)+"번째 리뷰이름 : "+list.get(i).getTotalreTitle());
			System.out.println((i)+"번째 좋아요수 는  : "+list.get(i).getTotalreLikecount());
			}
		return list;
	}

}
