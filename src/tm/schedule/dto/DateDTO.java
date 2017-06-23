package tm.schedule.dto;

public class DateDTO {

	private PlaceNameDTO[] placeName;
	private int placeState;
	
	public PlaceNameDTO[] getPlaceName() {
		return placeName;
	}
	public void setPlaceName(PlaceNameDTO[] placeName) {
		this.placeName = placeName;
	}
	public int getPlaceState() {
		return placeState;
	}
	public void setPlaceState(int placeState) {
		this.placeState = placeState;
	}
	
}
