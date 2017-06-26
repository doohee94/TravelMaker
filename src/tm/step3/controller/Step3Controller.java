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

import com.mongodb.DBObject;
import com.mongodb.util.JSON;

import tm.schedule.dto.DateDTO;
import tm.schedule.dto.PlaceDTO;
import tm.schedule.dto.PlaceNameDTO;

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

         END:for(int i=1; i<title.size(); i++){
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
		   
//		   Criteria critefia  = new Criteria("_id");
//		   critefia.is("1");
//		   
//		   Query query = new Query(critefia);
//		   
//		   
//		   Update update = new Update();
//		   update.set("tour.city","인천");
		   
		  // mongoTemplate.updateFirst(query, update, "schedule");
		   //mongoTemplate.save(doc,"");
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
      
      
      
      
   
}