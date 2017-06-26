package tm.schedule.dto;

public class PlaceNameDTO {
	
	private String spot;
	private String onelineReview;
	private int check;
	private double mapx;
	private double mapy;
	
	public PlaceNameDTO(){}
	
	
	public PlaceNameDTO(String spot, String onelineReview, int check, double mapx, double mapy) {
		super();
		this.spot = spot;
		this.onelineReview = onelineReview;
		this.check = check;
		this.mapx = mapx;
		this.mapy = mapy;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getOnelineReview() {
		return onelineReview;
	}
	public void setOnelineReview(String onelineReview) {
		this.onelineReview = onelineReview;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	
	
}
