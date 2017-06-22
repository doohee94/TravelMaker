package tm.alliance.dao;

import tm.alliance.dto.AllianceDTO;

public interface AllianceDAO {
	
	/**
	 * insertAlliance
	 * 제휴 문의 DB입력
	 */
	public int insertAlliance(AllianceDTO allianceDTO);
}	
