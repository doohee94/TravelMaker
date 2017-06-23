package tm.admin.controller;

import java.util.HashMap;
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
	
	/**
	 * adMemberList
	 * 관리자 멤버 리스트 출력
	 */
	@RequestMapping("/adminMember.tm")
	public ModelAndView adMemberList() {
		List<AdminMemberDTO> list =  dao.MemberList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"/adminMember");
		mv.addObject("memlist",list);
		
		return mv;
		
	}
	
	/**
	 * showMember
	 * 한 회원의 정보를 출력
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
	public @ResponseBody List<AdminMemberDTO> searchmem(@RequestParam String sel, String con) {
		
		List<AdminMemberDTO> list = dao.Membersearch(sel, con);
		
		return list;
	}
	
	/**
	 * adminqna
	 * QNA리스트를 출력
	 */
	@RequestMapping("/adminQna.tm")
	public ModelAndView adminqna(AdminQnaDTO adminQnaDTO) {
		if(adminQnaDTO.getQnaReply() != null){
			int res = dao.qnareply(adminQnaDTO);
			if(res > 0){
				adminQnaDTO.setQnaReply(null);
			}
		}
		List<AdminQnaDTO> list = dao.qnalist();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName(dir+"adminQna");
		mv.addObject("qnalist", list);
		
		return mv;
	}
	
	/**
	 * adminadlist
	 * 광고 리스트 출력
	 */
	@RequestMapping("/adminadList.tm")
	public ModelAndView adminadlist(String num) {
		if(num != null){
			int res = dao.addelete(num);
		}
		List<AdminadDTO> list = dao.adlist();
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"adminadList");
		mv.addObject("adlist", list);
		return mv;
	}
	
	/**
	 * adadsearch
	 * 광고등록에서 검색한 제휴회사 리스트를 출력
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
}