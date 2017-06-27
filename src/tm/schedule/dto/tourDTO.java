package tm.schedule.dto;

public class tourDTO {
	private String date;
	private String city;
	private placeDTO[] place;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public placeDTO[] getPlace() {
		return place;
	}
	public void setPlace(placeDTO[] place) {
		this.place = place;
	}
	
	
}
