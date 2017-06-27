package tm.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tm.login.dao.LoginDAO;
import tm.login.dto.LoginDTO;

/**
 * LoginController
 * 로그인화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmlogin")
public class LoginController {
	
	private String dir = "login/";
	
	@Autowired
	LoginDAO dao;
	
	/**
	 * login
	 * 인자값 전달이 필요없는 부분 담당
	 */	
	
	@RequestMapping("/{url}.tm")
	public String login(@PathVariable String url){
		return dir+url;
	}
	/*
	 * Login시 DB에서 id와 pw값으로 비교후
	 * 리턴 받은 id와 nick를
	 * session에 userId와 userNick를 저장하고 메인페이지로 이동 
	*/
	@RequestMapping("/loginUser.tm")
	@ResponseBody
	public String loginUser(String user_id, String user_pw, HttpSession session){
		LoginDTO dto = dao.loginUser(user_id, user_pw);
		String reid = dto.getUserId();
		int state = dto.getUserType();
		String result = "";
		if(reid !=null){
			String nick = dto.getUserNick();
			session.setAttribute("userId", reid);
			session.setAttribute("userNick", nick);
			System.out.println("로그인 성공");
			if(state == 10){
			result = dir+"/login.tm";
			}else if(state == 30){
			result = "redirect:/tmadmin/adminMember.tm";
			}
		}else{
			System.out.println("로그인 실패");
			result= dir+"/login.tm";
		}
		return result;
	}

}
