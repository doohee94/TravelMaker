package tm.mypage.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.text.Document;
import javax.swing.text.html.parser.Element;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.el.parser.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.NodeList;

import tm.mypage.dao.MypageDAO;
import tm.mypage.dto.LikeSpotDTO;

/**
 * MypageController
 * 마이페이지화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmypage")
public class MypageController {
	
	private String dir = "mypage/";
	
	@Autowired 
	MypageDAO dao;
	
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
		System.out.println("마이페이지컨트롤러");
			return dir+url;
	}
	@RequestMapping("/likespot.tm")
	public ModelAndView listShow(String userId, HttpSession session){
		userId = (String)session.getAttribute("userId");
		List<LikeSpotDTO>list = dao.listSpot(userId);
		for (int i = 0 ; i < list.size() ; i++){
			System.out.println("아이디 : "+list.get(i).getUserId());
			System.out.println("키워드 : "+list.get(i).getLikespotName());
			//지역을 통한 api에서 이미지 받아오기
			String path = getImgPath(list.get(i).getLikespotName());
			System.out.println("가져온 이미지 주소 : "+path );
			//받아온 이미지 주소를 list에 넣기
			list.get(i).setImagePath(path);
			System.out.println("잘들어갔나 확인 해보자~ "+i+" 번째 이미지주소 : " +list.get(i).getImagePath());
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/likespot");
		mv.addObject("likelist",list);
		return mv;
	}
	public String getImgPath(String spotName) {
		
		
		String key ="GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D";
		String path ="";
		try{
		String keyword = URLEncoder.encode(spotName, "UTF-8");
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = dbf.newDocumentBuilder();
		
		org.w3c.dom.Document xmldoc = null;
		String parseurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="+key+"&keyword="+keyword+"&MobileOS=ETC&MobileApp=AppTesting";
		xmldoc = parser.parse(parseurl);
		
		org.w3c.dom.Element root = xmldoc.getDocumentElement();
		path = root.getElementsByTagName("firstimage").item(0).getTextContent();
		if (path.equals("")){ path = null;}
		}catch (Exception ex){
			System.out.println("에러 발생 : " +ex.getMessage());
		}
		return path;
	}
}
