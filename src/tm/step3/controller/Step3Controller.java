package tm.step3.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import com.mongodb.util.JSON;

import tm.step3.dao.Step3DAO;
import tm.step3.dao.Step3DAOImpl;

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
   public ModelAndView step3_id(String _id){
	   ModelAndView mv = new ModelAndView();
	   
	   if(_id != null){
		   mv.addObject("_id", _id);
	   }else{ 
		   mv.addObject("_id", "S20170704161911803");
	   }
	   mv.setViewName(dir+"/step3");
	   System.out.println("스템33333333"+_id);
	   return mv;
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
   
   
   
   @RequestMapping("/distanceCal.tm")
   @ResponseBody
   public JSONObject distanceCal(@RequestBody String listInfo){
      System.out.println("스프링@@@@"+listInfo);
      JSONObject responseList  = new JSONObject();
      
      try {
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObj = (JSONObject) jsonParser.parse(listInfo);
         System.out.println(jsonObj.get("mapx"));
         System.out.println(jsonObj.get("mapy"));
         
         
         JSONArray title = (JSONArray)jsonObj.get("title");
         JSONArray addr = (JSONArray)jsonObj.get("addr");
         JSONArray image = (JSONArray)jsonObj.get("image");
         JSONArray mapx = (JSONArray)jsonObj.get("mapx");
         JSONArray mapy = (JSONArray)jsonObj.get("mapy");
         
         String []titleArr = new String[title.size()];
         String []addrArr = new String[addr.size()];
         String []imageArr = new String[image.size()];
         String []mapxArr = new String[mapx.size()];
         String []mapyArr = new String[mapy.size()];
         
         double distance[][] = range((JSONArray)jsonObj.get("mapx") , (JSONArray)jsonObj.get("mapy"));
         
         int routeIndex=0;
         titleArr[routeIndex] = title.get(routeIndex).toString();
         addrArr[routeIndex] = addr.get(routeIndex).toString();
         imageArr[routeIndex] = image.get(routeIndex).toString();
         mapxArr[routeIndex] = mapx.get(routeIndex).toString();
         mapyArr[routeIndex] = mapy.get(routeIndex).toString();
         
        ArrayList<Integer> temp = new ArrayList<Integer>();
        int curIndex=0;
      temp.add(curIndex);
      
      int rowindex=0;
      
      for(int i=0; i<title.size();i++){
         System.out.print("시작전"+i+"번쨰"+title.get(i).toString());
         System.out.println("\n");
      }
      
      
      for(int k=1; k<title.size(); k++){

         double min = 1000;

         END:
        	for(int i=1; i<title.size(); i++){
            if(distance[rowindex][i] == 0){
               continue;
            }
            for(int j=0; j<temp.size(); j++){
               //System.out.print("temp#"+temp.get(j).toString() +"\t");
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
      }//end K
      
      for(int i=0; i<title.size();i++){
         System.out.print("  시작후"+i+"번쨰"+titleArr[i]);
      }
   
      
      responseList.put("title", titleArr);
      responseList.put("addr", addrArr);
      responseList.put("image", imageArr);
      responseList.put("mapx", mapxArr);
      responseList.put("mapy", mapyArr);
      
      
      
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
               
               System.out.println(leng[i][j]);
            }
            System.out.println("------------");
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
			System.out.println(data);
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
    		 System.out.println("친추>>>>"+list.get(i));
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
       	  System.out.println("추가>>>>"+doc);
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
    	  System.out.println(">>>>>>>>>>>>>>>>>>>>>"+group_number);
    	 
    	  JSONParser parser = new JSONParser();
    	  JSONObject group_number_OBJ =null;
    	  ArrayList<JSONObject> list = null;
    	  String group_num = null;
		try {
			group_number_OBJ = (JSONObject)parser.parse(group_number);
			   group_num = group_number_OBJ.get("group_num").toString();
	    	   System.out.println(">>>>>"+group_num);
	    	
	    	  
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		  
		Criteria criteria = new Criteria("group_num");
        criteria.is(group_num);
        Query query = new Query(criteria);
        System.out.println("쿼리>>>"+query);
        list = (ArrayList<JSONObject>)mongoTemplate.find(query, JSONObject.class, "schedule");
        for(int i=0; i<list.size(); i++){
  		  System.out.println(">>>"+list.get(i));
  	  }
    	  return list;
      }
      
      
      
   
}