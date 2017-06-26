package tm.travelReview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TravelReviewController
 * 여행리뷰리스트, 상세페이지
 * dir : 폴더경로 
 * */

@Controller
@RequestMapping("/travelReview")
public class TravelReviewController {

	private String dir = "travelReview/";
	
	@RequestMapping("/{url}.tm")
	   public String checklist(@PathVariable String url){
	      return dir + url;
	      
	}
}
