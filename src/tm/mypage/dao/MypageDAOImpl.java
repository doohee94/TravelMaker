package tm.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import tm.mypage.dto.LikeSCDTO;
import tm.mypage.dto.LikeSpotDTO;
import tm.mypage.dto.QnaDTO;
import tm.mypage.dto.StempDTO;
import tm.totalre.dto.TotalreDTO;

@Service
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mypage";
		
	
	/**
	listSpot
	HashMap map에 userId를 넣어 db에서 userId와 일치하는 관심지역 list를 불러오고
	list를 리턴
	*/
	@Override
	public List<LikeSpotDTO> listSpot(String userId) {
		//HashMap map생성
		HashMap map = new HashMap();
		//map에 userId담기
		map.put("userId",userId);
		//db에서 userId와 일치하는 컬럼들을 List에 담음 
		List<LikeSpotDTO> list = ss.selectList(namespace+".listspot",map);
		//db에서 받은list를 리턴시킴
		return list;
	}
	/**
	 *deleteSpot
	 *HashMap map에 likespotNum을 넣어 db에서 일치하는 내용 삭제 한후
	 *결과값을 리턴
	 */
	@Override
	public Integer deleteSpot(String likespotNum) {
		//HashMap map생성
		HashMap map = new HashMap();
		//map에 likespotNum담기
		map.put("likespotNum",likespotNum);
		//db에서 likespotNum와 일치하는 컬럼들을 지우고 결과값을 받음 
		int result = ss.delete(namespace+".deletespot",map);
		//결과값을 리턴시킴
		return result;
	}
	
	/**
	 * deleteSchedule
	 * likescNum을 받아와 db에서 해당likescNum에 해당하는 컬럼을 삭제
	 * 결과값을 리턴
	 */
	@Override
	public int deleteSchedule(String likescNum) {
		//HashMap map를 생성
		HashMap map = new HashMap();
		//map에 likescNum를 담음
		map.put("likescNum",likescNum);
		//db에서 likescNum과 일치하는 컬럼을 삭제후 결과값을 리턴받음
		int result = ss.delete(namespace+".deleteschedule",map);
		//결과값을 리턴
		return result;
	}
	/**
	 * findPage
	 * qna list중에서 끝번호를 받아옴
	 * QnaDTO dto를 리턴
	 */
	@Override
	public int findPage(String userId) {
		//HashMap map를 생성
		HashMap map = new HashMap();
		//map에 userId를 담음
		map.put("userId", userId);
		//db에서 userId와 일치하는 컬럼들을 QnaDTO dto에 담음
		List<QnaDTO> list = ss.selectList(namespace + ".textQna",map);
		//db에서 list값이 null이면 0을 리턴시킴
		if(list == null){
			return 0;
		}
		//list값이 있으면 db에서 해당되는 컬럼중 제일 마지막 컬럼의 번호를 가지고 온다.
		else {
			int qnaedNum = ss.selectOne(namespace + ".findqnanum",map);
			//마지막 컬럼 번호 리턴
			return qnaedNum;			
		}
	}	
	/**
	 * listQnA
	 * userId를 받아와  db에서 userId와 일치하는 컬럼들을 
	 * List에 담아 리턴 
	 */
	@Override
	public List<QnaDTO> listQnA(String userId, int pageNum) {
		//HashMap map를 생성
		HashMap map = new HashMap();
		//map에 userId를 담음
		map.put("userId", userId);
		//map에 pageNum를 담음
		map.put("pageNum", pageNum);
		//db에서 userId와 일치하는 컬럼들을 List에 담음
		List<QnaDTO> list = ss.selectList(namespace+".listqna",map);
		//list를 리턴
		return	list;
	}
	/**
	 * inputQna
	 * userId,qnaType,qnaContent을 받아서
	 * db에서 시퀀스번호를 받아와 생성시킨 qna번호와 함깨 
	 * db에 입력시킨후 결과값을 리턴 
	 */
	@Override
	public int inputQna(String userId,String qnaType,String qnaContent) {
	//글번호 작성 부분
		//db에서 시퀀스 값을 가져옴
		String num = ss.selectOne(namespace + ".qnumber");
	// 글번호 생성 부분
		//글번호 앞에 붙일 이름을 설정 후
		String str = "qna";
		//번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
			str += "0";
		}
		//생성된 번호를 뒤에 붙임
		str += num;		
		//HashMap map를 생성 
		HashMap map = new HashMap();
		//map에 str,userId,qnaType,qnaContent 를 담음
		map.put("qnaNum", str);
		map.put("userId", userId);
		map.put("qnaType", qnaType);
		map.put("qnaContent", qnaContent);
		//db에 입력시킨후 결과값을 받음
		int result = ss.insert(namespace+".inputqna",map);
		//결과값을 리턴
		return result;
	}
	/**
	 * ListStemp(완성한 스템프 받아오기)
	 * userId를 받아 db에서 userId와 일치하는 컬럼 List를
	 * 리턴시킴
	 */
	@Override
	public List<StempDTO> ListStemp(String userId) {
		//HashMap map를 생성
		HashMap map = new HashMap();
		//map에 userId를 담음
		map.put("userId", userId);
		//db에서 userId와 일치하는 컬럼들을 List에 담음
		List<StempDTO> list = ss.selectList(namespace+".liststemp",map);
		//list를 리턴
		return list;
	}
	/**
	 * listNotStemp(미완성한 스템프 받아오기)
	 * userId를 받아 db에서 userId와 일치하는 컬럼 List를
	 * 리턴시킴
	 */
	@Override
	public List<StempDTO> listNotStemp(String userId) {
		//HashMap map를 생성
		HashMap map = new HashMap();
		//map에 userId를 담음
		map.put("userId", userId);
		//db에서 userId와 일치하는 컬럼들을 List에 담음
		List<StempDTO> list = ss.selectList(namespace+".tempstemp",map);
		//list를 리턴
		return list;
	}
	@Override
	public ArrayList selectLikeReview(String userId) {
		
		HashMap map = new HashMap();
		map.put("userId", userId);
		
		ArrayList like = (ArrayList)ss.selectList(namespace + ".selectLike",map);
				
		return like;
	}
	@Override
	public TotalreDTO selectReview(String scNum) {
		
		HashMap map = new HashMap();
		map.put("scNum", scNum);
		
		TotalreDTO result = ss.selectOne(namespace + ".selectReview",map);
		return result;
	}


}

