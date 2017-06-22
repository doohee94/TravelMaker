package tm.alliance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.alliance.dto.AllianceDTO;

@Service
public class AllianceDAOImpl implements AllianceDAO {

	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "alliance";
	
	@Override
	public int insertAlliance(AllianceDTO allianceDTO) {
		
		String num = ss.selectOne(namespace+".alnumber");
		
		
		String str = "par";
		for (int i = 0; i < 8-num.length(); i++) {
			str += "0";
		}
		str += num;
		allianceDTO.setPartnerNum(str);
		
		int res = ss.insert(namespace+".insert",allianceDTO);
		
		return res;
	}

}
