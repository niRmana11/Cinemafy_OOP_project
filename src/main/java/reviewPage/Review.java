package reviewPage;

public class Review {
	
	private String name;
    private String movieName;
    private String reviewText;
    private int rating;
	
    public Review(String name, String movieName, String reviewText, int rating) {
		this.name = name;
		this.movieName = movieName;
		this.reviewText = reviewText;
		this.rating = rating;
	}

	public String getName() {
		return name;
	}

	public String getMovieName() {
		return movieName;
	}

	public String getReviewText() {
		return reviewText;
	}

	public int getRating() {
		return rating;
	}
    
    
    
    

}
