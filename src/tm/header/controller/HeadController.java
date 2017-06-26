package tm.header.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * HeaderController
 * 로그인화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmheader")
public class HeadController {
	
	private String dir = "main/header/";

	@RequestMapping("/{url}.tm")
	public String login(@PathVariable String url){
		return dir+url;
	}
}
