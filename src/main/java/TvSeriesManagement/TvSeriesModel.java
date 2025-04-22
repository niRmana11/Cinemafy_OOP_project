package TvSeriesManagement;

public class TvSeriesModel {
	
	private int series_id ;
	private String title ;
	private String release_date ;
	private String description ;
	private String rating ;
	private String total_seasons ;
	private String poster_image_url ;
	private String trailer_url ;
	
	
	public TvSeriesModel(int series_id, String title, String release_date, String description, String rating,
			String total_seasons, String poster_image_url, String trailer_url) {
		super();
		this.series_id = series_id;
		this.title = title;
		this.release_date = release_date;
		this.description = description;
		this.rating = rating;
		this.total_seasons = total_seasons;
		this.poster_image_url = poster_image_url;
		this.trailer_url = trailer_url;
	}


	public int getSeries_id() {
		return series_id;
	}


	public void setSeries_id(int series_id) {
		this.series_id = series_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getRelease_date() {
		return release_date;
	}


	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getTotal_seasons() {
		return total_seasons;
	}


	public void setTotal_seasons(String total_seasons) {
		this.total_seasons = total_seasons;
	}


	public String getPoster_image_url() {
		return poster_image_url;
	}


	public void setPoster_image_url(String poster_image_url) {
		this.poster_image_url = poster_image_url;
	}


	public String getTrailer_url() {
		return trailer_url;
	}


	public void setTrailer_url(String trailer_url) {
		this.trailer_url = trailer_url;
	}
	
	
	
	
	
	

}
