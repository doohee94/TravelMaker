package tm.recommandtravelregion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recommandtravelregion")
public class RecommandTravelRegionController {

/**
* index에서 recommandtravelregion 폴더 안써도 가지게
*/
	private String dir = "recommandtravelregion/";

	/**
	* 인자값 전달이 필요없는 부분 담당
	*/
	
	@RequestMapping("/{url}.tm")
	public String recommandTravelRegion(@PathVariable String url){
		System.out.println("recommandtravelregion컨트롤탔음");
		System.out.println(dir + url);
		return dir + url;
	}
}
