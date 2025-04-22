package WatchLaterPackage;


import java.util.Date;

public class WatchLaterModel {
    private int watchLaterId;
    private int userId;
    private int movieId;
    private int seriesId;
    private Date addedDate;

    // Constructor
    public WatchLaterModel(int watchLaterId, int userId, int movieId, int seriesId, Date addedDate) {
        this.watchLaterId = watchLaterId;
        this.userId = userId;
        this.movieId = movieId;
        this.seriesId = seriesId;
        this.addedDate = addedDate;
    }

    // Getters and Setters
    public int getWatchLaterId() {
        return watchLaterId;
    }

    public void setWatchLaterId(int watchLaterId) {
        this.watchLaterId = watchLaterId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(int seriesId) {
        this.seriesId = seriesId;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }
}
