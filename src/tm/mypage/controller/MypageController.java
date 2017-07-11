package tm.mypage.controller;


import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import tm.mypage.dao.MypageDAO;
import tm.mypage.dto.LikeSCDTO;
import tm.mypage.dto.LikeSpotDTO;
import tm.mypage.dto.QnaDTO;
import tm.mypage.dto.StempDTO;
import tm.totalre.dto.TotalreDTO;

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
	/**
	 * main 
	 * 커맨드 요청이 없는 일반 호출 
	 */
	@RequestMapping("/{url}.tm")
	public String main(@PathVariable String url){
			return dir+url;
	}

	/**
	 * spotListShow
	 * 마이페이지 관심지역을 누르면 들어오는 함수
	 * @param userId 세션의 id값을 받음
	 * db의 해당 userId와 일치하는 관심일정 내용들을 받아온다
	 * 이미지 주소는 관심지역 이름으로 getImgPath를 통해 받아온다
	 * 받은 이미지 주소를 list에 담는다 담은 list를 리턴
	 * @return 관심지 지역list
	 */
	@RequestMapping("/likespot.tm")
	public ModelAndView spotListShow(String userId, HttpSession session){
		//세션에서 userId를 받음
		userId = (String)session.getAttribute("userId");
		//정상적인 로그인시에
		if(userId!=null){
		//db에서 userId와 일치하는 컬럼들을 list로 받음
		List<LikeSpotDTO>list = dao.listSpot(userId);
		//받아온 list에서 spotName를 통해 api에서 이미지 주소 받아오기 반복문
		for (int i = 0 ; i < list.size() ; i++){
			//지역을 통한 api에서 이미지 받아오기
			String path = getImgPath(list.get(i).getLikespotName());
			//받아온 이미지 주소를 list에 넣기
			list.get(i).setImagePath(path);
		}
		//ModelAndView mv생성
		ModelAndView mv = new ModelAndView();
		//mv에 viewName 지정
		mv.setViewName(dir+"/likespot");
		//mv에 list를 담음
		mv.addObject("likelist",list);
		//세션을 유지를 위해 userId를 다시 세션에 저장
		session.setAttribute("userId", userId);
		//mv를 리턴
		return mv;
		}
		//비정상적인 접근
		else {
		ModelAndView mv = new ModelAndView();
		//로그인 페이지로 넘김
		mv.setViewName("redirect:/member/loginForm.tm");
		return mv;
		}
	}
	/**
	 * deleteSpot
	 * @param likespotNum 관심지역 번호 를 받아옴
	 * db에 해당 받아온 likespotNum와 일치하는 내용 삭제하고 결과값을 리턴. 
	 * @return 결과값
	 */
	@RequestMapping("/deletespot.tm")
	public ModelAndView deleteSpot(String likespotNum){
		//likespotNum를 받아와 db에서 해당 likespotNum에 해당하는 컬럼삭제후 결과값을 받음
		int result = dao.deleteSpot(likespotNum);
		//ModelAndView mv를 생성
		ModelAndView mv = new ModelAndView();
		//mv에 viewName를 지정
		mv.setViewName(dir+"/likespot");
		//mv에 결과값 담음
		mv.addObject("result",result);
		//mv를 리턴
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
	public ModelAndView scheduleListShow(HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		
		String userId = (String)session.getAttribute("userId");
		ArrayList list = dao.selectLikeReview(userId);
		
		ArrayList<TotalreDTO> likelist = new ArrayList<TotalreDTO>();
		
		for(int i=0; i<list.size(); i++){
			//System.out.println("#####"+list.get(i).toString());
			likelist.add(dao.selectReview(list.get(i).toString()));
			//System.out.println(likelist.get(i).getTotalreTitle());
		}
		
		mv.addObject("likelist",likelist);
		mv.setViewName(dir + "schedule");
		
		return mv;
	}
	/**
	 * deleteSchedule
	 * @param likescNum 관심지역 번호 를 받아옴
	 * db에 해당 받아온 likescNum와 일치하는 내용 삭제하고 결과값을 리턴. 
	 * @return 결과값
	 */
	@RequestMapping("/deleteschedule.tm")
	public ModelAndView deleteSchedule(String likescNum){
		//likescNum를 받아와 db에서 해당 likescNum에 해당하는 컬럼삭제후 결과값을 받음
		int result = dao.deleteSchedule(likescNum);
		//ModelAndView mv를 생성
		ModelAndView mv = new ModelAndView();
		//mv에 viewName를 지정
		mv.setViewName(dir+"/likespot");
		//mv에 결과값 담음
		mv.addObject("result",result);
		//mv를 리턴
		return mv;
	}

	/**
	 * qnalist
	 * @param userId세션의 id값을 받음
	 * db에서 userId와 일치하는 컬럼들을 list를 담아와서 list를 리턴
	 * @return list
	 */
	@RequestMapping("/qna.tm")
	public ModelAndView qnalist(String tempPage, HttpSession session){
		//세션에서 userId를 받음
		String userId = (String)session.getAttribute("userId");
		//정상적인 접근시
		if(userId!=null){
		//페이징 부분
		//db에서 끝 컬럼번호를 받아옴
		int qnaedNum = dao.findPage(userId);
		
		//기본적인 페이지 번호
		int pageNum = 0;
		 //페이지 번호를 가지고 있지 않을때 초기 접속시
		List<QnaDTO> list;
		//ModelAndView mv를 생성
		ModelAndView mv = new ModelAndView();
		if(qnaedNum != 0){
		 if(tempPage ==null){
			 //페이지 번호를 5로 맞추어 준다
			 pageNum = 5;
		 }
		 //페이지 번호를 가지고 있을때
		 else if(tempPage !=null){
			 //마지막 페이지와 기존의 페이지값 +5의 값의 비교를 위해 임시 변수 tempNum 생성
			 int tempNum =Integer.parseInt(tempPage)+5;
			 //tempNum가 qnaedNum보다 작을때 pageNum 는 tempNum로 지정
			 if(tempNum < qnaedNum){
				 pageNum =	tempNum;			 
			 }
			 //tempNum가 qnaedNum보다 크거나 같을 경우 페이지를 강제로 qnaedNum로 맞추기
			 else{
				 pageNum = qnaedNum;
			 }
		 }
		 		//db에서 userId와 일치하는 컬럼들을 list로 받음
		 		list = dao.listQnA(userId, pageNum);
				//mv에 viewName를 지정
				mv.setViewName(dir+"/qna");
				//mv에 list를 담음
				mv.addObject("qnalist",list);
				//mv에 pageNum을 담음
				mv.addObject("pageNum", pageNum);
				//mv에 qnaedNum을 담음
				mv.addObject("qnaedNum", qnaedNum);
				//세션을 유지를 위해 userId를 다시 세션에 저장
				session.setAttribute("userId", userId);
				//mv를 리턴
				return mv;
		} else {
		list = null;	
		//mv에 viewName를 지정
		mv.setViewName(dir+"/qna");
		//mv에 list를 담음
		mv.addObject("qnalist",list);
		//mv를 리턴
		return mv;
		}
		
		
		}
		//비정상적인 접근
		else {
		ModelAndView mv = new ModelAndView();
		//로그인 페이지로 넘김
		mv.setViewName("redirect:/member/loginForm.tm");
		return mv;
		}
	}
	/**
	 * inputQna
	 * db에 세션에서 받은 userId qnaType qnaContent를 받아서 입력함
	 * @param userId 세션의 아이디값을 받음
	 * @param qnaType 세션의 질문 유형은 받음
	 * @param qnaContent 세션의 질문 내용을 받음
	 * @return qna페이지
	 */
	@RequestMapping("/inputqna.tm")
	public String inputQna(String userId, String qnaType, String qnaContent, HttpSession session){
		//세션에서 userId를 받음
		userId = (String)session.getAttribute("userId");
		//db에 userId,qnaType,qnaContent 을 입력시킴
		dao.inputQna(userId,qnaType,qnaContent); 
		//qna페이지를 리턴
		return dir+"/qna";
	}
	/**
	 * listStemp
	 * db에서 userId와 일치하는 컬럼들을 달성한 스탬프 list, 달성하지 못한 list 에 받아옴
	 * 각각 받아온 list를 addrList와 nameList로 분리  후 
	 * doneList,noList,doneAddr,doneName,nonAddr,nonName를 각각 리턴
	 * @param userId 세션의 아이디값을 받아옴
	 * @return doneList,noList,doneAddr,doneName,nonAddr,nonName
	 * 
	 */
	@RequestMapping("/stemp.tm")
	public ModelAndView listStemp(String userId,  HttpSession session){
		//세션에서 userId를 받음
		userId = (String)session.getAttribute("userId");
		//정상적인 접근시
		if(userId!=null){
		//userId와 일치하는 달성한 list를 받아옴
		List<StempDTO> doneList = dao.ListStemp(userId);
		//달성한 장소 주소 리스트 객체 생성
		ArrayList doneAddr = new ArrayList();
		//달성한 장소 이름 리스트 객체 생성
		ArrayList doneName = new ArrayList();
		//doneList에서 장소리스트 이름리스트로 분리
		for(int i = 0 ; i < doneList.size(); i++){			
			doneAddr.add(i,doneList.get(i).getPartnerAddr());							
			doneName.add(i,doneList.get(i).getPartnerName());							
		}
		//userId와 일치하는 달성하지 못한 list를 받아옴
		List<StempDTO> noList =dao.listNotStemp(userId);
		//달성하지 못한 장소 주소 리스트 객체 생성
		ArrayList nonAddr = new ArrayList();
		//달성하지 못한 장소 이름 리스트 객체 생성
		ArrayList nonName = new ArrayList();
		//noList에서 장소리스트 이름리스트로 분리
		for(int i = 0 ; i < noList.size(); i++){
			nonAddr.add(i,noList.get(i).getPartnerAddr());
			nonName.add(i,noList.get(i).getPartnerName());
		}
		
		ModelAndView mv = new ModelAndView();
		//ModelAndView mv를 생성
		mv.setViewName(dir+"/stemp");
		//mv에 viewName를 지정
		mv.addObject("doneList",doneList);
		//mv 에 noList를 담음
		mv.addObject("temp",noList);
		//mv 에 doneAddr를 담음
		mv.addObject("doneAddr",doneAddr);
		//mv 에 doneName를 담음
		mv.addObject("doneName",doneName);
		//mv 에 doneName를 담음
		mv.addObject("nonAddr",nonAddr);
		//mv 에 nonName를 담음
		mv.addObject("nonName",nonName);
		//mv를 리턴
		return mv;
		}
		//비정상적인 접근
		else {
			ModelAndView mv = new ModelAndView();
			//로그인 페이지로 넘김
			mv.setViewName("redirect:/member/loginForm.tm");
			return mv;
		}	
	}
	

	/**
	 * getImgPath
	 * @param spotName db에서 가져온 관심지역이름
	 * @return path 이미지 주소를 리턴
	 */
	public String getImgPath(String spotName) {	
		//api키 생성
		String key ="GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D";
		//api를 통해 얻은 주소값을 얻을 변수 생성
		String path ="";
		try{
		//api를 통해 xml을 파싱			
		String keyword = URLEncoder.encode(spotName, "UTF-8");
		//파싱하기 위한 DocumentBuilderFactory dbf를 생성
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		//파싱하기 위한 DocumentBuilder parser 생성
		DocumentBuilder parser = dbf.newDocumentBuilder();
		//xml객체로 받을 객체 xmldoc생성
		org.w3c.dom.Document xmldoc = null;
		//xml형식으로 받아올 대상
		String parseurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="+key+"&keyword="+keyword+"&MobileOS=ETC&MobileApp=AppTesting";
		//xml형태로 xmldoc에 담음
		xmldoc = parser.parse(parseurl);
		//xml에서 해당 컬럼을 찾아올 root를 생성
		org.w3c.dom.Element root = xmldoc.getDocumentElement();
		//xml에서 firstimage에 해당하는 컬럼을 찾아 path에 담음
		path = root.getElementsByTagName("firstimage").item(0).getTextContent();
		//컬럼이 없을 경우 예외 처리 
		if (path.equals("")){ path = null;}		
		}
		//파싱 실패시
		catch (Exception ex){
			System.out.println("에러 발생 : " +ex.getMessage());
		}
		//파싱한 path를 리턴
		return path;
	}
}
