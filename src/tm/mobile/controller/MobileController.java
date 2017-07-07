package tm.mobile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.mobile.dao.MobileDAO;
import tm.mobile.dto.MobileDTO;
/*
 * MobileController
 * 모바일화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmobile")
public class MobileController {

	private String dir = "mobile/";

	@Autowired
	MobileDAO dao;
	/**
	 * main
	 * 모바일 페이지로 연결해주는 컨트롤러
	 * return 페이지값
	 */
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
			return dir+url;
	}
	/**
	 * insert
	 * userId, parstempNum값을 받아서 
	 * MobileDAO에게 값을 넘김
	 * @param userId 사용자 아이디값
	 * @param parstempNum 지점번호값
	 * @return mstemp페이지
	 */
	@RequestMapping("insert.tm")
	public String insert(String userId, String parstempNum){
		System.out.println("왔니??");
		//db에 userId와 parstempNum를 입력시킴
		dao.inputPlace(userId, parstempNum);
		System.out.println("입력성공!");
		//mstemp페이지를 리턴
		return dir+"mstemp";
	}
	/**
	 * mobileMain
	 * qr코드에서 파라미터 값을 얻어와  세션에 저장한후
	 * 로그인폼으로 연결해줌
	 * @param parstempNum
	 * @return 로그인 폼 페이지
	 */
	@RequestMapping("mlogin.tm")
	public String mobileMain(String parstempNum, HttpSession session ){
		//장소페이지를 받아와 저장
		session.setAttribute("parstempNum", parstempNum);
		//mlogin페이지 리턴
		return dir+"mlogin";
	}
	/**
	 * login
	 * db에서 userId,userPass를 비교후 일치하는 컬럼을  MobileDTO dto에 담아
	 * 값이 있으면 세션에 userId와  parstempNum를 저장후 mstemp페이지 리턴
	 * 없으면 다시 로그인 폼으로 이동
	 * @return 결과값
	 */
	@RequestMapping("login.tm")
	public String login(String userId, String userPw,String parstempNum, HttpSession session){
		//db에서 userId,userPw와 일치하는 컬럼을 검색
		MobileDTO dto = dao.login(userId,userPw);		
		//리턴시킬 결과값
		String result = "";
		if(dto!=null){
			System.out.println("로그인성공");
			session.setAttribute("userId", userId);
			session.setAttribute("parstempNum", parstempNum);
			result= dir+"mstemp";
		}else{
			System.out.println("로그인 실패");
			result = "redirect:/tmmobile/mlogin.tm?parstempNum="+parstempNum;
		}
		return result;
	}
}
