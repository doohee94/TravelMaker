package tm.mobile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/*
 * MobileController
 * 모바일화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmoblie")
public class MobileController {

	private String dir = "mobile/";
			
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
		System.out.println("모바일컨트롤러");
			return dir+url;
	}
	
}
