package tm.step1.dto;

import java.util.ArrayList;
import java.util.Calendar;

public class StepDTO {
	private String id; //몽고 ID
	private ArrayList<String> schedule; // 일정
	private String title; // 제목
	private ArrayList<String> party; // 일행
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = ((cal.get(Calendar.MONTH)+1) < 10) ? "0"+(cal.get(Calendar.MONTH)+1) : String.valueOf((cal.get(Calendar.MONTH)+1));
		String date = ((cal.get(Calendar.DATE)) < 10) ? "0"+(cal.get(Calendar.DATE)) : String.valueOf((cal.get(Calendar.DATE)));
		String hour = ((cal.get(Calendar.HOUR)) < 10) ? "0"+(cal.get(Calendar.HOUR)) : String.valueOf((cal.get(Calendar.HOUR)));
		String minute = ((cal.get(Calendar.MINUTE)) < 10) ? "0"+(cal.get(Calendar.MINUTE)) : String.valueOf((cal.get(Calendar.MINUTE)));
		String second = ((cal.get(Calendar.SECOND)) < 10) ? "0"+(cal.get(Calendar.SECOND)) : String.valueOf((cal.get(Calendar.SECOND)));
		id += year;
		id += month;
		id += date;
		id += hour;
		id += minute;
		id += second;
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
}
