package tm.reviewlike.controller;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.reviewlike.dao.ReviewLikeDAO;
import tm.totalre.dao.TotalreDAO;
import tm.totalre.dto.TotalreDTO;


/**
 * ReviewLikeController
 * 리뷰 좋아요 누르면 된다
 * dir : 폴더경로 
 * */

@Controller
public class ReviewLikeController {
	
	@Autowired
	ReviewLikeDAO likedao;
	
	@RequestMapping("/insertLike.tm")
	@ResponseBody
	public void insertReviewLike(@RequestBody String content){
		
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) jsonParser.parse(content);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		likedao.insertReviewLike(jsonObj.get("user_id").toString(), jsonObj.get("sc_num").toString());
		
	}
}
