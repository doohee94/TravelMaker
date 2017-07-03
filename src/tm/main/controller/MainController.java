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
		
		@RequestMapping("/{url}.tm")
		public String main(@PathVariable String url){
				return dir+url;
		}
		@RequestMapping("/main.tm")
		public ModelAndView mainpage(){
			ModelAndView mv =getMainItem();			
			return mv;
		}
		
		@RequestMapping("/logout.tm")
		public ModelAndView logout(HttpSession session){
			session.invalidate();
			ModelAndView mv =getMainItem();
			//디비타서 여행지 추천 top3과 광고 배너 넣기 도전일정 top3개 넣기
			return mv;
		}
		
		/**
		 * getMainItem
		 * 메인페이지 로딩할때 광고 리스트, 여행지top3, 리뷰top3가져오기
		 * 각각 DB에서 광고 리스트, 여행지top3, 리뷰top3를 가져와
		 * Model and view에 담아서 리턴 시킴
		 */
		public ModelAndView getMainItem(){
			System.out.println("아이템을 가져와볼까 ?");
			//광고 이미지 주소 가져오기
			String adImgPath = dao.loadAd();
			System.out.println("광고 가져오기 완료");
			//리뷰 top3 이미지주소, 이름, 좋아요수, 유저아이디, 일정번호, 리뷰번호 가져옴			
			List<TotalreDTO> reviewList = dao.loadReview();
			System.out.println("리뷰 top3가져오기 완료");
			//여행지 top3 이미지 주소, 이름 가져오기
			
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName(dir+"main");
			
			mv.addObject("adImgPath",adImgPath);
			for(int i = 0 ; i < reviewList.size(); i++){
			mv.addObject("reviewimg"+i,reviewList.get(i).getTotalrePhoto1fake());
			mv.addObject("reviewtitle"+i,reviewList.get(i).getTotalreTitle());
			mv.addObject("reviewlike"+i,reviewList.get(i).getTotalreLikecount());
			mv.addObject("reviewlike"+i,reviewList.get(i).getTotalreLikecount());
			mv.addObject("reuserId"+i,reviewList.get(i).getUserId());
			mv.addObject("rescNum"+i,reviewList.get(i).getScNum());
			mv.addObject("retotalNum"+i,reviewList.get(i).getTotalreNum());
			}
			System.out.println("모델엔 뷰 다 넘겼음.");
			return mv;		
		}
		
}