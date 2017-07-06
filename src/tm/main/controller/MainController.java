package tm.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.main.dao.MainDAO;
import tm.main.dto.TotalreDTO;
/**
 * MainController
 * 메인화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmain")
public class MainController {

		private String dir = "main/";
		
		@Autowired
		MainDAO dao;
		/**
		 * main 
		 * 커맨드 요청이 없는 일반 호출 
		 */
		@RequestMapping("/{url}.tm")
		public String main(@PathVariable String url){
				return dir+url;
		}
		/**
		 * mainpPage
		 * 메인페이지로 가는 함수
		 * db에서 광고목록, 일정top3, 여행지top3을 불러와서 ModelAndView mv에 담음
		 * @return mv 
		 */
		@RequestMapping("/main.tm")
		public ModelAndView mainPage(){
			//ModelAndView mv를 생성 후 getMainItem실행후 결과값을 mv에 담음
			ModelAndView mv =getMainItem();
			//mv를 리턴
			return mv;
		}
		/**
		 * logOut
		 * 로그아웃시 메인 페이지로 가는 함수
		 * 세션을 전체 초기화시킨후
		 * db에서 광고목록, 일정top3, 여행지top3을 불러와서 ModelAndView mv에 담음
		 * @return mv 
		 */
		@RequestMapping("/logout.tm")
		public ModelAndView logOut(HttpSession session){
			//기존의 세션을 삭제시킴
			session.invalidate();
			//ModelAndView mv를 생성 후 getMainItem실행후 결과값을 mv에 담음
			ModelAndView mv =getMainItem();
			//mv를 리턴
			return mv;
		}		
		/**
		 * getMainItem
		 * 메인페이지 로딩할때 광고 리스트, 여행지top3, 리뷰top3가져오기
		 * 각각 DB에서 광고 리스트, 여행지top3, 리뷰top3를 가져와
		 * ModelAndview에 담아서 리턴 시킴
		 */
		public ModelAndView getMainItem(){
			//광고 이미지 주소 가져오기
			String adImgPath = dao.loadAd();
			//리뷰 top3 이미지주소, 이름, 좋아요수, 유저아이디, 일정번호, 리뷰번호 가져옴			
			List<TotalreDTO> reviewList = dao.loadReview();
			System.out.println("리뷰 top3가져오기 완료");
		//여행지 top3 이미지 주소, 이름 가져오기
			//모델엔뷰mv 생성
			ModelAndView mv = new ModelAndView();
			//주소 담기
			mv.setViewName(dir+"main");
			//mv에 광고 이미지 주소 담기
			mv.addObject("adImgPath",adImgPath);
			//mv에 리뷰top3의 정보들을 1순위 2순위 3순위 별로 담기
			for(int i = 0 ; i < reviewList.size(); i++){
			mv.addObject("reviewimg"+i,reviewList.get(i).getTotalrePhoto1fake());
			mv.addObject("reviewtitle"+i,reviewList.get(i).getTotalreTitle());
			mv.addObject("reviewlike"+i,reviewList.get(i).getTotalreLikecount());
			mv.addObject("reviewlike"+i,reviewList.get(i).getTotalreLikecount());
			mv.addObject("reuserId"+i,reviewList.get(i).getUserId());
			mv.addObject("rescNum"+i,reviewList.get(i).getScNum());
			mv.addObject("retotalNum"+i,reviewList.get(i).getTotalreNum());
			}
			//mv를 리턴
			return mv;		
		}
		
}