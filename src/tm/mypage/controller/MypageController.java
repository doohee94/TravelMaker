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
import tm.mypage.dto.LikeSCDTO;
import tm.mypage.dto.LikeSpotDTO;

/*
 MypageController
 마이페이지화면 매핑 처리
 dir : 폴더 경로
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
	/*
	 spotListShow
	 마이페이지 관심지역을 누르면 들어오는 함수
	 session의 userId를 받아
	 db의 해당 userId와 일치하는 관심일정 내용들을 받아온다
	 이미지 주소는 관심지역 이름으로 getImgPath를 통해 받아온다.
	 */
	@RequestMapping("/likespot.tm")
	public ModelAndView spotListShow(String userId, HttpSession session){
		userId = (String)session.getAttribute("userId");
		List<LikeSpotDTO>list = dao.listSpot(userId);
		for (int i = 0 ; i < list.size() ; i++){
			//지역을 통한 api에서 이미지 받아오기
			String path = getImgPath(list.get(i).getLikespotName());
			//받아온 이미지 주소를 list에 넣기
			list.get(i).setImagePath(path);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/likespot");
		mv.addObject("likelist",list);
		//세션을 유지시기키위해...?
		session.setAttribute("userId", userId);
		return mv;
	}
	/*
	 * deleteSpot
	 * likespotNum를 받아와서
	 * db에 해당 받아온 likespotNum와 일치하는 내용 삭제 
	 */
	@RequestMapping("/deletespot.tm")
	public ModelAndView deleteSpot(String likespotNum){
		System.out.println(likespotNum);
		int result = dao.deleteSpot(likespotNum);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/likespot");
		mv.addObject("result",result);
		return mv;
	}
	/*
	 schedulelistShow
	 마이페이지 관심여행지를 누르면 들어오는 함수
	 session의 userId를 받아
	 db의 해당 userId와 일치하는 관심여행지 내용들을 받아온다
	 */
	@RequestMapping("/schedule.tm")
	public ModelAndView scheduleListShow(String userId, HttpSession session){
		userId = (String)session.getAttribute("userId");
		System.out.println("이걸 타야된다고!");
		List<LikeSCDTO> list = dao.listSchedule(userId);
		System.out.println("나오긴 했네?");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/schedule");
		mv.addObject("sclist",list);
		//세션을 유지시기키위해...?
		session.setAttribute("userId", userId);
		return mv;
	}
	
	/*
	getImgPath
	db에서 keyword값을 가져와서 api에서 파싱을 통해 받은 이미지 주소값을 리턴시김
	return값 이미지주소값 
	 */
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
