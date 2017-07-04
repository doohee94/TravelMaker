package tm.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

	
	
	/***********************   member(회원)     **************************/
	
	/**
	 * adMemberList
	 * 관리자 멤버 리스트 출력
	 */
	@RequestMapping("/adminMember.tm")
	public ModelAndView adMemberList(String pageNumber) {
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("member", 15, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminMemberDTO> list =  dao.MemberList(page[1],page[2]);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/adminMember");
		mv.addObject("memlist",list);
		mv.addObject("totalpage",page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminMember.tm");
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
	public ModelAndView searchmem(String sel, String con, String pageNumber) {
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("member", 15, pageNum, sel, con);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminMemberDTO> list = dao.Membersearch(sel, con, page[1], page[2]);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/adminMember");
		mv.addObject("memlist",list);
		mv.addObject("totalpage",page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminsearchmem.tm");
		mv.addObject("sel", sel);
		mv.addObject("con", con);
		return mv;
	}
	
	
	
	/***********************   Qna(질문답변)     **************************/
	
	/**
	 * adminqna
	 * QNA리스트를 출력
	 */
	@RequestMapping("/adminQna.tm")
	public ModelAndView adminqna(String pageNumber) {
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("qna", 10, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AdminQnaDTO> list = dao.qnalist(page[1],page[2]);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName(dir+"adminQna");
		mv.addObject("qnalist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		
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
	public ModelAndView adminadlist(String pageNumber) {
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
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminadList");
		mv.addObject("adlist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminadList.tm");
		return mv;
	}
	
	@RequestMapping("/adminadsearch.tm")
	public ModelAndView adminadsearch(String pageNumber, String partnerComname) {
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

		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir + "adminadList");
		mv.addObject("adlist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url", "adminadsearch.tm");
		mv.addObject("partnerComname", partnerComname);
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
	public ModelAndView insertad(AdminadDTO adminadDTO) {
		adminadDTO.setAdStdate(adminadDTO.getStartyear()+"/"+adminadDTO.getStartmonth()+"/"+adminadDTO.getStartday());
		adminadDTO.setAdEddate(adminadDTO.getEndyear()+"/"+adminadDTO.getEndmonth()+"/"+adminadDTO.getEndday());
		
		int res = dao.adadinsert(adminadDTO);
		
		List<AdminadDTO> list = dao.adlist();
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminadList");
		mv.addObject("adlist", list);
		return mv;
	}
	
	/**
	 * 광고 삭제
	 */
	@RequestMapping("/deletead.tm")
	public String deletead(String num) {
		
		int res = dao.addelete(num);
		
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	@RequestMapping("/adminadshow.tm")
	public ModelAndView adminadshow(String num) {
		
		AdminadDTO dto = dao.adminadshow(num);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminadshow");
		mv.addObject("dto",dto);
		return mv;
	}
	
	@RequestMapping("adupdate.tm")
	public String adupdate(AdminadDTO adminadDTO){
		adminadDTO.setAdStdate(adminadDTO.getStartyear()+"/"+adminadDTO.getStartmonth()+"/"+adminadDTO.getStartday());
		adminadDTO.setAdEddate(adminadDTO.getEndyear()+"/"+adminadDTO.getEndmonth()+"/"+adminadDTO.getEndday());
		
		dao.adupdate(adminadDTO);
		return "redirect:/tmadmin/adminadList.tm";
	}
	
	
	/***********************   Alliance(제휴)     **************************/
	
	
	
	/**
	 * allianceList
	 * 제휴 리스트
	 */
	
	@RequestMapping("/adminAllianceList.tm")
	public ModelAndView allianceList(String pageNumber) {
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 1, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AllianceDTO> list = dao.adallist(page[1],page[2]);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminAllianceList");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		
		return mv;
	}
	
	/**
	 * searchalli
	 * 제휴 검색 리스트 (adminAllianceList)
	 */
	@RequestMapping("/searchalli.tm")
	public ModelAndView searchalli(String partnerComname, String pageNumber){
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 1, partnerComname);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AllianceDTO> list = dao.alsearch(partnerComname);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminAllianceList");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
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
	
	/**
	 * stateupdate
	 * 제휴형태 변경
	 */
	@RequestMapping("/stateupdate.tm")
	public String stateupdate(AllianceDTO allianceDTO) {
		
		dao.typeupdate(allianceDTO);
		
		return "redirect:/tmadmin/adminAllianceList.tm";
	}
	
	
	/***********************   Alliance Rec(승인)     **************************/
	
	
	
	/**
	 * adminAllianceRec
	 * 제휴 리스트
	 */
	@RequestMapping("/adminAllianceRec.tm")
	public ModelAndView adminAllianceRec(String pageNumber) {
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 2, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		List<AllianceDTO> list = dao.adallistRec(page[1],page[2]);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminAllianceRec");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		
		return mv;
	}
	
	/**
	 * searchallirec
	 * 제휴 승인 검색 리스트 (adminAllianceList)
	 */
	@RequestMapping("/searchallirec.tm")
	public ModelAndView searchallirec(String partnerComname, String pageNumber){
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum(3, 10, pageNum, 2, partnerComname);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AllianceDTO> list = dao.alsearch(partnerComname);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminAllianceRec");
		mv.addObject("allist", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
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
	public ModelAndView adminstemp(String pageNumber) {
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("parstemp", 10, pageNum, null, null);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminStempDTO> list = dao.stemp(page[1],page[2]);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminstemp");
		mv.addObject("list", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url","adminstemp.tm");
		
		return mv;
	}
	
	/**
	 * searchstemp
	 * 스탬프 검색
	 */
	@RequestMapping("/searchstemp.tm")
	public ModelAndView searchstemp(String pageNumber, String partnerName) {
		
		int pageNum = 1;
		if(pageNumber != null) pageNum = Integer.parseInt(pageNumber);
		
		int[] page = dao.SettingPageNum("parstemp", 10, pageNum, "partner_name", partnerName);
		/* 리턴값 : int 배열
		 * 0 : 총 페이지 수
		 * 1 : 시작 rownum
		 * 2 : 끝 rownum
		 */
		
		List<AdminStempDTO> list = dao.searchstemp(page[1],page[2],partnerName);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminstemp");
		mv.addObject("list", list);
		mv.addObject("totalpage", page[0]);
		mv.addObject("pageNum", pageNum);
		mv.addObject("url","searchstemp.tm");
		mv.addObject("partnerName",partnerName);
		return mv;
	}
	
	/**
	 * 스탬프 등록
	 */
	@RequestMapping("/insertstemp.tm")
	public String insertStemp(AdminStempDTO adminStempDTO) {
		dao.insertstemp(adminStempDTO);
		
		return "redirect:/tmadmin/searchstemp.tm";
	}
}