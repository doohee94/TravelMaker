package tm.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@Autowired
	protected JavaMailSender mailSender;



	@RequestMapping("/{url}.tm")
	public String member(@PathVariable String url) {
		return dir + url;
	}
	
/**
* 회원가입
*/
	@RequestMapping("/signupOk.tm")
	public ModelAndView insert(MemberDTO memberdto){
		memberdto.setUserAddr(memberdto.getUserCity()+ memberdto.getUserBorough());
		int res = dao.insert(memberdto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"signupOk");
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
	@RequestMapping("memberUpdate.tm")
	public void update(MemberDTO memberdto){
		System.out.println("나오니");
		MemberDTO redto = dao.update(memberdto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"update");
		mv.addObject("memberdto", redto);
	}
	
/**
* 회원수정
*/
	/*@RequestMapping(value="/memberUpdate.tm")
	public String modify(@ModelAttribute MemberDTO memberdto){
		dao.modify(memberdto);
		return "memberUpdate.tm";
	}*/
	
	
/**
* 회원탈퇴
*/
	@RequestMapping("/memberDelete.tm")
	public ModelAndView delete(MemberDTO memberdto){
		int res = dao.delete(memberdto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"delete");
		mv.addObject("res", res);
		return mv;
	}
	
/**
* ID 찾기
*/
	
	@RequestMapping("/serchIdOkForm.tm")
	public ModelAndView searchID(String userName, String userEmail) {
		MemberDTO resultdto = dao.searchId(userName,userEmail);
		if(resultdto == null){
			resultdto =  new MemberDTO();
			resultdto.setUserId("결과가 없습니다");
		}
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName(dir+"serchIdOkForm");
		mv.addObject("dto", resultdto);
		
		return mv;
	}
/**
* PW 찾기
*/
	@RequestMapping("/serchPwOkForm.tm")
	public String mail(String userId, String userEmail) {
		MemberDTO resultdto = dao.searchPw(userId, userEmail);
		if(resultdto != null){
			MimeMessage msg = mailSender.createMimeMessage();
	        String e_mail=userEmail;
	        String content = "비밀번호는 ["+resultdto.getUserPw()+"] 입니다.";
	       	String title = userId+"님 비밀번호 찾기 메일입니다.";
	       	
	        try {
	        	//메일 제목
	        	msg.setSubject(title);
	        	//메일 내용
				msg.setText(content);
				//보내는 메일
				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(e_mail));
				
			} catch (MessagingException e) {
				System.out.println("이메일 작성 실패 : " + e.getMessage());
			}
	        //메일 전송
	        try {
	        	mailSender.send(msg);
	        }catch(Exception e){
	        	System.out.println("전송 실패 : " + e.getMessage());
	        }
	        return dir + "serchPwOkForm";
		}else{
			return "redirect:/member/serchPwOkForm.tm";
		}
	}
	
	
}
