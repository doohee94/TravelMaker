package tm.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TourController
 * 여행화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmtour")
public class TourController {

	private String dir = "tour/";
	/**
	 * main 
	 * 컴맨드 요청이 없는 일반 호출 
	 */	
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
		System.out.println("여행컨트롤러");
			return dir+url;
	}
	
}
