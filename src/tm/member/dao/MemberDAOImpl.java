package tm.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.member.dto.MemberDTO;

@Service
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSessionTemplate ss;
	
	/*회원가입*/
	@Override
	public int insert(MemberDTO memberdto){
		System.out.println("회원가입");
		return ss.insert("member.insert", memberdto);
	}
	/*회원정보보기*/
	@Override
	public List<MemberDTO> list(){
		return ss.selectList("member.list");
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
}
