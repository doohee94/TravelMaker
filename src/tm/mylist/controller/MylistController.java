package tm.mylist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mylist/")
public class MylistController {

/**
* index에서 member 폴더 안써도 가지게
*/
	private String dir = "mylist/";
	
/**
* 인자값 전달을 할수있게
*/
	@RequestMapping("/{url}.tm")
	public String list(@PathVariable String url){
		return dir + url;
	}
}
