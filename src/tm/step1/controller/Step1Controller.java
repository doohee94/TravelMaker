package tm.step1.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.member.dto.MemberDTO;
import tm.step1.dao.Step1DAO;
import tm.step1.dto.StepDTO;

/**
 * Step1Controller 스탭1 여행일정 만들기 관련 매핑 처리 dir : 폴더 경로
 */
@Controller
@RequestMapping("/step1")
public class Step1Controller {

	/**
	 * index에서 step1 폴더 안써도 가지게
	 */
	private String dir = "step1/";

	@Autowired
	Step1DAO dao;



	// step1 동행자 팝업 검색 목록 ( 아이디 와 닉네임 출력 )
	@RequestMapping("/setp1searchfellow.tm")
	public ModelAndView setp1searchfellow(HttpServletRequest request) {

		System.out.println("탄다");
		System.out.println(request.getParameter("con"));
		// dao로 데이터 넘겨주고
		List<MemberDTO> list = dao.fellowsearch(request.getParameter("con"));

		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir + "/step1");
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping("/stepinfo.tm")
	public String nextBtn(StepDTO stepdto, HttpSession session){
		
		ArrayList<String> schedule = stepdto.getSchedule();
		schedule.add(stepdto.getListstart());
		StringTokenizer st = new StringTokenizer(stepdto.getListthrough(), ">");
		while (st.hasMoreTokens()) {
			String temp = st.nextToken();
			if (!(temp.equals("") || temp == null)) {
				schedule.add(temp);
			}
		}
		schedule.add(stepdto.getListarrival());
		ArrayList<String> party = stepdto.getParty();
		StringTokenizer stp = new StringTokenizer(stepdto.getPartystr(), " ");
		while (stp.hasMoreTokens()) {
			String temp = stp.nextToken();
			if (!(temp.equals("") || temp == null)) {
				party.add(temp);
			}
		}
		
		String userId = (String)session.getAttribute("userId");
//		stepdto.setId(userId);
		// 위 코드를 주석처맇나 이유는 step3에서 id 따로 만들었기 때문.
		System.out.println("아마도 시간만 나올껄 : " + stepdto.getId());
		
		session.setAttribute(userId+"dto", stepdto);
		

		return "redirect:/step2/step2.tm";
	}
	

	/**
	 * 인자값 전달이 필요없는 부분 담당
	 */
	@RequestMapping("/{url}.tm")
	public String step1(@PathVariable String url) {
		System.out.println("컨트롤탔음");
		System.out.println(dir + url);
		return dir + url;
	}
}
