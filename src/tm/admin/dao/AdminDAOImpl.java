package tm.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;

@Service
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "admin";
	
	@Override
	public List<AdminMemberDTO> MemberList() {
		
		List<AdminMemberDTO> list = ss.selectList(namespace+".memberlist");
		
		return list;
	}

	@Override
	public AdminMemberDTO Membershow(String id) {
		HashMap map = new HashMap();
		map.put("id", id);
		
		AdminMemberDTO dto = ss.selectOne(namespace+".memberlist",map);
		return dto;
	}

	@Override
	public List<AdminMemberDTO> Membersearch(String sel, String con) {
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("con", con);
		
		List<AdminMemberDTO> list = ss.selectList(namespace+".memberlist",map);
		
		return list;
	}

	@Override
	public List<AdminQnaDTO> qnalist() {
		List<AdminQnaDTO> list = ss.selectList(namespace+".qnalist");
		return list;
	}

}
