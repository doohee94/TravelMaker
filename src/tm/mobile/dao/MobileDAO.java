package tm.mobile.dao;

import java.util.List;

import tm.mobile.dto.MobileDTO;
import tm.mobile.dto.MoblieStemoDTO;

public interface MobileDAO {
	public int inputPlace(String userId, String parstempNum );

	public MobileDTO login(String userId, String userPw);
	
	public MoblieStemoDTO check(String userId, String parstempNum);

}
