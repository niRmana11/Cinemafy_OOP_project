package MovieManagement;

public class MovieModel {
	
	private int movie_id ;
	private String title ;
	private String release_date ;
	private String description ;
	private String rating ;
	private String duration ;
	private String language ;
	private String poster_image_url ;
	private String trailer_url ;
	
	public MovieModel(int movie_id, String title, String release_date, String description, String rating,
			String duration, String language, String poster_image_url, String trailer_url) {
		super();
		this.movie_id = movie_id;
		this.title = title;
		this.release_date = release_date;
		this.description = description;
		this.rating = rating;
		this.duration = duration;
		this.language = language;
		this.poster_image_url = poster_image_url;
		this.trailer_url = trailer_url;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
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

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
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
