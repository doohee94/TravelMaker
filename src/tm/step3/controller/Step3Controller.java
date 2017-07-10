package tm.step3.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.bson.Document;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.step1.dto.StepDTO;
import tm.step3.dao.Step3DAO;

/**
 * Step3Controller
 * 여행 일정짜기 스텝3. 전체 저장 및 몽고디비 사용
 * dir : 폴더경로 
 * */
@Controller
@RequestMapping("/step")
public class Step3Controller {
   @Autowired
   private MongoTemplate mongoTemplate;
   
	private String dir = "step3/";
   
   @RequestMapping("/{url}.tm")
   public String step3(@PathVariable String url){
      return dir + url;
      
   }
    
   /**
    * step3로 가는 리퀘스트. _id가 있으면 해당 아이디로 불러오기 아니면 아이디 생성 
    * 
    * */
   @RequestMapping("/step3.tm")
   public ModelAndView step3_id(String _id, HttpSession session){
	   ModelAndView mv = new ModelAndView();
	 
	   if(_id != null){
		   mv.addObject("_id", _id);	   
	   }else{ 
		   mv.addObject("_id", "2");
		   
	   }
	   
	   mv.setViewName(dir+"/step3");
	  
	   return mv;
   }
   
   /**
    * 일정을 새로 생성할 경우 step 1, 2에서 세션으로 넘어온 데이터들을 같이 넘겨주는 작업
    * 리턴타입 - JSONObject로 변환한 dto
    * 
    * */
   @RequestMapping("/findSession.tm")
   @ResponseBody
   public JSONObject findSession(HttpSession session){
	 //날짜계산해서 보내주고 일정 하나씩 해서 보내주고 시작날짜 종료날짜 다 보내주고 제목보내주고 동행.. 자.. 보내주..고.. 
	   String userId = (String)session.getAttribute("userId");
	   StepDTO dto = (StepDTO) session.getAttribute(userId+"dto");   
	   JSONObject goData = new JSONObject(); 
	   
	   
	   //날짜 계산 and dayNum--------------------
	   String sDateStr = dto.getStartDate();
	   String eDateStr = dto.getEndDate();
	   
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   Date sDate = null;
	   Date eDate = null;
		try {
			sDate = format.parse(sDateStr);
			eDate = format.parse(eDateStr);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
	   long diff = eDate.getTime() - sDate.getTime();
	   int day = (int)diff/(24*60*60*1000)+1;
	   
	   
	   goData.put("sDate", sDateStr);
	   goData.put("eDate", eDateStr);
	   goData.put("dayNum", day);
	   
	   
	   //도시 리스트 ----------------------------------------------
	   JSONArray  cityList = new JSONArray();
	   for(int i=0; i<dto.getSchedule().size(); i++){
		   cityList.add(dto.getSchedule().get(i));
	   }
	   goData.put("cityList", cityList);
	   
	   //제목---------------------------
	   goData.put("title", dto.getTitle());
	   
	   //친구목록----------------------------------------------------
	   JSONArray friendList = new JSONArray();
	   for(int i=0; i<dto.getParty().size(); i++){
		   friendList.add(dto.getParty().get(i));
	   }
	   goData.put("friendList", friendList);
   
	   return goData;
   }
   
   
   /**
    * findList
    * 스케쥴 아이디에 해당하는 정보를 불러와서 넘겨준다
    * 파라메터 findList -> _id값을 넘겨준다.
    * 리턴값 _id에 해당하는 mongodb 값
    * */
   @RequestMapping("/findList.tm")
   @ResponseBody
   public JSONObject findList(@RequestBody String findList){
	   JSONParser parser = new JSONParser();
	   JSONObject _idObj = null;
	   String _id = null;
	   JSONObject listObj = null;
	   try {
		 
		   _idObj = (JSONObject)parser.parse(findList);
		   _id = _idObj.get("_id").toString();
		   listObj = (JSONObject)mongoTemplate.findById(_id, JSONObject.class,"schedule");
	   	} catch (ParseException e) {
		e.printStackTrace();
	}
	      
	   return listObj;
   }
   
   
   /**
    * 
    * distanceCal
    * step3.jsp 파일을 myList 리스트에 있는 값들을 받아서 경로 최적화 알고리즘 적용
    * 파라메터 step3.jsp 파일을 myList 리스트에 있는 값들
    * 리턴값 리스트들을 경로 최적화 후 JSONObject로 리턴
    * */
   @RequestMapping("/distanceCal.tm")
   @ResponseBody
   public JSONObject distanceCal(@RequestBody String listInfo){
      
      JSONObject responseList  = new JSONObject();
      
      try {
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObj = (JSONObject) jsonParser.parse(listInfo); //myList의 리스트 
        
         
         //리스트들 값 파싱
         JSONArray title = (JSONArray)jsonObj.get("title");
         JSONArray addr = (JSONArray)jsonObj.get("addr");
         JSONArray image = (JSONArray)jsonObj.get("image");
         JSONArray mapx = (JSONArray)jsonObj.get("mapx");
         JSONArray mapy = (JSONArray)jsonObj.get("mapy");
         JSONArray contentid = (JSONArray)jsonObj.get("contentid");
         
         //파싱한 데이터의 값만큼 배열 잡아주기
         String []titleArr = new String[title.size()];
         String []addrArr = new String[addr.size()];
         String []imageArr = new String[image.size()];
         String []mapxArr = new String[mapx.size()];
         String []mapyArr = new String[mapy.size()];
         String []contentidArr = new String[contentid.size()];
         
         //x,y좌표를 이용해 두 점사이의 거리를 구하여 2차원 배열에 저장
         double distance[][] = range((JSONArray)jsonObj.get("mapx") , (JSONArray)jsonObj.get("mapy"));
         
         //배열 0번째에 각 출발점에 해당하는 값 넣어주기
         int routeIndex=0;
         titleArr[routeIndex] = title.get(routeIndex).toString();
         addrArr[routeIndex] = addr.get(routeIndex).toString();
         imageArr[routeIndex] = image.get(routeIndex).toString();
         mapxArr[routeIndex] = mapx.get(routeIndex).toString();
         mapyArr[routeIndex] = mapy.get(routeIndex).toString();
         contentidArr[routeIndex] = contentid.get(routeIndex).toString();
        //임시 저장 리스트 
        ArrayList<Integer> temp = new ArrayList<Integer>();
        //현재 인덱스
        int curIndex=0;
     
      temp.add(curIndex);
      
      int rowindex=0;
      
      //경로 최적화
      for(int k=1; k<title.size(); k++){

         double min = 1000; //거리의 최소값을 잡아주기 위해 처음 최소값을 1000으로 저장. 대한민국 거리상 1000이상은 없음.

         END:
        	for(int i=1; i<title.size(); i++){
        	//rowindex 지점 -> i번째 지점일시 자기 자신에게 가는 길이므로 0. 넘어감
            if(distance[rowindex][i] == 0){
               continue;
            }
            //
            for(int j=0; j<temp.size(); j++){
             
               if(i == temp.get(j)){
                  continue END;
               }
            }//end J
            
            if(distance[rowindex][i] < min){
               min = distance[rowindex][i]; 
               
               curIndex=i;
            }
         }//end I
         rowindex = curIndex;
         temp.add(rowindex);
         routeIndex++;
         
         titleArr[routeIndex] = title.get(rowindex).toString();
         addrArr[routeIndex] = addr.get(rowindex).toString();
         imageArr[routeIndex] = image.get(rowindex).toString();
         mapxArr[routeIndex] = mapx.get(rowindex).toString();
         mapyArr[routeIndex] = mapy.get(rowindex).toString();
         contentidArr[routeIndex] = contentid.get(routeIndex).toString();
      }//end K
      
     
   
      
      responseList.put("title", titleArr);
      responseList.put("addr", addrArr);
      responseList.put("image", imageArr);
      responseList.put("mapx", mapxArr);
      responseList.put("mapy", mapyArr);
      responseList.put("contentid", contentidArr);
      
      
      } catch (ParseException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return responseList;
   }
   
   /**
    * listSave
    * step3에서 저장버튼->저장을 눌렀을 때 상태
    * paramter : list ajax로 받은 타이틀 등의  json 형식
    * 리턴값 : 성공일 경우에 바로 마이페이지로 갈 수있도록..!
    * */
   @RequestMapping("/listSave.tm")
   @ResponseBody
   public String listSave(@RequestBody String list){

	   try{
		   Document doc = Document.parse(list);
	   
		   mongoTemplate.save(doc,"schedule");
		   
	   }catch(Exception ex){
		   ex.printStackTrace();
	   }
	   
	   return "성공!@@@";
   }
   
   
   
   /**
       * range
       * 두 좌표간 거리 계산
       * 인자값 : x1,y1 과 x2,y2 좌표 2개
       * 결과값 : res (거리 : 단위 km)
       */
      public double[][] range(JSONArray mapx, JSONArray mapy) {
         
         double x1=0.0, y1=0.0, x2=0.0, y2=0.0;
         
        double[][] leng = new double[mapx.size()][mapx.size()];
         
         for(int i=0; i<mapx.size(); i++){
            for(int j=0; j<mapx.size(); j++){
               if(i == j){
                  leng[i][j] = 0.0;
               }
               else{
                  x1= Double.parseDouble(mapx.get(i).toString());
                  x2= Double.parseDouble(mapx.get(j).toString());
                  y1= Double.parseDouble(mapy.get(i).toString());
                  y2= Double.parseDouble(mapy.get(j).toString());
                  
                  double res = 0;
                     res = Math.acos(Math.cos(Math.toRadians(90 - x1)) * Math.cos(Math.toRadians(90 - x2))
                           + Math.sin(Math.toRadians(90 - x1)) * Math.sin(Math.toRadians(90 - x2))
                                 * Math.cos(Math.toRadians(y1 - y2)))
                           * 6371;
                     
                 leng[i][j] = res;
               }
               
              
            }
         
         }
         return leng;
      }
           
      
      @Autowired
  	Step3DAO dao;
      /**
       * searchFriend
       * step3 친구추가 ajax 오라클에서 친구를 검색 한 후 친구가 있는지 없는지 리턴
       * paramter :  ajax로 받은 친구 아이디값
       * 리턴값 : 있으면 친구 아이디 리턴.. 없으면 "0" 리턴
       * */
      @RequestMapping("/searchFriend.tm")
      @ResponseBody
      public String searchFriend(@RequestBody String friendId){
    	  String id = "0";
    	 
    	  JSONParser parser = new JSONParser();
    	  JSONObject data = null;
		try {
			data = (JSONObject)parser.parse(friendId);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	  
		  String goId = data.get("id").toString();
    	  String userId = dao.searchUser(goId);
    	  if(userId != null){
    		  id=userId;
    	  }
    	    
    	  return id;
      }
      
      
      /**
       *addFriendMongo
       *친구 추가시 해당되는 친구 ID에 해당하는 shcedule디비 생성
       * 파라메터 : 생성시 필요한 디비값들 _id, title 등
       * 리턴값 : 없음
       * */
      @RequestMapping("/addFriendMongo.tm")
      @ResponseBody
      public String addFriendMongo(@RequestBody String addFriend){
    	
    	  String data = "";
    	  
    	 //파라메터 파싱  
    	 JSONParser parser = new JSONParser();
    	 JSONObject friendObj = null;
		try {
			friendObj = (JSONObject)parser.parse(addFriend);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	 String memeber_id = friendObj.get("member_id").toString(); //추가할 멤버 아이디 
    	 String group_num = friendObj.get("group_num").toString();//그룹아이디
    	 
    	 //find 쿼리
    	 Criteria c = new Criteria("group_num");
    	 c.is(group_num);
    	 
    	 Query query = new Query(c);
    	 ArrayList<JSONObject> list = (ArrayList<JSONObject>)mongoTemplate.find(query, JSONObject.class, "schedule");
    	  
    	 int overlap = 0;
    	//아이디 값이 들어온 값과 같으면 친구추가 못하도록
    	 for(int i=0; i<list.size(); i++){
    		 if(memeber_id.equals(list.get(i).get("member_id").toString())){	 
    			 overlap++;
    		 } 
    	 }
    	 
    	 //addFriend에 그룹번호를 검색해서 검색값이 5이상이면 친구추가 못하도록 
    	 if(list.size()>=5){
    		 
    		 data = "OVER";
    		 
    	 }else if(overlap > 0){
    		 
    		 data = "OVERLAP";
    		 
    	 }else{
    		//위의 상황에 걸리지 않으면 sava
       	  Document doc = Document.parse(addFriend);
   		  mongoTemplate.save(doc,"schedule");
   		  
   		  data="OK";
    	 }//end else
    	
    	
    	 return data; 
      }//end 
      
      
      /**
       * save에 필요한  _id를 찾기 위해 group_num으로 검색
       * */
      @RequestMapping("/find_id.tm")
      @ResponseBody
      public ArrayList<JSONObject> find_id(@RequestBody String group_number){
    	 
    	 
    	  JSONParser parser = new JSONParser();
    	  JSONObject group_number_OBJ =null;
    	  ArrayList<JSONObject> list = null;
    	  String group_num = null;
		try {
			group_number_OBJ = (JSONObject)parser.parse(group_number);
			   group_num = group_number_OBJ.get("group_num").toString();			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		  
		Criteria criteria = new Criteria("group_num");
        criteria.is(group_num);
        Query query = new Query(criteria);
        list = (ArrayList<JSONObject>)mongoTemplate.find(query, JSONObject.class, "schedule");
        for(int i=0; i<list.size(); i++){
  		
  	  }
    	  return list;
      }
      
      
      
   
}