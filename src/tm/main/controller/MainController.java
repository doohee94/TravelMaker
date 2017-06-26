package tm.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * MainController
 * 메인화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmmain")
public class MainController {

		private String dir = "main/";
				
		@RequestMapping("/{url}.tm")
		public String main(@PathVariable String url){
			System.out.println("메인컨트롤러");
				return dir+url;
		}
		
		@RequestMapping("/logout.tm")
		public ModelAndView logout(HttpSession session){
			System.out.println("컨트롤러는 타니 ?");
			session.invalidate();
			ModelAndView mv = new ModelAndView();
			mv.setViewName(dir+"main");
			//디비타서 여행지 추천 top3과 광고 배너 넣기 도전일정 top3개 넣기
			return mv;
		}
		
		

		
}