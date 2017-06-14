package tm.alliance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AllianceController {
	
	private String dir = "alliance/";
	
	@RequestMapping("/{url}.tm")
	public String alliance(@PathVariable String url) {
		return dir + url;
	}

}
