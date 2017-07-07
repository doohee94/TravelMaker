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
import org.springframework.web.bind.annotation.ResponseBody;
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

	/**
	 * step1 동행자 팝업 검색 목록 ( 아이디 와 닉네임 출력 )
	 */
	@RequestMapping("/step1searchfellow.tm")
	public @ResponseBody List<MemberDTO> setp1searchfellow(String step1search, HttpSession session) {

		String userId = (String)session.getAttribute("userId");
		if (userId == null) {
			userId = " ";
		}

		List<MemberDTO> list = dao.fellowsearch(step1search, userId);

		return list;
	}

	/**
	 * step1 일정만들기에서 입력한 정보를 step2 로 넘겨주는데 세션을 이용.
	 */
	@RequestMapping("/stepinfo.tm")
	public String nextBtn(StepDTO stepdto, HttpSession session) {

		/**
		 * 출발지 경유지 도착지 를 넘기는데 경유지는 한 곳 이상이 들어오기 때문에
		 * 스트링토크나이저를 이용하여 값만 전달(">" 구분자 제외)
		 */
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

		/**
		 * 동행자는 한 명이상, 최대4명(나를제외한) 입력가능하다. 스트링토크나이저를 이용하여 값만 전달( " " 구분자 제외)
		 */
		ArrayList<String> party = stepdto.getParty();
		StringTokenizer stp = new StringTokenizer(stepdto.getPartystr(), " ");
		while (stp.hasMoreTokens()) {
			String temp = stp.nextToken();
			if (!(temp.equals("") || temp == null)) {
				party.add(temp);
			}
		}

		/**
		 * 아래 stepdto.setId(userId) 코드를 주석처리를 하는 이유는 step3에서 id 따로 만들었기 때문.
		 */
		String userId = (String) session.getAttribute("userId");
		// stepdto.setId(userId);

		System.out.println("아마도 시간만 나올껄 : " + stepdto.getId());

		session.setAttribute(userId + "dto", stepdto);

		return "redirect:/step2/step2.tm";
	}

	/**
	 * 인자값 전달이 필요없는 부분 담당
	 */
	@RequestMapping("/{url}.tm")
	public String step1(@PathVariable String url) {
		return dir + url;
	}
}
