package tm.mobile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.mobile.dao.MobileDAO;
import tm.mobile.dto.MobileDTO;
import tm.mobile.dto.MoblieStemoDTO;
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
	 * parstempNum값을 받아서 
	 * MobileDAO에게 값을 넘김
	 * @param parstempNum 지점번호값
	 * @return mstemp페이지
	 */
	@RequestMapping("/insert.tm")
	public String insert(String parstempNum, HttpSession session){
		String id = (String) session.getAttribute("userId");
		MoblieStemoDTO dto = dao.check(id, parstempNum);
		int res = 0;
		String result = "";
		if(dto == null){
			res = dao.inputPlace(id, parstempNum);
		}else{
			result = "redirect:/tmmobile/mstemp.tm?parstempNum="+parstempNum;
		}
		if(res > 0){
			result = "redirect:/tmmobile/mstemp.tm?parstempNum="+parstempNum;
		}
		return result;
	}
	
	@RequestMapping("/mstemp.tm")
	public ModelAndView mainmo(String parstempNum, HttpSession session){
		String id = (String) session.getAttribute("userId");
		ModelAndView mv = new ModelAndView();
		
		if(id == null || id.equals("")){
			mv.setViewName("redirect:/tmmobile/mlogin.tm?parstempNum="+parstempNum+"&state=10");
			return mv;
		}
		
		MoblieStemoDTO dto = dao.check(id, parstempNum);
		if(dto != null){
			mv.addObject("result", "result");
			mv.addObject("checkdate", dto.getStempDate());
		}
		
		mv.setViewName(dir+"mstemp");
		mv.addObject("parstempNum", parstempNum);
		
		return mv;
	}
	
	
	/**
	 * mobileMain
	 */
	@RequestMapping("/mlogin.tm")
	public ModelAndView mobileMain(String parstempNum,String state, HttpSession session ){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"mlogin");
		mv.addObject("parstempNum", parstempNum);
		mv.addObject("state", state);
		return mv;
	}
	/**
	 * login
	 */
	@RequestMapping("/login.tm")
	public String login(String userId, String userPw, String parstempNum, HttpSession session){
		//db에서 userId,userPw와 일치하는 컬럼을 검색
		MobileDTO dto = dao.login(userId,userPw);	
		//리턴시킬 결과값
		String result = "";
		if(dto!=null){
			System.out.println(userId + " : 로그인성공");
			session.setAttribute("userId", userId);
			result= "redirect:/tmmobile/mstemp.tm?parstempNum="+parstempNum;
		}else{
			System.out.println("로그인 실패");
			result = "redirect:/tmmobile/mlogin.tm?parstempNum="+parstempNum+"&state=20";
		}
		return result;
	}
}
