package tm.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * SearchController
 * 헤더 검색창에서 지역검색을 하면 들어오는 페이지
 * dir : 폴더경로
 * */

@Controller
@RequestMapping("/searchpage")
public class SearchController {
	
	private String dir = "searchpage/";
	
	@RequestMapping("/{url}.tm")
	public ModelAndView search(String cityName){
		ModelAndView mv = new ModelAndView();
		System.out.println(cityName+"여기탐탐");
		
		mv.addObject("cityName",cityName);
		mv.setViewName(dir+"search");
		return mv;
	}

}
