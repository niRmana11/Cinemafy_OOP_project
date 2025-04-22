package reviewManagement;

public class ReviewModel {
	
	private int  review_id;
	private String userName;
	private String movie_tvshowName;
	private String review_text;
	private String rating;
	private String review_date;
	
	
	public ReviewModel(int review_id, String userName, String movie_tvshowName, String review_text, String rating,
			String review_date) {
		this.review_id = review_id;
		this.userName = userName;
		this.movie_tvshowName = movie_tvshowName;
		this.review_text = review_text;
		this.rating = rating;
		this.review_date = review_date;
	}


	public int getReview_id() {
		return review_id;
	}


	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getMovie_tvshowName() {
		return movie_tvshowName;
	}


	public void setMovie_tvshowName(String movie_tvshowName) {
		this.movie_tvshowName = movie_tvshowName;
	}


	public String getReview_text() {
		return review_text;
	}


	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getReview_date() {
		return review_date;
	}


	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
	
	
	

}
