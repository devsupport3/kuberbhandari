package com.ui.model;

public class DailyDarshanImages {

	// Constructor
	public DailyDarshanImages(int dailyDarshanImageId, int dailyDarshanId, String imageTitle, String imageDescription,
			String dailyDarshanImages, String imageInputType, String youTubeUrl, String status, int createdBy, String createdDate,
			String ipAddress) {
		this.dailyDarshanImageId = dailyDarshanImageId;
		this.dailyDarshanId = dailyDarshanId;
		this.imageTitle = imageTitle;
		this.imageDescription = imageDescription;
		this.dailyDarshanImages = dailyDarshanImages;
		this.imageInputType = imageInputType;
		this.youTubeUrl = youTubeUrl;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int dailyDarshanImageId;
	private int dailyDarshanId;
	private String imageTitle;
	private String imageDescription;
	private String dailyDarshanImages;
	private String imageInputType;
	private String youTubeUrl;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getDailyDarshanImageId() {
		return dailyDarshanImageId;
	}

	public int getDailyDarshanId() {
		return dailyDarshanId;
	}

	public String getImageTitle() {
		return imageTitle;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public String getDailyDarshanImages() {
		return dailyDarshanImages;
	}

	public String getYouTubeUrl() {
		return youTubeUrl;
	}

	public String getStatus() {
		return status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setDailyDarshanImageId(int dailyDarshanImageId) {
		this.dailyDarshanImageId = dailyDarshanImageId;
	}

	public void setDailyDarshanId(int dailyDarshanId) {
		this.dailyDarshanId = dailyDarshanId;
	}

	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}

	public void setDailyDarshanImages(String dailyDarshanImages) {
		this.dailyDarshanImages = dailyDarshanImages;
	}

	public void setYouTubeUrl(String youTubeUrl) {
		this.youTubeUrl = youTubeUrl;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getImageInputType() {
		return imageInputType;
	}

	public void setImageInputType(String imageInputType) {
		this.imageInputType = imageInputType;
	}
	
	
}
