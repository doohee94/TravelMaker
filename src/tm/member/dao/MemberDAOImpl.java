package tm.member.dao;

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
		return ss.insert("member.insert", memberdto);
	}
}
