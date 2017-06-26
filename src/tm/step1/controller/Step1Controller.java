package tm.step1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/step1")
public class Step1Controller {

/**
* index에서 step1 폴더 안써도 가지게
*/
	private String dir = "step1/";
	
/**
* 인자값 전달이 필요없는 부분 담당
*/
	@RequestMapping("/{url}.tm")
	public String step1(@PathVariable String url){
		System.out.println("컨트롤탔음");
		System.out.println(dir + url);
		return dir + url;
	}
}
