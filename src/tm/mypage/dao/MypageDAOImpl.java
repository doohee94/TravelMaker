package tm.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.mypage.dto.LikeSCDTO;
import tm.mypage.dto.LikeSpotDTO;

@Service
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "mypage";
		
	
	/*
	listSpot
	HashMap map에 userId를 넣어 db에서 userId와 일치하는 관심지역 list를 불러오고
	list를 리턴
	*/
	@Override
	public List<LikeSpotDTO> listSpot(String userId) {
		HashMap map = new HashMap();
		map.put("userId",userId);
		System.out.println("유저아이디"+userId);
		List<LikeSpotDTO> list = ss.selectList(namespace+".listspot",map);
		return list;
	}
	/*
	deleteSpot
	HashMap map에 likespotNum을 넣어 db에서 일치하는 내용 삭제 한후
	결과값을 리턴
	*/
	@Override
	public Integer deleteSpot(String likespotNum) {
		HashMap map = new HashMap();
		map.put("likespotNum",likespotNum);
		System.out.println("번호"+likespotNum);
		int result = ss.delete(namespace+".deletespot",map);
		return result;
	}
	/*
	 listSchedule
	 HashMap map에 userId를 넣어 db에서	sclist를 받아와서 넣기
	 sclist의 scNum을 가져와 db에서 imagePath값을 얻어와서 sclist에 값을 넣기
	 다 넣은 sclist를 리턴
	 */
	@Override
	public List listSchedule(String userId) {
		HashMap map = new HashMap();
		map.put("userId", userId);
		String scNum;
		List<LikeSCDTO> temp;
		String tempimg, temptitle, templike;
		List<LikeSCDTO> sclist = ss.selectList(namespace+".listsc",map);
		for(int i = 0 ; i < sclist.size() ; i++){
			scNum = sclist.get(i).getScNum();
			HashMap scMap = new HashMap();
			scMap.put("scNum", scNum);
			//임시 list에 scnum을 통한 좋아요수, 제목, 이미지주소 받아오기
			temp = ss.selectList(namespace+".findimg",scMap);
			
			for(int j = 0 ; j < temp.size(); j++){
			//임시 로 담을 이미지주소, 제목, 좋아요수

			
				tempimg = temp.get(j).getTotalrePhoto1fake();
				templike = temp.get(j).getTotalreLikecount();
				temptitle = temp.get(j).getTotalreTitle();	
//			//cslist에 담기
				sclist.get(i).setTotalrePhoto1fake(tempimg);
				sclist.get(i).setTotalreLikecount(templike);
				sclist.get(i).setTotalreTitle(temptitle);
			}//end of for (temp)
		}//end of for(scNum)
		return sclist;
	}

}

