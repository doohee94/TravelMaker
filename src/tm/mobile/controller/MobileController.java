package tm.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tm.mobile.dao.MobileDAO;
/*
 * MobileController
 * 모바일화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmoblie")
public class MobileController {

	private String dir = "mobile/";

	@Autowired
	MobileDAO dao;
	/**
	 * main
	 * 모바일 페이지로 연결해주는 컨트롤러
	 * return 페이지값
	 */
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
			return dir+url;
	}
	/**
	 * insert
	 * userId, parstempNum값을 받아서 
	 * MobileDAO에게 값을 넘김
	 * @param userId 사용자 아이디값
	 * @param parstempNum 지점번호값
	 * @return mstemp페이지
	 */
	@RequestMapping("insert.tm")
	public String insert(String userId, String parstempNum){
		//db에 userId와 parstempNum를 입력시킴
		dao.inputPlace(userId, parstempNum);
		//mstemp페이지를 리턴
		return dir+"mstemp";
	}
}
