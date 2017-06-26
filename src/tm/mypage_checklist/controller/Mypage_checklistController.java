package tm.mypage_checklist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Mypage_checklistController
 * 완성된 일정 체크리스트
 * dir : 폴더경로 
 * */

@Controller
@RequestMapping("/mypage_checklist")
public class Mypage_checklistController {

	private String dir = "checklist/";
	
	@RequestMapping("/{url}.tm")
	   public String checklist(@PathVariable String url){
	      return dir + url;
	      
	   }
}
