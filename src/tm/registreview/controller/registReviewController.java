package tm.registreview.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registReview")
public class registReviewController {

	private String dir = "registReview/";

	@RequestMapping("/{url}.tm")
	public String step3(@PathVariable String url){
		return dir + url;

	}
}
