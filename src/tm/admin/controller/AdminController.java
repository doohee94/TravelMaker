package tm.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.admin.dao.AdminDAO;
import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;
import tm.admin.dto.AdminStempDTO;
import tm.admin.dto.AdminadDTO;
import tm.admin.dto.QRUtil;
import tm.alliance.dto.AllianceDTO;

/**
 * AdminController
 * 관리자 관련 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmadmin")
public class AdminController {
	
	private String dir = "admin/";
	
	@Autowired
	AdminDAO dao;
	
	/**
	 * admin
	 * 인자값 전달이 필요없는 부분 담당
	 */
	@RequestMapping("/{url}.tm")
	public String admin(@PathVariable String url) {
		return dir + url;
	}

	/**
	 * logout
	 * 로그아웃
	 */
	@RequestMapping("/adminlogout.tm")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userNick");
		session.removeAttribute("admin");
		
		return "redirect:/tmmain/main.tm";
	}
	
	/**
	 * 페이지의 시작 번호와 끝번호를 계산하는 메소드
	 * @param totalpage : 총 페이지 수
	 * @param pageNum : 현재 페이지
	 * @return int res : 0->시작번호, 1->끝번호
	 */
	public int[] pageNumber(int totalpage, int pageNum){
		int[] res = new int[2];
		//시작번호와 끝번호가 저장될 변수
		int startpageNum = 0;
		int endpageNum = 0;
		
		//10보다 작거나 같을때
		if(pageNum <= 10){
			//시작번호는 1
			startpageNum = 1;
			//끝번호가 토탈페이지수보다 작을때 끝번호는 토탈페이지수
			if(totalpage <= 10){
				endpageNum = totalpage;
			}else{
				endpageNum = 10;
			}
		//10보다 클때
		}else{
			//시작번호는 현재 페이지의 1로 끝나는 숫자
			startpageNum = (pageNum/10) * 10 + 1;
			
			//끝번호가 토탈페이지수보다 작을때 끝번호는 토탈페이지수
			if( (startpageNum+9) <= totalpage ){
				endpageNum = (startpageNum+9);
			}else{
				endpageNum = totalpage;
			}
		}
		
		//결과값을 배열에 저장
		res[0] = startpageNum;
		res[1] = endpageNum;
		
		return res;
	}
	
	/***********************   member(회원)     **************************/
	
	/**
	 * adMemberList
	 * 관리자 멤버 리스트 출력
	 */
	@RequestMapping("/adminMember.tm")
	public ModelAndView adMemberList(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("member", 15, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */

		
		List<AdminMemberDTO> list =  dao.MemberList(page[1],page[2]);
		mv.setViewName(dir+"/adminMember");
		
		mv.addObject("memlist",list);
		mv.addObject("totalpage",page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminMember.tm");
		
		
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
		
	}
	
	/**
	 * showMember
	 * 한 회원의 정보를 출력(ajax)
	 */
	@RequestMapping("/adminshowmem.tm")
	//@ResponseBody AdminMemberDTO로 리턴값을 json파일로 전송
	public @ResponseBody AdminMemberDTO showMember(@RequestParam(required=true) String user_id) {
		AdminMemberDTO dto = dao.Membershow(user_id);
		
		return dto;
	}
	
	/**
	 * searchmem
	 * 검색한 결과를 출력
	 * @param sel,con
	 */
	@RequestMapping("/adminsearchmem.tm")
	public ModelAndView searchmem(String sel, String con, String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("member", 15, pageNum, sel, con);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminMemberDTO> list = dao.Membersearch(sel, con, page[1], page[2]);
		mv.setViewName(dir+"/adminMember");
		mv.addObject("memlist",list);
		mv.addObject("totalpage",page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminsearchmem.tm");
		mv.addObject("sel", sel);
		mv.addObject("con", con);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	
	
	/***********************   Qna(질문답변)     **************************/
	
	/**
	 * adminqna
	 * QNA리스트를 출력
	 */
	@RequestMapping("/adminQna.tm")
	public ModelAndView adminqna(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("qna", 10, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AdminQnaDTO> list = dao.qnalist(page[1],page[2]);
		
		mv.setViewName(dir+"adminQna");
		mv.addObject("qnalist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	
	@RequestMapping("/adminQnaReply.tm")
	public String reply(AdminQnaDTO adminQnaDTO, String pageNumber){
		
		int res = dao.qnareply(adminQnaDTO);
		
		return "redirect:/tmadmin/adminQna.tm?pageNumber="+pageNumber;
	}
	
	
	
	/***********************   advertisement(광고)     **************************/
	
	
	
	/**
	 * adminadlist
	 * 광고 리스트 출력
	 */
	@RequestMapping("/adminadList.tm")
	public ModelAndView adminadlist(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("advertisement", 6, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		//날짜 형식 지정
		SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );
		//현재 날짜를 가져옴
		Date date = new Date();
		//시작 날짜가 저장될 변수
		Date startdate = null;
		//완료 날짜가 저장될 변수
		Date enddate = null;
		//비교값 저장 변수
		int st = 0;
		//비교값 저장 변수
		int ed = 0;
		
		List<AdminadDTO> list = dao.adlist(page[1],page[2]);
		
		for (AdminadDTO a : list) {
			try {
				//광고 시작일과 완료 날짜를 형식에 맞게 저장
				startdate = format.parse(a.getAdStdate());
				enddate = format.parse(a.getAdEddate());
				
				//현재 날짜를 기준으로 시작날짜와 완료날짜를 비교
				st = date.compareTo(startdate);
				ed = date.compareTo(enddate);
				
				//완료날짜가 현재날짜보다 이전일때 : 완료
				if(ed > 0){
					a.setState("10");
				//시작날짜가 현재날짜랑 같거나 이후고 완료 날짜가 현재날짜이거나 이전일때 : 현재
				}else if(st >= 0 && ed <= 0){
					a.setState("20");
				//시작 날짜가 현재 날짜 이후 일때 : 예정
				}else{
					a.setState("30");
				}
			} catch (ParseException e) {
				System.out.println("날짜 변환 실패 : " + e.getMessage());
				e.printStackTrace();
			}
		}
		
		mv.setViewName(dir+"adminadList");
		mv.addObject("adlist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminadList.tm");
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	@RequestMapping("/adminadsearch.tm")
	public ModelAndView adminadsearch(String pageNumber, String partnerComname, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("advertisement", 6, pageNum, "partner_comname", partnerComname);
		// 날짜 형식 지정
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 현재 날짜를 가져옴
		Date date = new Date();
		// 시작 날짜가 저장될 변수
		Date startdate = null;
		// 완료 날짜가 저장될 변수
		Date enddate = null;
		// 비교값 저장 변수
		int st = 0;
		// 비교값 저장 변수
		int ed = 0;

		List<AdminadDTO> list = dao.adsearch(page[1], page[2], partnerComname);
		
		for (AdminadDTO a : list) {
			try {
				// 광고 시작일과 완료 날짜를 형식에 맞게 저장
				startdate = format.parse(a.getAdStdate());
				enddate = format.parse(a.getAdEddate());

				// 현재 날짜를 기준으로 시작날짜와 완료날짜를 비교
				st = date.compareTo(startdate);
				ed = date.compareTo(enddate);

				// 완료날짜가 현재날짜보다 이전일때 : 완료
				if (ed > 0) {
					a.setState("10");
					// 시작날짜가 현재날짜랑 같거나 이후고 완료 날짜가 현재날짜이거나 이전일때 : 현재
				} else if (st >= 0 && ed <= 0) {
					a.setState("20");
					// 시작 날짜가 현재 날짜 이후 일때 : 예정
				} else {
					a.setState("30");
				}
			} catch (ParseException e) {
				System.out.println("날짜 변환 실패 : " + e.getMessage());
				e.printStackTrace();
			}
		}

		mv.setViewName(dir + "adminadList");
		mv.addObject("adlist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminadsearch.tm");
		mv.addObject("partnerComname", partnerComname);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	
	
	/**
	 * adadsearch
	 * 광고등록에서 검색한 제휴회사 리스트를 출력(ajax)
	 */
	@RequestMapping("/adadsearch.tm")
	public @ResponseBody List<AllianceDTO> adadsearch(@RequestParam String partnercomname) {
		
		List<AllianceDTO> list = dao.alsearch(partnercomname);
		
		return list;
	}
	
	/**
	 * 광고DB등록
	 */
	@RequestMapping("/adadinsert.tm")
	public String insertad(AdminadDTO adminadDTO, String partnerType) {
		adminadDTO.setAdStdate(adminadDTO.getStartyear()+"/"+adminadDTO.getStartmonth()+"/"+adminadDTO.getStartday());
		adminadDTO.setAdEddate(adminadDTO.getEndyear()+"/"+adminadDTO.getEndmonth()+"/"+adminadDTO.getEndday());
		
		int res = dao.adadinsert(adminadDTO);
		
		/*
		 * <option value="10">제휴</option>
			<option value="20">광고</option>
			<option value="30">스탬프</option>
			<option value="40">광고/스탬프</option>
		 */
		
		if(res > 0){
			if(partnerType.equals("10")){
				partnerType = "20";
				AllianceDTO dto = new AllianceDTO();
				dto.setPartnerType(Integer.parseInt(partnerType));
				dto.setPartnerNum(adminadDTO.getPartnerNum());
				dao.typeupdate(dto);
			}else if(partnerType.equals("30")){
				partnerType = "40";
				AllianceDTO dto = new AllianceDTO();
				dto.setPartnerType(Integer.parseInt(partnerType));
				dto.setPartnerNum(adminadDTO.getPartnerNum());
				dao.typeupdate(dto);
			}
		}
		
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	/**
	 * 광고 삭제
	 */
	@RequestMapping("/deletead.tm")
	public String deletead(String num) {
		
		int res = dao.addelete(num);
		
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	/**
	 * 광고 정보보기
	 */
	@RequestMapping("/adminadshow.tm")
	public ModelAndView adminadshow(String num, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		
		AdminadDTO dto = dao.adminadshow(num);
		
		mv.setViewName(dir+"adminadshow");
		mv.addObject("dto",dto);
		return mv;
	}
	
	/**
	 * 광고 수정
	 */ 	
	@RequestMapping("adupdate.tm")
	public String adupdate(AdminadDTO adminadDTO){
		adminadDTO.setAdStdate(adminadDTO.getStartyear()+"/"+adminadDTO.getStartmonth()+"/"+adminadDTO.getStartday());
		adminadDTO.setAdEddate(adminadDTO.getEndyear()+"/"+adminadDTO.getEndmonth()+"/"+adminadDTO.getEndday());
		
		dao.adupdate(adminadDTO);
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	/**
	 * 광고 설정
	 */
	@RequestMapping("adcheck.tm")
	public String adcheck(String textcheck, String textnotcheck){
		//선택 문자열 분리
		StringTokenizer st = new StringTokenizer(textcheck, "/");
		//선택되지 않은 문자열 분리
		StringTokenizer nst = new StringTokenizer(textnotcheck, "/");
		
		ArrayList<String> num = new ArrayList<String>();
		ArrayList<String> notnum = new ArrayList<String>();
		
		//선택된 문자열을 num에 저장
		while (st.hasMoreTokens()) {
			String temp = st.nextToken();
			if(!(temp.equals("start"))){
				num.add(temp);
			}
		}
		
		//선택되지 않은 문자열을 notnum에 저장
		while (nst.hasMoreTokens()) {
			String temp = nst.nextToken();
			if(!(temp.equals("end"))){
				notnum.add(temp);
			}
		}
		
		//디비 설정 변경
		if(num.size() > 0){
			for (String s : num) {
				dao.adcheck(s , "20");
			}
		}
		
		//디비 설정 변경
		if(notnum.size() > 0){
			for (String s : notnum) {
				dao.adcheck(s , "10");
			}
		}
		
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	
	
	/***********************   Alliance(제휴)     **************************/
	
	
	
	/**
	 * allianceList
	 * 제휴 리스트
	 */
	
	@RequestMapping("/adminAllianceList.tm")
	public ModelAndView allianceList(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 1, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AllianceDTO> list = dao.adallist(page[1],page[2]);
		mv.setViewName(dir+"adminAllianceList");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminAllianceList.tm");
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * searchalli
	 * 제휴 검색 리스트 (adminAllianceList)
	 */
	@RequestMapping("/searchalli.tm")
	public ModelAndView searchalli(String partnerComname, String pageNumber, HttpSession session){
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 1, partnerComname);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AllianceDTO> list = dao.alsearch(page[1],page[2],partnerComname);
		mv.setViewName(dir+"adminAllianceList");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "searchalli.tm");
		mv.addObject("partnerComname", partnerComname);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * deleteAlliance
	 * 제휴 리스트 삭제
	 */
	@RequestMapping("/adminalliancedel.tm")
	public String deleteAlliance(String num) {
		
		int res = dao.allianceDel(num);
		
		return "redirect:/tmadmin/adminAllianceList.tm";
	}
	
		
	
	/***********************   Alliance Rec(승인)     **************************/
	
	
	
	/**
	 * adminAllianceRec
	 * 제휴 리스트
	 */
	@RequestMapping("/adminAllianceRec.tm")
	public ModelAndView adminAllianceRec(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 2, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AllianceDTO> list = dao.adallistRec(page[1],page[2]);
		mv.setViewName(dir+"adminAllianceRec");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminAllianceRec.tm");
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * searchallirec
	 * 제휴 승인 검색 리스트 (adminAllianceList)
	 */
	@RequestMapping("/searchallirec.tm")
	public ModelAndView searchallirec(String partnerComname, String pageNumber, HttpSession session){
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 2, partnerComname);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AllianceDTO> list = dao.alsearchRec(page[1],page[2],partnerComname);
		mv.setViewName(dir+"adminAllianceRec");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "searchallirec.tm");
		mv.addObject("partnerComname", partnerComname);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * adminalup
	 * 제휴 승인
	 */
	@RequestMapping("/adminalup.tm")
	public String adminalup(String num) {
		
		int res = dao.adminalup(num);
		
		return "redirect:/tmadmin/adminAllianceRec.tm";
	}
	
	/**
	 * adminalup
	 * 제휴 거절
	 */
	@RequestMapping("/adminalde.tm")
	public String adminalde(String num) {
		
		dao.allianceDel(num);
		
		return "redirect:/tmadmin/adminAllianceRec.tm";
	}
	
	
	
	/***********************   Stemp(스탬프)     **************************/
	
	
	
	/**
	 * adminstemp
	 * 스탬프 리스트
	 */
	@RequestMapping("/adminstemp.tm")
	public ModelAndView adminstemp(String pageNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("parstemp", 10, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminStempDTO> list = dao.stemp(page[1],page[2]);
		
		mv.setViewName(dir+"adminstemp");
		mv.addObject("list", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url","adminstemp.tm");
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * searchstemp
	 * 스탬프 검색
	 */
	@RequestMapping("/searchstemp.tm")
	public ModelAndView searchstemp(String pageNumber, String partnerName, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("parstemp", 10, pageNum, "partner_name", partnerName);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminStempDTO> list = dao.searchstemp(page[1],page[2],partnerName);
		mv.setViewName(dir+"adminstemp");
		mv.addObject("list", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url","searchstemp.tm");
		mv.addObject("partnerName",partnerName);
		
		int[] sten = pageNumber(page[0], pageNum);
		/*
		 *  0 : startPageNum
		 *  1 : endPageNum
		 */
		
		mv.addObject("startpageNum", sten[0]);
		mv.addObject("endpageNum", sten[1]);
		
		return mv;
	}
	
	/**
	 * 스탬프 등록
	 */
	@RequestMapping("/insertstemp.tm")
	public String insertStemp(AdminStempDTO adminStempDTO, String partnerType) {
		String num = dao.insertstemp(adminStempDTO);
		
		/*
		 * <option value="10">제휴</option>
			<option value="20">광고</option>
			<option value="30">스탬프</option>
			<option value="40">광고/스탬프</option>
		 */
		
		if(num != null){
			if(partnerType.equals("10")){
				partnerType = "30";
				AllianceDTO dto = new AllianceDTO();
				dto.setPartnerType(Integer.parseInt(partnerType));
				dto.setPartnerNum(adminStempDTO.getPartnerNum());
				dao.typeupdate(dto);
			}else if(partnerType.equals("20")){
				partnerType = "40";
				AllianceDTO dto = new AllianceDTO();
				dto.setPartnerType(Integer.parseInt(partnerType));
				dto.setPartnerNum(adminStempDTO.getPartnerNum());
				dao.typeupdate(dto);
			}
		}
		
		return "redirect:/tmadmin/stempcreation.tm?num="+num;
	}
	
	/**
	 * 스탬프 수정하기 view
	 */
	@RequestMapping("/showStemp.tm")
	public ModelAndView showStemp(String parstempNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//관리자 로그인이 안되었다면 메인페이지로 이동
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			mv.setViewName("redirect:/tmmain/main.tm");
			return mv;
		}
		AdminStempDTO dto = dao.showStemp(parstempNum);
		mv.setViewName(dir+"adminstempupdate");
		mv.addObject("dto", dto);
		return mv;
	}
	
	/**
	 * 스탬프 수정
	 */
	@RequestMapping("/stempupdate.tm")
	public String stempupdate(AdminStempDTO adminStempDTO){
		dao.stempupdate(adminStempDTO);
		return "redirect:/tmadmin/adminstemp.tm";
	}
	
	/**
	 * 스탬프 삭제
	 */
	@RequestMapping("/stempdelete.tm")
	public String stempdelete(String parstempNum){
		dao.stempdelete(parstempNum);
		return "redirect:/tmadmin/adminstemp.tm";
	}
	
	/**
	 * 스탬프 QR생성
	 */
	@RequestMapping("/stempcreation.tm")
	public String stempcreation(String num){
		String url = "http://192.168.0.104/tmmobile/mstemp.tm?parstempNum="+num;
		QRUtil.makeQR(url, num);
		dao.stempcreation(num);
		
		return "redirect:/tmadmin/adminstemp.tm";
	}
}