package tm.alliance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tm.alliance.dao.AllianceDAO;
import tm.alliance.dto.AllianceDTO;

@Controller
public class AllianceController {
	
	@Autowired
	AllianceDAO dao;
	
	private String dir = "alliance/";
	
	@RequestMapping("/{url}.tm")
	public String alliance(@PathVariable String url) {
		return dir + url;
	}
	
	/**
	 * insertAlliance
	 * 제의 문의 DB에 저장
	 * @param allianceDTO
	 * @return dir+"allianceOk"
	 */
	@RequestMapping(value="/allianceOk.tm")
	public String insertAlliance(AllianceDTO allianceDTO) {
		
		int res = dao.insertAlliance(allianceDTO);
		
		return dir+"allianceOk";
	}

}
