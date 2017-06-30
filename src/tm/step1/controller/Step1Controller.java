package tm.step1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tm.step1.dao.Step1DAO;
import tm.step1.dto.Step1DTO;

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
//	
	@RequestMapping("/setp1searchfellow.tm")
	public @ResponseBody List<Step1DTO> searchfellow(@RequestParam String con){
		
		List<Step1DTO> list = dao.fellowsearch(con);
				
		return list;
	}
}
