package tm.member.controller;

import java.util.List;
import java.util.StringTokenizer;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.member.dao.MemberDAO;
import tm.member.dto.LikelocDTO;
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
	
	@RequestMapping("/loginForm.tm")
	public ModelAndView login(String state){
		ModelAndView mv = new ModelAndView();
		mv.addObject("state",state);
		mv.setViewName(dir + "loginForm");
		return mv;
	}
	
/**
* 회원가입
*/
	@RequestMapping(value="/signupOk.tm")
	public String insert(MemberDTO memberdto){
		memberdto.setUserAddr(memberdto.getUserCity()+ memberdto.getUserBorough());
	    int res = dao.insert(memberdto);
	    
	    if(res > 0){
	    	memberdto.setUserAddr(memberdto.getUserCity()+ memberdto.getUserBorough());
			if(memberdto.getSelOneCity() != null && !(memberdto.getSelOneCity().equals("시,도"))){
				LikelocDTO onedto = new LikelocDTO();
				onedto.setUserId(memberdto.getUserId());
				if(memberdto.getSelOneBorough()!=null && !(memberdto.getSelOneBorough().equals("default"))){
					if(memberdto.getSelOneCity().contains("특별시")){
						onedto.setLikelocName("서울");
					}else if(memberdto.getSelOneCity().contains("광역시")){
						onedto.setLikelocName(memberdto.getSelOneCity().replace("광역시", ""));
					}else if(memberdto.getSelOneBorough().contains("시") || memberdto.getSelOneBorough().contains("군")){
						onedto.setLikelocName(
								memberdto.getSelOneBorough().substring(
										0, memberdto.getSelOneBorough().length()-1));
					}else if(memberdto.getSelOneCity().contains("특별자치")){
						onedto.setLikelocName(
								memberdto.getSelOneBorough().substring(
										0, memberdto.getSelOneBorough().length()-1));
					}
				}
				if(onedto.getLikelocName() != null){
					dao.insertLoc(onedto);
				}
			}
			
			
			if(memberdto.getSelTwoCity() != null && !(memberdto.getSelTwoCity().equals("시,도"))){
				LikelocDTO twodto = new LikelocDTO();
				twodto.setUserId(memberdto.getUserId());
				if(memberdto.getSelTwoBorough()!=null && !(memberdto.getSelTwoBorough().equals("default"))){
					if(memberdto.getSelTwoCity().contains("특별시")){
						twodto.setLikelocName("서울");
					}else if(memberdto.getSelTwoCity().contains("광역시")){
						twodto.setLikelocName(memberdto.getSelTwoCity().replace("광역시", ""));
					}else if(memberdto.getSelTwoBorough().contains("시") || memberdto.getSelTwoBorough().contains("군")){
						twodto.setLikelocName(
								memberdto.getSelTwoBorough().substring(
										0, memberdto.getSelTwoBorough().length()-1));
					}else if(memberdto.getSelTwoCity().contains("특별자치")){
						twodto.setLikelocName(
								memberdto.getSelTwoBorough().substring(
										0, memberdto.getSelTwoBorough().length()-1));
					}
				}
				if(twodto.getLikelocName() != null){
					dao.insertLoc(twodto);
				}
			}
			
			
			if(memberdto.getSelThrCity() != null && !(memberdto.getSelThrCity().equals("시,도"))){
				LikelocDTO thrdto = new LikelocDTO();
				thrdto.setUserId(memberdto.getUserId());
				if(memberdto.getSelThrBorough()!=null && !(memberdto.getSelThrBorough().equals("default"))){
					if(memberdto.getSelThrCity().contains("특별시")){
						thrdto.setLikelocName("서울");
					}else if(memberdto.getSelThrCity().contains("광역시")){
						thrdto.setLikelocName(memberdto.getSelThrCity().replace("광역시", ""));
					}else if(memberdto.getSelThrBorough().contains("시") || memberdto.getSelThrBorough().contains("군")){
						thrdto.setLikelocName(
								memberdto.getSelThrBorough().substring(
										0, memberdto.getSelThrBorough().length()-1));
					}else if(memberdto.getSelThrCity().contains("특별자치")){
						thrdto.setLikelocName(
								memberdto.getSelThrBorough().substring(
										0, memberdto.getSelThrBorough().length()-1));
					}
				}
				if(thrdto.getLikelocName() != null){
					dao.insertLoc(thrdto);
				}
			}
		}
		
		return "redirect:/member/loginForm.tm";
	}
	
/**
* 아이디 중복 체크
*/
	@RequestMapping(value = "/idCheck.tm")
	public @ResponseBody String idinsert(String userId) {
		int res = dao.idcheck(userId);
		String result = "";
		if(res > 0){
			result = "NO";
		}else{
			result = "YES";
		}
		return result;
	}
	
/**
 * 	이메일 체크
 */
	@RequestMapping(value = "/emailCheck.tm")
	public @ResponseBody String emailinsert(String userEmail) {
		int res = dao.emailcheck(userEmail);
		String result = "";
		if(res > 0){
			result = "NO";
		}else{
			result = "YES";
		}
		return result;
	}
	
/**
* 회원정보보기
*/
	@RequestMapping(value="/memberUpdate.tm")
	public ModelAndView update(HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		String id = (String)session.getAttribute("userId");
		if(id == null ){
			mv.setViewName("");
			return mv;
		}
		MemberDTO pdto = new MemberDTO();
		pdto.setUserId(id);
		MemberDTO dto = dao.update(pdto);
		
		List<LikelocDTO> list = dao.likeloclist(id);
		
		int count = 1; 
		if(list != null){
			for (LikelocDTO l : list) {
				switch (count) {
				case 1: dto.setSelOneCity(l.getLikelocName()); count++; break;
				case 2: dto.setSelTwoCity(l.getLikelocName()); count++; break;
				case 3: dto.setSelThrCity(l.getLikelocName()); count++; break;
				default:
					break;
				}
			}
		}
		
		
		StringTokenizer st = new StringTokenizer(dto.getUserAddr(), " ");
		int cnt = 0;
		while (st.hasMoreTokens()) {
			String temp = st.nextToken();
			if(cnt == 0){
				dto.setUserCity(temp);
				cnt++;
			}else if(cnt == 1){
				dto.setUserBorough(temp);
				cnt++;
			}
		}
		
		mv.addObject("dto", dto);
		mv.addObject("list", list);
		mv.setViewName(dir+"memberUpdate");
		return mv;
	}
	
	
	
/**
* 회원수정
*/
	@RequestMapping("/membermodify.tm")
	public String modify(HttpSession session, MemberDTO memberdto){
		memberdto.setUserAddr(memberdto.getUserCity()+ memberdto.getUserBorough());
		String id = (String)session.getAttribute("userId");
		memberdto.setUserId(id);
		dao.modify(memberdto);
		return "redirect:/member/memberUpdate.tm";
	}
	
/**
* 관심여행지 수정
*/
	@RequestMapping("/likeloc.tm")
	public String likeloc(HttpSession session, MemberDTO memberdto, String OneCity, String TwoCity, String ThrCity){
		String id = (String)session.getAttribute("userId");
		
		if(memberdto.getSelOneCity() != null && !(memberdto.getSelOneCity().equals("시,도"))){
			LikelocDTO onedto = new LikelocDTO();
			onedto.setUserId(id);
			if(memberdto.getSelOneBorough()!=null && !(memberdto.getSelOneBorough().equals("default"))){
				if(memberdto.getSelOneCity().contains("특별시")){
					onedto.setLikelocName("서울");
				}else if(memberdto.getSelOneCity().contains("광역시")){
					onedto.setLikelocName(memberdto.getSelOneCity().replace("광역시", ""));
				}else if(memberdto.getSelOneBorough().contains("시") || memberdto.getSelOneBorough().contains("군")){
					onedto.setLikelocName(
							memberdto.getSelOneBorough().substring(
									0, memberdto.getSelOneBorough().length()-1));
				}else if(memberdto.getSelOneCity().contains("특별자치")){
					onedto.setLikelocName(
							memberdto.getSelOneBorough().substring(
									0, memberdto.getSelOneBorough().length()-1));
				}
			}
			if(onedto.getLikelocName() != null){
				if(OneCity != null){
					onedto.setLikelocNum(OneCity);
					dao.likelocmodify(onedto);
				}else{
					dao.insertLoc(onedto);
				}
			}
		}
		
		
		
		if(memberdto.getSelTwoCity() != null && !(memberdto.getSelTwoCity().equals("시,도"))){
			LikelocDTO twodto = new LikelocDTO();
			twodto.setUserId(id);
			if(memberdto.getSelTwoBorough()!=null && !(memberdto.getSelTwoBorough().equals("default"))){
				if(memberdto.getSelTwoCity().contains("특별시")){
					twodto.setLikelocName("서울");
				}else if(memberdto.getSelTwoCity().contains("광역시")){
					twodto.setLikelocName(memberdto.getSelTwoCity().replace("광역시", ""));
				}else if(memberdto.getSelTwoBorough().contains("시") || memberdto.getSelTwoBorough().contains("군")){
					twodto.setLikelocName(
							memberdto.getSelTwoBorough().substring(
									0, memberdto.getSelTwoBorough().length()-1));
				}else if(memberdto.getSelTwoCity().contains("특별자치")){
					twodto.setLikelocName(
							memberdto.getSelTwoBorough().substring(
									0, memberdto.getSelTwoBorough().length()-1));
				}
			}
			if(twodto.getLikelocName() != null){
				if(TwoCity != null){
					twodto.setLikelocNum(TwoCity);
					dao.likelocmodify(twodto);
				}else{
					dao.insertLoc(twodto);
				}
			}
		}
		
		
		if(memberdto.getSelThrCity() != null && !(memberdto.getSelThrCity().equals("시,도"))){
			LikelocDTO thrdto = new LikelocDTO();
			thrdto.setUserId(id);
			if(memberdto.getSelThrBorough()!=null && !(memberdto.getSelThrBorough().equals("default"))){
				if(memberdto.getSelThrCity().contains("특별시")){
					thrdto.setLikelocName("서울");
				}else if(memberdto.getSelThrCity().contains("광역시")){
					thrdto.setLikelocName(memberdto.getSelThrCity().replace("광역시", ""));
				}else if(memberdto.getSelThrBorough().contains("시") || memberdto.getSelThrBorough().contains("군")){
					thrdto.setLikelocName(
							memberdto.getSelThrBorough().substring(
									0, memberdto.getSelThrBorough().length()-1));
				}else if(memberdto.getSelThrCity().contains("특별자치")){
					thrdto.setLikelocName(
							memberdto.getSelThrBorough().substring(
									0, memberdto.getSelThrBorough().length()-1));
				}
			}
			if(thrdto.getLikelocName() != null){
				if(ThrCity != null){
					thrdto.setLikelocNum(ThrCity);
					dao.likelocmodify(thrdto);
				}else{
					dao.insertLoc(thrdto);
				}
			}
		}
		
		return "redirect:/member/memberUpdate.tm";
	}
	
/**
* 회원탈퇴
*/
	@RequestMapping(value="/memberOut.tm")
	public String delete(HttpSession session, MemberDTO memberdto){
		String id = (String)session.getAttribute("userId");
		memberdto.setUserId(id);
		int res = dao.delete(memberdto);
		if(res > 0){
			session.removeAttribute("userId");
			session.removeAttribute("userNick");
		}
		return "redirect:/tmmain/main.tm";
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
