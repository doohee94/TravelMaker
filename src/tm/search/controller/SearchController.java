package tm.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * SearchController
 * 검색 상세페이지 
 * dir : 폴더경로
 * */

@Controller
@RequestMapping("/searchpage")
public class SearchController {
	
	private String dir = "searchpage";
	
	@RequestMapping("/{url}.tm")
	public ModelAndView search(String cityName){
		ModelAndView mv = new ModelAndView();
		System.out.println(cityName);
		mv.addObject("cityName",cityName);
		return mv;
	}
	
}
