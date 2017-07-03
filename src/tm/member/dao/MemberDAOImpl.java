package tm.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	/*회원정보보기*/
	@Override
	public MemberDTO update(MemberDTO memberdto){
		System.out.println("회원정보보기");
		return ss.selectOne("member.update", memberdto);
	}
	
	/*회원수정*/
	@Override
	public int modify(String userId){
		System.out.println("회원수정");
		return ss.update("member.modify", userId);
	}
	
	/*회원탈퇴*/
	@Override
	public int delete(MemberDTO memberdto){
		System.out.println("회원탈퇴");
		return ss.update("member.delete", memberdto);
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
}
