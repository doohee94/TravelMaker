package tm.step2.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tm.step1.dto.StepDTO;

/**
 * Step2Controller
 * step2 관련 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/step2")
public class Step2Controller {
	
	private String dir = "step2/";
	
	/**
	 * step2
	 * 인자값 전달이 필요없는 부분 담당
	 */
	@RequestMapping("/{url}.tm")
	public String step2(@PathVariable String url) {
		return dir + url;
	}
	
	
	@RequestMapping("/step2.tm")
	public ModelAndView listview(String changelist, HttpSession session){
		//세션에 아이디+travellist를 받아옴
		//초기값
		ArrayList<String> list = new ArrayList<String>();
//		String userId = (String)session.getAttribute("userId");
//		StepDTO dto = (StepDTO) session.getAttribute(userId+"dto");
		
		if(changelist != null){
			//변경된 리스트를 다시 저장
			StringTokenizer stt = new StringTokenizer(changelist);
			while (stt.hasMoreTokens()) {
				list.add(stt.nextToken());
			}
			//값 변경이 일어나면 dto를 수정하여 다시 세션에 저장
//			dto.setSchedule(list);
//			session.setAttribute(userId+"dto", dto);
		}else{
			//세션에 저장된 값으로 list를 구성
			list = new ArrayList<String>();
			
			//세션에서 가져온 
//			list = dto.getSchedule();
			
			list.add("서울");
			list.add("청주");
			list.add("상주");
			list.add("부산");
		}
		
		//받은 값에 대한 위도 경도 (초기값)
		ArrayList<String> coordinatelist = new ArrayList<String>();
		
		//중간 위도 경도(최종 위도)
		ArrayList<String> addcoordinatelist = new ArrayList<String>();
		
		//추가되는 리스트(최종본)
		ArrayList<String> addlist = new ArrayList<String>();
		
		long start = System.currentTimeMillis();
		//list에 저장된 값을 읽어 coordinatelist에 도시에 대한 좌표 저장
		for (String s : list) {
			String res = Geocoding(s);
			coordinatelist.add(res);
		}
		long finsh = System.currentTimeMillis();
		System.out.println("1번 시간(도시명 받아서 위도 경도 변환) : " + (finsh - start));
		
		//지정 위치 사이의 거리와 중간점을 뽑아낸다
		start = System.currentTimeMillis();
		for (int i = 1; i < coordinatelist.size(); i++) {
			double resrange = range(coordinatelist.get(i-1),coordinatelist.get(i));
			//거리에 따른 반복횟수
			int count = 0;
			if(resrange <= 20) count = 0;
			else if(resrange <= 50) count = 1;
			else if(resrange <= 100) count = 2;
			else if(resrange <= 180) count = 3;
			else if(resrange <= 300) count = 4;
			else if(resrange <= 450) count = 5;
			else if(resrange <= 650) count = 6;
			//두 좌표 비교 후 거리를 계산하여 중간좌표의 갯수를 조절
				
			//초기배열 (처음값 : 두좌표만)
			ArrayList<String> initialvalueArr = new ArrayList<String>();
			initialvalueArr.add(coordinatelist.get(i-1));
			initialvalueArr.add(coordinatelist.get(i));
				
			//추가배열
			ArrayList<String> addvalueArr = new ArrayList<String>();
				
			//종합결과배열
			ArrayList<String> resultvalueArr = new ArrayList<String>();
			//종합결과배열의 초기값은 처음 배열과 같다
			resultvalueArr.addAll(initialvalueArr);
				
			//횟수만큼 반복
			String add="";
			for (int j = 0; j < count; j++) {
				for (int k = 1; k < initialvalueArr.size(); k++) {
					//직선거리상 중간좌표를 뽑음
					add = centralpoint(initialvalueArr.get(k-1),initialvalueArr.get(k));
					addvalueArr.add(add);
					resultvalueArr.addAll(k-1,addvalueArr);
				}
				initialvalueArr.clear();
				initialvalueArr.addAll(resultvalueArr);
			}
			addcoordinatelist.addAll(initialvalueArr);
			initialvalueArr.clear();
		}
		finsh = System.currentTimeMillis();
		System.out.println("2번 시간(중간 좌표 뽑기) : " + (finsh - start));
		
		
		start = System.currentTimeMillis();
		//hashset을 사용해 중복되는 값을 배제
		HashSet hs = new HashSet(addcoordinatelist);
		//중복 배제된 값들을 newaddList에 저장
		ArrayList<String> newaddList = new ArrayList<String>(hs);
		finsh = System.currentTimeMillis();
		System.out.println("3번 시간 (중복제거): " + (finsh - start));
		
		//추가된 위도 경도로 도시명을 끌고온다
		start = System.currentTimeMillis();
		for (int i = 0; i < newaddList.size(); i++) {
			//좌표로된 리스트를 도시명으로 전환 후 addlist에 저장
			addlist.add(ReGeocoding(newaddList.get(i)));
		}
		finsh = System.currentTimeMillis();
		System.out.println("4번 시간(위도경도->도시명) : " + (finsh - start));
		
		//중복제거
		start = System.currentTimeMillis();
		//다른좌표지만 같은 도시명 배제를 위해 중복 제거
		HashSet hs2 = new HashSet(addlist);
		//중복 제거된  값들을 newaddList2에 저장
		ArrayList<String> newaddList2 = new ArrayList<String>(hs2);
		//이미 선택된 위치 제거
		for (int i = 0; i < newaddList2.size(); i++) {
			for (String s : list) {
				if(newaddList2.get(i).equals(s)){
					//이미 선택된 도시들을 찾아서 제거
					newaddList2.remove(i);
					i=0;
				}
			}
		}
		finsh = System.currentTimeMillis();
		System.out.println("5번 시간 (선택한 위치 제거) : " + (finsh - start));
		
		ModelAndView mv =  new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("addlist", newaddList2);
		mv.setViewName(dir+"step2");
		return mv;
	}
	
	
	/**
	 * Geocoding
	 * 시/군을 입력받아 좌표로 변환
	 * 인자값 :  String(시/군)
	 * 리턴값 : Double 배열 (위도 경도)
	 */
	public String Geocoding (String sigun) {
		//구글
		String key = "AIzaSyAPFngomh3VBqBO3RqPRaKCcfefgFCCN0o";
		//다음
		URL url;
		String res = "";
		try {
			url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address="+sigun+"&key="+key);
			// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
			JSONObject response = (JSONObject)JSONValue.parseWithException(isr);
			JSONArray results = (JSONArray)response.get("results");
			JSONObject results_1 = (JSONObject)results.get(0); 
			JSONObject geometry = (JSONObject)(results_1.get("geometry"));
			JSONObject location = (JSONObject)(geometry.get("location"));
			
			//결과값 위도 경도
			Double lat = (Double)(location.get("lat"));
			Double lng = (Double)(location.get("lng"));
			res = lat + ","+ lng;
			
		} catch (Exception e) {
			System.out.println("에러발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * ReGeocoding
	 * 좌표를 입력받아 도시명으로 출력
	 * 인자값 : 좌표
	 * 리턴값 : String(도시명)
	 */
	public String ReGeocoding(String coordinates) {
		String key = "AIzaSyAPFngomh3VBqBO3RqPRaKCcfefgFCCN0o";
		URL url;
		String res = "";
		
		//다음
//		String apiKey = "47e8dd0317a1353f952001a6f28a33f2";
		String apiKey = "d7cd900845b5f9c431bb5325b827e675";
		String inputLine;
		
//		BufferedReader bufferedReader = null;
		try {
			
			//구글
			url = new URL("https://maps.googleapis.com/maps/api/geocode/json?latlng=" +coordinates + "&key=" + key
					+ "&language=ko");
			// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			// parse 메소드
			JSONObject response = (JSONObject) JSONValue.parseWithException(isr);
			JSONArray results = (JSONArray) response.get("results");
			JSONObject results_1 = (JSONObject) results.get(0);
			//결과값 주소
			String formatted_address = (String) (results_1.get("formatted_address"));
			
			//주소를 받아서 도시명 만 넘겨줌
			StringTokenizer st = new StringTokenizer(formatted_address);
			while (st.hasMoreTokens()) {
				String addr = st.nextToken();
				//주소명에서 도시이름만 리턴
				if (addr.contains("특별시")) {
					res = addr.replace("특별시", "");
					break;
				} else if (addr.contains("광역시")) {
					res = addr.replace("광역시", "");
					break;
				} else if (addr.contains("시") || addr.contains("군") ){
					res = addr.substring(0, addr.length()-1);
					break;
				} 
			}
			
			
			//다음
			//****** coordinates -> 분리해야함
//			double[] result = splitMet(coordinates);
//			String requestUrl = "https://apis.daum.net/local/geo/coord2addr";
//			requestUrl += "?apikey=" + apiKey; // 발급된 키
//			requestUrl += "&longitude=" + result[1];
//			requestUrl += "&latitude=" + result[0];
//			requestUrl += "&inputCoordSystem=WGS84&output=json";
//			url = new URL(requestUrl);
//			URLConnection conn = url.openConnection();
//			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			JSONParser jsonParser = new JSONParser();
//			JSONObject jsonObject = (JSONObject) jsonParser.parse(bufferedReader);
//			String name1 = (String) (jsonObject.get("name1"));
//			String name2= (String) (jsonObject.get("name2"));
//			//주소를 받아서 도시명 만 넘겨줌
//			if(name1.contains("특별시")){
//				res = name1.split(" ")[0].replace("특별시", "");
//			}else if(name1.contains("광역시")){
//				res = name1.split(" ")[0].replace("광역시", "");
//			}else if (addr.contains("시") || addr.contains("군") ){
//				res = addr.substring(0, addr.length()-1);
//			}
		} catch (Exception e) {
			System.out.println("에러발생 : " + e.getMessage());
			e.printStackTrace();
		}
//		finally {
//			try {
//				if(bufferedReader !=null)bufferedReader.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		return res;
	}
	
	/**
	 * range
	 * 두 좌표간 거리 계산
	 * 인자값 : x1,y1 과 x2,y2 좌표 2개
	 * 결과값 : res (거리 : 단위 km)
	 */
	public static double range(String a1, String a2) {
		//문자열을 double로 바꿈
		double[] result1 = splitMet(a1);
		double[] result2 = splitMet(a2);
		
		double res = 0;
		//두 좌표 사이 직선 거리를 구함
		res = Math.acos(Math.cos(Math.toRadians(90 - result1[0])) * Math.cos(Math.toRadians(90 - result2[0]))
				+ Math.sin(Math.toRadians(90 - result1[0])) * Math.sin(Math.toRadians(90 - result2[0]))
						* Math.cos(Math.toRadians(result1[1] - result2[1])))
				* 6371;
		//결과를 리턴
		return res;
	}
	
	
	/**
	 * splitMet
	 * 문자열로 들어오는 좌표를 분리
	 * 인자값 : 문자열 좌표
	 * 리턴값 : double배열
	 */
	public static double[] splitMet(String arr) {
		//문자열로된 좌표를 [,]를 구분으로 자름
		StringTokenizer st = new StringTokenizer(arr,",");
		
		double[] res = new double[2];
		int i = 0;
		//결과값을 double[] 에 저장
		while(st.hasMoreTokens()){
			res[i] = Double.parseDouble(st.nextToken());
			i++;
		}
		return res;
	}

	/**
	 * centralpoint
	 * 두 지점의 중간 좌표를 출력
	 * 인자값 : 두 지점의 좌표
	 * 결과값 : 중간 좌표
	 */
	public static String centralpoint(String a1, String a2) {
		//문자열을 double로 바꿈
		double[] result1 = splitMet(a1);
		double[] result2 = splitMet(a2);
		
		//두 좌표 사이의 중간좌표를 구함
		String res = "";
		DecimalFormat df = new DecimalFormat(".000000");
		res = df.format((result1[0] + result2[0]) / 2);
		res += ",";
		res += df.format((result2[1] + result2[1]) / 2);
		
		return res;
	}

}