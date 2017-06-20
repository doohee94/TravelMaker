package tm.step3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Step3Controller
 * 여행 일정짜기 스텝3. 전체 저장 및 몽고디비 사용
 * dir : 폴더경로 
 * */
@Controller
@RequestMapping("/step")
public class Step3Controller {
	
	private String dir = "step3/";
	
	@RequestMapping("/{url}.tm")
	public String step3(@PathVariable String url){
	
		return dir + url;
		
	}
}
