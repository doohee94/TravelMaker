package tm.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.member.dao.MemberDAO;
import tm.member.dto.MemberDTO;

@Controller
@RequestMapping("member/")
public class MemberController {

/**
 * index에서 member 폴더 안써도 가지게
 */
private String dir = "member/";
	
/**
 * 인자값 전달을 할수있게
 */
	
	@Autowired
	MemberDAO dao;

	@RequestMapping("/{url}.tm")
	public String member(@PathVariable String url) {
		return dir + url;
	}
	
/**
* 회원가입
*/
	
	@RequestMapping("signupOk.tm")
	public ModelAndView insert(MemberDTO memberdto){
		int res = dao.insert(memberdto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signupOk");
		mv.addObject("res", res);
		return mv;
	}
	
/**
* 아이디 중복 체크
*/
		
		/*@RequestMapping(value="/idCheck.tm")
		public @ResponseBody void idinsert(@RequestBody String id){
	    	boolean flag = true;
	    	new JoinValidator().validate(id);
		}*/
/**
* 회원정보보기
*/
	
	@RequestMapping("/memberUpdate.tm")
	public void memberupdate(){
		
	}
	
/**
* 회원정보수정
*/
	@RequestMapping("/memberModify.tm")
	public void membermodify(){
		
	}
	
/**
* 회원탈퇴
*/
	@RequestMapping("/memberDelete.tm")
	public void memberdelete(){
		
	}
	
}
