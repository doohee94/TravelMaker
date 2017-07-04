package tm.registreview.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.registreview.dao.registReviewDAO;
import tm.totalre.dao.TotalreDAO;
import tm.totalre.dto.TotalreDTO;

@Controller
@RequestMapping("/registReview")
public class registReviewController {

	private String dir = "registReview/";

	@RequestMapping("/{url}.tm")
	public String step3(@PathVariable String url){
		return dir + url;

	}
	
	
	@Autowired
	registReviewDAO dao;

	
	@RequestMapping("/insertReview.tm")
	public ModelAndView insertReview(TotalreDTO totalreDTO){
		
		System.out.println(totalreDTO.getTotalrePhoto4fake());
		
		
		int result = dao.insertReview(totalreDTO);
		System.out.println(result);
		
		return null;
	}
}
