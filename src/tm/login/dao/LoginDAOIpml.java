package tm.login.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.login.dto.LoginDTO;

@Service
public class LoginDAOIpml implements LoginDAO{
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "login";

	@Override
	public LoginDTO loginUser(String userId, String userPw) {
		HashMap map = new HashMap();
		map.put("userId",userId);
		map.put("userPw",userPw);
		LoginDTO dto = ss.selectOne(namespace+".loginUser",map);
		return dto;
	}

}
