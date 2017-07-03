package tm.main.dao;

import java.util.List;

import tm.main.dto.TotalreDTO;

public interface MainDAO {
	public String  loadAd();
	public List<TotalreDTO> loadReview();
}
