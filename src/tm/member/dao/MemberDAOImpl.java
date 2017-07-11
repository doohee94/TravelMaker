package tm.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tm.likeloc.dto.LikelocDTO;
import tm.member.dto.MemberDTO;

@Service
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSessionTemplate ss;
	
	/*회원가입*/
	@Override
	public int insert(MemberDTO memberdto){
		return ss.insert("member.insert", memberdto);
	}
	
	/*ID 중복체크*/
	@Override
	public int idcheck(String userid){
		HashMap map = new HashMap<>();
		map.put("userid", userid);
		return ss.selectOne("member.check",map);
	}
	
	/*email체크*/
	@Override
	public int emailcheck(String userEmail){
		HashMap map = new HashMap<>();
		map.put("userEmail", userEmail);
		return ss.selectOne("member.check",map);
	}
	
	/*회원정보보기*/
	@Override
	public MemberDTO update(MemberDTO memberdto){
		return ss.selectOne("member.update", memberdto);
	}
	
	/*회원수정*/
	@Override
	public int modify(MemberDTO memberdto){
		return ss.update("member.modify", memberdto);
	}
	
	/*회원탈퇴*/
	@Override
	public int delete(MemberDTO memberdto){
		return ss.delete("member.delete", memberdto);
	}
	
	/*ID 찾기*/
	@Override
	public MemberDTO searchId(String userName, String userEmail) {
		HashMap map = new HashMap<>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		return ss.selectOne("member.list",map);
	}
	
	/*PW 찾기*/
	@Override
	public MemberDTO searchPw(String userId, String userEmail) {
		HashMap map = new HashMap<>();
		map.put("userId", userId);
		map.put("userEmail", userEmail);
		return ss.selectOne("member.searchpw",map);
	}
	
	/*관심지역 추가*/
	public int insertLoc(LikelocDTO likelocdto){
		//글번호 작성 부분

		// 시퀀스 값을 가져옴
		String num = ss.selectOne("member.seqnum");

		// 글번호 생성 부분
		// 글번호 앞에 붙일 이름을 설정 후
		String str = "loc";

		// 번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
			str += "0";
		}

		// 생성된 번호를 뒤에 붙임
		str += num;
		likelocdto.setLikelocNum(str);
		
		return ss.insert("member.insertlikeloc",likelocdto);
	}
}
