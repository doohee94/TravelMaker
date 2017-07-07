package tm.mobile.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.mobile.dto.MobileDTO;

@Service
public class MobileDAOImpl implements MobileDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mobile";
	
	/**
	 * inputPlace
	 * userId, parstempNum 값을 HashMap map에 담아서 
	 * DB에 입력값 저장후 성공하면 성공값을 result로 리턴받음
	 * return = result  
	 */
	public int inputPlace(String userId, String parstempNum) {
	//글번호 작성 부분
		//db에서 시퀀스 값을 가져옴
		String num = ss.selectOne(namespace + ".snumber");
	// 글번호 생성 부분
		//글번호 앞에 붙일 이름을 설정 후
		String str = "stemp";
		//번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
		str += "0";
		}
		//생성된 번호를 뒤에 붙임
		str += num;			
		//HashMap map객체 생성
		HashMap map = new HashMap();
		//map에 stempNum을 담음
		map.put("stempNum", str);
		//map에 userId를 담음
		map.put("userId", userId);
		//map에 parstempNum를 담음
		map.put("parstempNum", parstempNum);
		int result = 0;
		//DB에 입력후 result에 결과값을 받음
		result = ss.insert(namespace+".insert",map);
		//결과값 리턴
		return result;
	}
	
	/**
	 * login
	 * userId와 userPass의 값을 HashMap map에 담아서 
	 * db에 비교후 일치하는 컬럼을 MobileDTO dto에 담음
	 * dto를 리턴
	 */
	@Override
	public MobileDTO login(String userId, String userPw) {
		//HashMap map객체 생성
		HashMap map = new HashMap();
		//map에 userId를 담음
		map.put("userId", userId);
		//map에 userPass를 담음
		map.put("userPw", userPw);
		//db에서 일치라는 컬럼을 검색 후 dto에 담음
		MobileDTO dto = ss.selectOne(namespace+".login",map);
		//dto를 리턴
		return dto;
	}

}
