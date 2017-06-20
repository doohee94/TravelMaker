package tm.step2.controller;

import java.io.InputStreamReader;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.StringTokenizer;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView listview(String changelist){
		//세션에 아이디+travellist를 받아옴
		//초기값
		ArrayList<String> list = new ArrayList<String>();
		
		if(changelist != null){
			StringTokenizer stt = new StringTokenizer(changelist);
			while (stt.hasMoreTokens()) {
				list.add(stt.nextToken());
			}
		}else{
			list.add("서울");
			list.add("청주");
			list.add("상주");
			list.add("부산");
		}
		
		//받은 값에 대한 위도 경도 (초기값)
		ArrayList<Double> coordinatelist = new ArrayList<Double>();
		
		//중간 위도 경도(최종 위도)
		ArrayList<Double> addcoordinatelist = new ArrayList<Double>();
		
		//추가되는 리스트(최종본)
		ArrayList<String> addlist = new ArrayList<String>();
		
		
		//list에 저장된 값을 읽어 coordinatelist에 도시에 대한 좌표 저장
		for (String s : list) {
			Double [] res = Geocoding(s);
			coordinatelist.add(res[0]);
			coordinatelist.add(res[1]);
		}
		
		//지정 위치 사이의 거리와 중간점을 뽑아낸다
		// 3(1), 5(2), 9(4). 17(8), 33(16), 65(32)
		//50 100 150 300 450 650 
		for (int i = 0; i < coordinatelist.size(); i++) {
			if( i!=1 && i%2==1){
				double resrange = range(coordinatelist.get(i-3),coordinatelist.get(i-2),coordinatelist.get(i-1),coordinatelist.get(i));
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
				ArrayList<Double> initialvalueArr = new ArrayList<Double>();
				initialvalueArr.add(coordinatelist.get(i-3));
				initialvalueArr.add(coordinatelist.get(i-2));
				initialvalueArr.add(coordinatelist.get(i-1));
				initialvalueArr.add(coordinatelist.get(i));
				
				//추가배열
				ArrayList<Double> addvalueArr = new ArrayList<Double>();
				
				//종합결과배열
				ArrayList<Double> resultvalueArr = new ArrayList<Double>();
				//종합결과배열의 초기값은 처음 배열과 같다
				resultvalueArr.addAll(initialvalueArr);
				
				//횟수만큼 반복
				double[] add;
				for (int j = 0; j < count; j++) {
					for (int k = 0; k < initialvalueArr.size(); k++) {
						if( k!=1 && k%2==1){
							add = centralpoint(initialvalueArr.get(k-3),initialvalueArr.get(k-2),initialvalueArr.get(k-1),initialvalueArr.get(k));
							addvalueArr.add(add[0]);
							addvalueArr.add(add[1]);
							resultvalueArr.addAll(k-3,addvalueArr);
						}
					}
					initialvalueArr.clear();
					initialvalueArr.addAll(resultvalueArr);
				}
				addcoordinatelist.addAll(initialvalueArr);
			}
		}
		
		
		//추가된 위도 경도로 도시명을 끌고온다
		for (int i = 0; i < addcoordinatelist.size(); i++) {
			if(i%2==1){
				addlist.add(Geocoding(addcoordinatelist.get(i-1),addcoordinatelist.get(i)));
			}
		}
		
		//중복제거
		HashSet hs = new HashSet(addlist);
		
		ArrayList<String> newaddList = new ArrayList<String>(hs);
		
		//이미 선택된 위치 제거
		for (int i = 0; i < newaddList.size(); i++) {
			for (String s : list) {
				if(newaddList.get(i).equals(s)){
					newaddList.remove(i);
					i=0;
				}
			}
		}
	
		
		ModelAndView mv =  new ModelAndView();
		
		mv.addObject("list", list);
		mv.addObject("addlist", newaddList);
		mv.setViewName(dir+"step2");
		return mv;
	}
	
	
	/**
	 * Geocoding
	 * 시/군을 입력받아 좌표로 변환
	 * 인자값 :  String(시/군)
	 * 리턴값 : Double 배열 (위도 경도)
	 */
	public Double[] Geocoding (String sigun) {
		String key = "AIzaSyAPFngomh3VBqBO3RqPRaKCcfefgFCCN0o";
		URL url;
		Double [] res = new Double[2];
		try {
			url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address="+sigun+"&key="+key);
			// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			//response.results[0].geometry.location.lat+","+response.results[0].geometry.location.lng);
			// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
			JSONObject response = (JSONObject)JSONValue.parseWithException(isr);
			JSONArray results = (JSONArray)response.get("results");
			JSONObject results_1 = (JSONObject)results.get(0); 
			JSONObject geometry = (JSONObject)(results_1.get("geometry"));
			JSONObject location = (JSONObject)(geometry.get("location"));
			
			//결과값 위도 경도
			Double lat = (Double)(location.get("lat"));
			Double lng = (Double)(location.get("lng"));
			res[0]=lat;
			res[1]=lng;
			
		} catch (Exception e) {
			System.out.println("에러발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * Geocoding
	 * 좌표를 입력받아 도시명으로 출력
	 * 인자값 : 좌표
	 * 리턴값 : String(도시명)
	 */
	public String Geocoding(double x, double y) {
		String key = "AIzaSyAPFngomh3VBqBO3RqPRaKCcfefgFCCN0o";
		URL url;
		String res = "";
		try {
			url = new URL("https://maps.googleapis.com/maps/api/geocode/json?latlng=" + x + "," + y + "&key=" + key
					+ "&language=ko");
			// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			// JSON을 Parsing 한다.// 문법오류가 날 경우 Exception 발생, without Exception ->
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
				if (addr.contains("특별시")) {
					res = addr.replace("특별시", "");
					break;
				} else if (addr.contains("광역시")) {
					res = addr.replace("광역시", "");
					break;
				} else if (addr.contains("시")) {
					res = addr.replace("시", "");
					break;
				} else if (addr.contains("군")) {
					res = addr.replace("군", "");
					break;
				}
			}

		} catch (Exception e) {
			System.out.println("에러발생 : " + e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * range
	 * 두 좌표간 거리 계산
	 * 인자값 : x1,y1 과 x2,y2 좌표 2개
	 * 결과값 : res (거리 : 단위 km)
	 */
	public static double range(double x1, double y1, double x2, double y2) {
		double res = 0;
		res = Math.acos(Math.cos(Math.toRadians(90 - x1)) * Math.cos(Math.toRadians(90 - x2))
				+ Math.sin(Math.toRadians(90 - x1)) * Math.sin(Math.toRadians(90 - x2))
						* Math.cos(Math.toRadians(y1 - y2)))
				* 6371;
		return res;
	}

	/**
	 * centralpoint
	 * 두 지점의 중간 좌표를 출력
	 * 인자값 : 두 지점의 좌표
	 * 결과값 : 중간 좌표
	 */
	public static double[] centralpoint(double x1, double y1, double x2, double y2) {
		double[] res = new double[2];
		DecimalFormat df = new DecimalFormat(".000000");
		res[0] = Double.parseDouble(df.format((x1 + x2) / 2));
		res[1] = Double.parseDouble(df.format((y1 + y2) / 2));
		return res;
	}

	/**
	 * centralpointArray
	 * 중간값 뽑아내는 갯수
	 * 인자값 : 숫자
	 * 결과값 : 반복횟수
	 */
	public static int centralpointArray(int a) {
		int[] res = new int[a];
		int start = 0;
		int addcount = 1;
		res[0] = 2;
		for (int i = 1; i < res.length; i++) {
			start = res[i - 1];
			res[i] = start + addcount;
			addcount = addcount * 2;
		}
		return res[a-1];
	}
	
	
}