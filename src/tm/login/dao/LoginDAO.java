package tm.login.dao;


import tm.login.dto.LoginDTO;

public interface LoginDAO {
	/*
	userId, userPw으로 로그인시 
	DB에서  userId, userPw 검색후 
	userId, userNick비교가지고옴
	@param	userId, userPw
	@return userId, userNick
	 */
	public LoginDTO loginUser(String userId, String userPw); 
}
