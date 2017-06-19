package tm.step2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * AdminController
 * 관리자 관련 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/step2")
public class Step2Controller {
	
	private String dir = "step2/";
	
	/**
	 * admin
	 * 인자값 전달이 필요없는 부분 담당
	 */
	@RequestMapping("/{url}.tm")
	public String admin(@PathVariable String url) {
		return dir + url;
	}
	
}