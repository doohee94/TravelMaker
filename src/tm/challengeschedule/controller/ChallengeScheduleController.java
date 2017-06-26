package tm.challengeschedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/challengeschedule")
public class ChallengeScheduleController {

/**
* index에서 challengeSchedule 폴더 안써도 가지게
*/
	private String dir = "challengeschedule/";
	
/**
* 인자값 전달이 필요없는 부분 담당
*/
	@RequestMapping("/{url}.tm")
	public String challengeSchedule(@PathVariable String url){
		System.out.println("challengeSchedule컨트롤탔음");
		System.out.println(dir + url);
		return dir + url;
	}
	
}
