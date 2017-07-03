package tm.mypage.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import tm.mypage.dto.QnaDTO;
import tm.mypage.dto.StempDTO;

/**
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

	/**
	 * spotListShow
	 * 마이페이지 관심지역을 누르면 들어오는 함수
	 * @param userId 세션의 id값을 받음
	 * db의 해당 userId와 일치하는 관심일정 내용들을 받아온다
	 * 이미지 주소는 관심지역 이름으로 getImgPath를 통해 받아온다.
	 * 받은 이미지 주소를 list에 담는다 담은 list를 리턴
	 * @return 관심지 지역list
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
	/**
	 * deleteSpot
	 * @param likespotNum 관심지역 번호 를 받아옴
	 * db에 해당 받아온 likespotNum와 일치하는 내용 삭제하고 결과값을 받아온다. 
	 * @return 결과값
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

	/**
	 * schedulelistShow
	 * @param userId 세션의 id값을 받음
	 * db의 해당 userId와 일치하는 관심여행지 내용들을 받아온다
	 * 담아온 list를 리턴
	 * @return list
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
	/**
	 * deleteSchedule
	 * @param likescNum 관심지역 번호 를 받아옴
	 * db에 해당 받아온 likescNum와 일치하는 내용 삭제하고 결과값을 받아온다. 
	 * @return 결과값
	 */
	@RequestMapping("/deleteschedule.tm")
	public ModelAndView deleteSchedule(String likescNum){
		System.out.println(likescNum);
		int result = dao.deleteSchedule(likescNum);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/likespot");
		mv.addObject("result",result);
		return mv;
	}

	/**
	 * qnalist
	 * @param userId세션의 id값을 받음
	 * db에서 Qnalist를 담아와서 list를 리턴시킴
	 * @return list
	 */
	@RequestMapping("/qna.tm")
	public ModelAndView qnalist(String userId, HttpSession session){
		userId = (String)session.getAttribute("userId");
		List<QnaDTO> list = dao.listQnA(userId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/qna");
		mv.addObject("qnalist",list);
		return mv;
	}
	/**
	 * inputQna
	 * @param userId 세션의 아이디값을 받음
	 * @param qnaType 세션의 질문 유형은 받음
	 * @param qnaContent 세션의 질문 내용을 받음
	 * db에 세션에서 받은 userId qnaType qnaContent를 받아서 입력함
	 * @return qna
	 */
	@RequestMapping("/inputqna.tm")
	public String inputQna(String userId, String qnaType, String qnaContent, HttpSession session){
		userId = (String)session.getAttribute("userId");
		System.out.println("타입"+qnaType);
		System.out.println("컨탠츠"+qnaContent);
		dao.inputQna(userId,qnaType,qnaContent); 
		return dir+"/qna";
	}
	/**
	 * 
	 * @param userId 세션의 아이디값을 받아옴
	 * 
	 * @return list 스템프리스트
	 */
	@RequestMapping("/stemp.tm")
	public ModelAndView listStemp(String userId,  HttpSession session){
		System.out.println("탓다탔어 !!");
		userId = (String)session.getAttribute("userId");
		List<StempDTO> doneList = dao.ListStemp(userId);
		ArrayList doneAddr = new ArrayList();
		ArrayList doneName = new ArrayList();
		for(int i = 0 ; i < doneList.size(); i++){			
			doneAddr.add(i,doneList.get(i).getPartnerAddr());							
			doneName.add(i,doneList.get(i).getPartnerName());							
		}
		System.out.println("달성한거 성공");
		List<StempDTO> noList =dao.listNotStemp(userId);
		ArrayList nonAddr = new ArrayList();
		ArrayList nonName = new ArrayList();
		for(int i = 0 ; i < noList.size(); i++){
			nonAddr.add(i,noList.get(i).getPartnerAddr());
			nonName.add(i,noList.get(i).getPartnerName());
		}
		System.out.println("미달성 성공!");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/stemp");
		mv.addObject("doneList",doneList);
		mv.addObject("temp",noList);
		mv.addObject("doneAddr",doneAddr);
		mv.addObject("doneName",doneName);
		mv.addObject("nonAddr",nonAddr);
		mv.addObject("nonName",nonName);		
		return mv;
	}
	

	/**
	 * getImgPath
	 * @param spotName db에서 가져온 관심지역이름
	 * @return path 이미지 주소를 리턴
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
