package tm.schedule.dto;

public class ScheduleDTO {

	private String scheduleNum;
	private String memberId;
	private String friend;
	private int groupNum;
	private PlaceDTO[] place;
	private int saveState;
	
	public String getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(String scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public PlaceDTO[] getPlace() {
		return place;
	}
	public void setPlace(PlaceDTO[] place) {
		this.place = place;
	}
	public int getSaveState() {
		return saveState;
	}
	public void setSaveState(int saveState) {
		this.saveState = saveState;
	}
	
	
}
