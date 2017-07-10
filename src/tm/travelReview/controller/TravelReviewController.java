package tm.travelReview.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.totalre.dao.TotalreDAO;
import tm.totalre.dto.TotalreDTO;
import tm.totalre.dto.reviewReplyDTO;


/**
 * TravelReviewController
 * 여행리뷰리스트, 상세페이지
 * dir : 폴더경로 
 * */

@Controller
@RequestMapping("/travelReview")
public class TravelReviewController {

	@Autowired
	private MongoTemplate mongoTemplate;

	private String dir = "travelReview/";

	@RequestMapping("/{url}.tm")
	public String checklist(@PathVariable String url){
		return dir + url;

	}

	@Autowired
	TotalreDAO dao;

	//리뷰 리스트 뿌려주기
	@RequestMapping("/reviewlist.tm")
	public ModelAndView reviewList(String searchContent){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName(dir+"reviewlist");
		
		//검색결과 리스트 뿌려주기
		ArrayList<TotalreDTO> list = dao.reviewList(searchContent);
		mv.addObject("list",list);
		
		//해시태그 가져오기
		ArrayList<ArrayList> tagList = new ArrayList<ArrayList>();
		for(int i=0; i<list.size(); i++){
			String scNum = list.get(i).getScNum();
			ArrayList temp = dao.tagList(scNum);
			tagList.add(temp);
		}
		mv.addObject("tagList",tagList);
		
		return mv;
	}



	@RequestMapping(value="/reviewDetail.tm")
	public ModelAndView showReviewDetail(@RequestParam("_id") String _id, HttpSession session){

		ModelAndView mv = new ModelAndView();

		String user_id = "";
		int reviewlike = 0;
		if(session.getAttribute("userId") != null){
			user_id = session.getAttribute("userId").toString();
			//이미 좋아요를 누른건지 아닌지 확인
			reviewlike = dao.checkLike(user_id,_id);
		}

		//System.out.println(user_id);
		mv.addObject("result",reviewlike);

		mv.setViewName(dir + "reviewDetail");

		//오라클디비에서 리뷰가져오기
		TotalreDTO dto = dao.showReview(_id);

		//리뷰에대한 댓글 가져오기
		ArrayList replyList = dao.showReply(_id);

		
		//가져온 정보들 ModelandView에 보내기
		mv.addObject("replyList",replyList);

		mv.addObject("_id",_id);
		mv.addObject("user_id", user_id);

		mv.addObject("totalreDTO", dto);



		//몽고디비에서 일정 불러오기
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(_id);
		Query query = new Query(criteria);

		//tour정보를 arraylist로 받아온다
		ArrayList<String> tourlist = (ArrayList<String>)mongoTemplate.find(query,String.class,"schedule");

		JSONObject jsonobj = null;
		try {
			//디비에서 가져온 String을 JSON으로 파싱 후 배열에 저장 
			JSONParser jsonParser = new JSONParser();
			jsonobj =  (JSONObject)jsonParser.parse(tourlist.get(0));

			//받아온 schedule정보에서 tour배열을 가져온다
			JSONArray tourarray = (JSONArray)jsonobj.get("tour");
			mv.addObject("obj", tourarray);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mv;
	}


	//리뷰 디비에 등록하기
	@RequestMapping("/insertReview.tm")
	public String insertReview(TotalreDTO totalreDTO){
		
		String _id = totalreDTO.getScNum();

		//리뷰 등록
		int result = dao.insertReview(totalreDTO);
		
		//해시태그 등록
		StringTokenizer st = new StringTokenizer(totalreDTO.getHashtag(),",");
		for(int i=0; st.hasMoreTokens(); i++){
			dao.insertHashtag(st.nextToken(),_id);
		}

		return "redirect:/travelReview/reviewlist.tm";

	}

	//리뷰등록페이지로 이동
	@RequestMapping("/registReview.tm")
	public ModelAndView registReview( @RequestParam("_id") String _id, HttpSession session){

		String userId = session.getAttribute("userId").toString();
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir+"registReview");
		mv.addObject("_id", _id);
		mv.addObject("userId",userId);
		return mv;
	}

	//리뷰에 대한 댓글달기
	@RequestMapping("/insertReply.tm")
	public String insertReply(reviewReplyDTO reviewReplyDTO){

		if(!(reviewReplyDTO.getUserId().equals(""))){

			String curDate = new java.text.SimpleDateFormat("yy-MM-dd").format(new java.util.Date());
			System.out.println("현재날짜"+curDate);
			reviewReplyDTO.setWriteDate(curDate);
			int result = dao.insertReply(reviewReplyDTO);
		}

		return "redirect:/travelReview/reviewDetail.tm?_id="+reviewReplyDTO.getScNum();
	}

}
