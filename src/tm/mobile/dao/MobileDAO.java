package tm.mobile.dao;

import tm.mobile.dto.MobileDTO;

public interface MobileDAO {
	public int inputPlace(String userId, String parstempNum );

	public MobileDTO login(String userId, String userPw);

}
