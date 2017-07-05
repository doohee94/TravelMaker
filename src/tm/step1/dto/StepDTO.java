package tm.step1.dto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.StringTokenizer;

public class StepDTO {
	
	private String liststart; // 출발지
	private String listthrough; // 경유지
	private String listarrival; // 도착지
	private String partystr; // 동행자
	
	private String id; //몽고 ID
	private ArrayList<String> schedule = new ArrayList<>(); // 일정
	private String title; // 제목
	private ArrayList<String> party = new ArrayList<>(); // 일행
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
//		Calendar cal = Calendar.getInstance();
//		String year = String.valueOf(cal.get(Calendar.YEAR));
//		String month = ((cal.get(Calendar.MONTH)+1) < 10) ? "0"+(cal.get(Calendar.MONTH)+1) : String.valueOf((cal.get(Calendar.MONTH)+1));
//		String date = ((cal.get(Calendar.DATE)) < 10) ? "0"+(cal.get(Calendar.DATE)) : String.valueOf((cal.get(Calendar.DATE)));
//		String hour = ((cal.get(Calendar.HOUR)) < 10) ? "0"+(cal.get(Calendar.HOUR)) : String.valueOf((cal.get(Calendar.HOUR)));
//		String minute = ((cal.get(Calendar.MINUTE)) < 10) ? "0"+(cal.get(Calendar.MINUTE)) : String.valueOf((cal.get(Calendar.MINUTE)));
//		String second = ((cal.get(Calendar.SECOND)) < 10) ? "0"+(cal.get(Calendar.SECOND)) : String.valueOf((cal.get(Calendar.SECOND)));
//		id += year;
//		id += month;
//		id += date;
//		id += hour;
//		id += minute;
//		id += second;
		// 위 코드를 주석처맇나 이유는 step3에서 id 따로 만들었기 때문.
		this.id = id;
	}
	public ArrayList<String> getSchedule() {
		return schedule;
	}
	public void setSchedule(ArrayList<String> schedule) {
		this.schedule = schedule;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArrayList<String> getParty() {
		return party;
	}
	public void setParty(ArrayList<String> party) {
		this.party = party;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getListstart() {
		return liststart;
	}
	public void setListstart(String liststart) {
		this.liststart = liststart;
	}
	public String getListthrough() {
		return listthrough;
	}
	public void setListthrough(String listthrough) {
		this.listthrough = listthrough;
	}
	public String getListarrival() {
		return listarrival;
	}
	public void setListarrival(String listarrival) {

		this.listarrival = listarrival;
	}
	public String getPartystr() {
		return partystr;
	}
	public void setPartystr(String partystr) {

		this.partystr = partystr;
	}
}
