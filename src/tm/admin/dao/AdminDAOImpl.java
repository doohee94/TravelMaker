package tm.admin.dao;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;
import tm.admin.dto.AdminadDTO;
import tm.alliance.dto.AllianceDTO;

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

	@Override
	public int qnareply(AdminQnaDTO adminQnaDTO) {
		int res = ss.update(namespace+".reply", adminQnaDTO);
		return res;
	}

	@Override
	public List<AdminadDTO> adlist() {
		List<AdminadDTO> list = ss.selectList(namespace + ".adlist");
		return list;
	}

	@Override
	public List<AllianceDTO> alsearch(String partnercomname) {
		HashMap map = new HashMap();
		map.put("partnerComname", partnercomname);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist", map);
		return list;
	}

	@Override
	public int adadinsert(AdminadDTO adminadDTO) {
		//글번호 작성 부분

		// 시퀀스 값을 가져옴
		String num = ss.selectOne(namespace + ".adnumber");

		// 글번호 생성 부분
		// 글번호 앞에 붙일 이름을 설정 후
		String str = "ad";

		// 번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
			str += "0";
		}

		// 생성된 번호를 뒤에 붙임
		str += num;

		// 그리고 글번호 부분에 값을 넣어줌
		adminadDTO.setAdNum(str);
		
		int res = ss.insert(namespace + ".adinsert", adminadDTO);
		return res;
	}

	@Override
	public int addelete(String adnum) {
		HashMap map = new HashMap();
		map.put("adnum",adnum);
		
		int res = ss.delete(namespace + ".addelete", map);
		return res;
	}

	@Override
	public List<AllianceDTO> adallist() {
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist");
		
		return list;
	}

	@Override
	public int allianceDel(String partnernum) {
		
		HashMap map = new HashMap();
		map.put("partnernum", partnernum);
		
		int resad = ss.delete(namespace + ".addelete", map);
		
		int resal = ss.delete(namespace + ".alliancedel", map);
		
		return resal;
	}

	@Override
	public int adminalup(String num) {
		
		HashMap map = new HashMap();
		map.put("partnernum", num);
		
		int res = ss.update(namespace + ".allianceapproval", map);
		
		return res;
	}

	@Override
	public int typeupdate(AllianceDTO allianceDTO) {
		
		int res = ss.update(namespace + ".typeupdate", allianceDTO);
		
		return res;
	}

}
