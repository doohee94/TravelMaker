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
		
		//글번호 작성 부분
		
		//시퀀스 값을 가져옴
		String num = ss.selectOne(namespace+".alnumber");
		
		//글번호 생성 부분
		//글번호 앞에 붙일 이름을 설정 후
		String str = "par";
		
		//번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8-num.length(); i++) {
			str += "0";
		}
		
		//생성된 번호를 뒤에 붙임
		str += num;
		
		//그리고 글번호 부분에 값을 넣어줌
		allianceDTO.setPartnerNum(str);
		
		int res = ss.insert(namespace+".insert",allianceDTO);
		
		return res;
	}

}
