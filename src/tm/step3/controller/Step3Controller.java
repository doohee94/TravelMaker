package tm.step3.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("여깅가"+url);
		return dir + url;
		
	}
	
	
	@RequestMapping("/distanceCal.tm")
	@ResponseBody
	public HashMap<String,Object> distanceCal(@RequestParam HashMap<String,Object> test){
		System.out.println("스프링@@@@"+test);
		System.out.println("@@ 값"+test.get("a"));
		
		
	
		return test;
	}
	
}
