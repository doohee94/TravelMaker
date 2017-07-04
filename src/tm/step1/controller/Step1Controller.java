package tm.step1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.step1.dao.Step1DAO;
import tm.step1.dto.Step1DTO;

/**
 * Step1Controller
 * 스탭1 여행일정 만들기 관련 매핑 처리
 * dir : 폴더 경로 
 */
@Controller
@RequestMapping("/step1")
public class Step1Controller {

/**
* index에서 step1 폴더 안써도 가지게
*/
	private String dir = "step1/";
	
	@Autowired
	Step1DAO dao;
/**
* 인자값 전달이 필요없는 부분 담당
*/
	@RequestMapping("/{url}.tm")
	public String step1(@PathVariable String url){
		System.out.println("컨트롤탔음");
		System.out.println(dir + url);
		return dir + url;
	}

	
//	@RequestMapping("/.tm")
//	public String nextBtn(String A, String B, String C, String D, String E, String F, String G, HttpSession session ){
//		session.setAttribute("", A);
//		session.setAttribute("", B);
//		session.setAttribute("", C);
//		session.setAttribute("", D);
//		session.setAttribute("", E);
//		session.setAttribute("", F);
//		session.setAttribute("", G);
//	return "redirect:/step2/step2.tm";
//	}
	
	//step1 동행자 팝업 검색 목록 ( 아이디 와 닉네임 출력 ) 
	@RequestMapping("step1fellow.tm")
	public ModelAndView step1fellow(String modalsearchplace){
		
		List<Step1DTO> list = dao.fellowsearch(modalsearchplace);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/step1");
		mv.addObject("modalsearchplace", modalsearchplace);
		
		return mv;
	}
	
	
}
