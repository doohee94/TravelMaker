package tm.recommandtravelregion.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.recommandtravelregion.dao.RecommandTravelRegionDAO;

@Controller
@RequestMapping("/recommandtravelregion")
public class RecommandTravelRegionController {

	@Autowired
	private MongoTemplate mongoTemplate;

	/**
	 * index에서 recommandtravelregion 폴더 안써도 가지게
	 */
	private String dir = "recommandtravelregion/";

	/**
	 * 인자값 전달이 필요없는 부분 담당
	 */

	@RequestMapping("/{url}.tm")
	public String recommandTravelRegion(@PathVariable String url){

		return dir + url;
	}

	@RequestMapping("/recommandTravelRegion")
	public ModelAndView recommandTravel(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(dir + "recommandTravelRegion");
		
		
		//tour정보를 arraylist로 받아온다
		ArrayList<String> tourlist =  new ArrayList<String>();
		tourlist = (ArrayList<String>)mongoTemplate.findAll(String.class,"schedule");

		if(tourlist.size() != 0){

			ArrayList<JSONObject> schedule = new ArrayList<JSONObject>();
			ArrayList<JSONArray> tour = new ArrayList<JSONArray>();

			JSONObject jsonobj = null;
			try {
				//디비에서 가져온 String을 JSON으로 파싱 후 배열에 저장 
				JSONParser jsonParser = new JSONParser();

				for(int i=0; i<tourlist.size(); i++){
					//schedule을 JSONObject로 파싱해서 schedule배열에 저장
					jsonobj =  (JSONObject)jsonParser.parse(tourlist.get(i));
					schedule.add(jsonobj);

					//schedule에서 tour배열을 JSONArray로 파싱해서 저장
					if(schedule.get(i).get("tour") != null){
						JSONArray tourTemp = (JSONArray)schedule.get(i).get("tour");
						tour.add(tourTemp);
					}
					//System.out.println(tour.get(i).toString());
				}

				//tour배열 각각을 JSONObject로 변환
				ArrayList<JSONObject> placeTemp = new ArrayList<JSONObject>();
				for(int i=0; i<tour.size(); i++){
					for(int j=0; j<tour.get(i).size(); j++){
						placeTemp.add((JSONObject)tour.get(i).get(j));
					}
				}

				//위에서 변환한 JSONObject 중에서 place 배열을 뽑아냄
				ArrayList<JSONArray> placeTemp2 = new ArrayList<JSONArray>();
				ArrayList<JSONObject> placeTemp3 = new ArrayList<JSONObject>();
				for(int i=0; i<placeTemp.size(); i++){
					//System.out.println( placeTemp.get(i).toString());
					if(placeTemp.get(i).get("place") != null){
						placeTemp2.add((JSONArray)placeTemp.get(i).get("place"));
					}	
				}
				for(int i=0; i<placeTemp2.size(); i++){
					//System.out.println(placeTemp2.get(i).toString());
					//place배열을 JSONObject로 변환해서 placeTemp3배열에 저장
					for(int j=0; j<placeTemp2.get(i).size(); j++){
						placeTemp3.add((JSONObject)placeTemp2.get(i).get(j));
					}
				}

				//placeTemp3배열에서 각각의 정보를 저장할 ArrayList선언
				ArrayList<String> title = new ArrayList<String>();	
				ArrayList<String> image = new ArrayList<String>();
				ArrayList<String> addr = new ArrayList<String>();
				ArrayList<String> contentid = new ArrayList<String>();
				//받아온 타이틀을 중복제거 위해 HashSet선언
				Set<String> titleSet = new LinkedHashSet<String>();
				Set<String> imageSet = new LinkedHashSet<String>();
				Set<String> addrSet = new LinkedHashSet<String>();
				Set<String> contentidSet = new LinkedHashSet<String>();
				
				
				
				//LinkedHashSet에 불러온 리스트들 저장해서 중복제거(순서도 보장)
				for(int i=0; i<placeTemp3.size(); i++){
					if(placeTemp3.get(i).get("contentid").toString().equals("00000")) continue;
					title.add(placeTemp3.get(i).get("title").toString());
					image.add(placeTemp3.get(i).get("image").toString());
					addr.add(placeTemp3.get(i).get("addr").toString());
					contentid.add(placeTemp3.get(i).get("contentid").toString());
					//System.out.println(title.get(i));
					titleSet.add(title.get(i));
					imageSet.add(image.get(i));
					addrSet.add(addr.get(i));
					contentidSet.add(contentid.get(i));
				}

				//ArrayList에 LinkedHashSet저장
				ArrayList<String> titleTemp = new ArrayList<String>(titleSet);
				ArrayList<String> imageTemp = new ArrayList<String>(imageSet);
				ArrayList<String> addrTemp = new ArrayList<String>(addrSet);
				ArrayList<String> contentidTemp = new ArrayList<String>(contentidSet);
				int[] result = new int[titleTemp.size()];
				for(int i=0; i<result.length; i++){
					result[i] = 0;
				}
				
				
				for(int i=0; i<title.size(); i++){
					for(int j=0; j<titleTemp.size(); j++){
						if(title.get(i).toString().equals(titleTemp.get(j).toString())){
							result[j] = result[j]+1;
						}
					}
				}
				
				int first=0, second=0, third=0;
				String[] top3Title = new String[3];
				String[] top3Image = new String[3];
				String[] top3Addr = new String[3];
				String[] top3Contentid = new String[3];
				int[] temp = new int[3];
				
//				for(int i=0; i<titleTemp.size(); i++){
//					System.out.print(titleTemp.get(i)+"///");
//					System.out.println();
//					System.out.println(result[i]+"!!!!!");
//					System.out.println();
//				}
				
				for(int i=0; i<result.length; i++){
					if(first <= result[i]){
						first = result[i];
						temp[0] = i;
					}
				}
				for(int i=0; i<result.length; i++){
					if(i == temp[0]) continue;
					if(second <= result[i]){
						second = result[i];
						temp[1]=i;
					}
				}
				for(int i=0; i<result.length; i++){
					if(i == temp[0]) continue;
					if(i == temp[1]) continue;
					if(third <= result[i] ){
						third = result[i];
						temp[2]=i;
					}
				}
			
				for(int i=0; i<top3Title.length; i++){
					top3Title[i] = titleTemp.get(temp[i]);
					top3Image[i] = imageTemp.get(temp[i]);
					top3Addr[i] = addrTemp.get(temp[i]);
					top3Contentid[i] = contentidTemp.get(temp[i]);
					System.out.println("도전일정 top3길이"+top3Title.length);
					
					System.out.println(i+"*********"+top3Title[i]);
				}
				
				HashMap finalSet = new HashMap();
				finalSet.put("top3Title", top3Title);
				finalSet.put("titleTemp", titleTemp);
				
				finalSet.put("top3Image", top3Image);
				finalSet.put("imageTemp", imageTemp);
				
				finalSet.put("top3Addr", top3Addr);
				finalSet.put("addrTemp", addrTemp);
				
				finalSet.put("top3Contentid", top3Contentid);
				finalSet.put("contentidTemp", contentidTemp);
				
				mv.addObject("finalSet",finalSet);
				

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}//end if
			
		return mv;
	}
	
	@Autowired
	RecommandTravelRegionDAO dao;
	
	@RequestMapping("/likeList.tm")
	@ResponseBody
	public String likeList(HttpSession session){
		
		//세션이 null일 경우 로그인을 하면 여기를 볼수 잇다고 해놓고
		String data = "";
		//세션이 있을 경우 아이디에 있는 관심지역 불러서 시부분만 보내버리깅ㅎ
		
		if(session.getAttribute("userId") == null){
			data = "None";
		}else{
			String userId = session.getAttribute("userId").toString();
			data = dao.searchLikeSpot(userId);
		}
		System.out.println("관심지역>>>"+data);
		return data;
	}
	
	@RequestMapping("/find.tm")
	public ModelAndView content(String contentid, HttpSession session){
		ModelAndView mv = new ModelAndView();
		mv.addObject("contentid", contentid);
		mv.setViewName(dir +"recommandFind");
		String userId = session.getAttribute("userId").toString();
		
		
		System.out.println(userId);
		if(userId != null){
			String result = dao.likeSpotList(userId, contentid);
			System.out.println("결과값"+result);
			if(result != null){
				mv.addObject("result", 1);
			}else if(result == null || result == ""){
				mv.addObject("result", 0);
			}
		}else{
			mv.addObject("result", 0);
			
		}
		
		return mv;
	}
	
	@RequestMapping("/plusLikeBtn.tm")
	@ResponseBody
	public void plusLikeBtn(@RequestBody String userid){

		//아이디 파싱------------------------------------
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(userid);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String userId = obj.get("user_id").toString();
		String contentid = obj.get("contentid").toString();
		
		
		dao.plusLikeBtn(userId, contentid);
		
	}
	
	@RequestMapping("/minusLikeBtn.tm")
	@ResponseBody
	public void minusLikeBtn(@RequestBody String userid){
		
		//아이디 파싱------------------------------------
				JSONParser parser = new JSONParser();
				JSONObject obj = null;
				try {
					obj = (JSONObject)parser.parse(userid);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String userId = obj.get("user_id").toString();
				String contentid = obj.get("contentid").toString();
				
				dao.minusLikeBtn(userId, contentid);
		//ReviewLikeController  deleteLike.tm 참고
	}
}
