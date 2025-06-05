package com.ui.model;

public class SevaImages {

	// Constructor
	public SevaImages(int sevaImageId, int sevaId, String imageTitle, String imageDescription, String sevaImages,
			String status, int createdBy, String createdDate, String ipAddress) {
		this.sevaImageId = sevaImageId;
		this.sevaId = sevaId;
		this.imageTitle = imageTitle;
		this.imageDescription = imageDescription;
		this.sevaImages = sevaImages;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int sevaImageId;
	private int sevaId;
	private String imageTitle;
	private String imageDescription;
	private String sevaImages;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getSevaImageId() {
		return sevaImageId;
	}

	public void setSevaImageId(int sevaImageId) {
		this.sevaImageId = sevaImageId;
	}

	public int getSevaId() {
		return sevaId;
	}

	public void setSevaId(int sevaId) {
		this.sevaId = sevaId;
	}

	public String getImageTitle() {
		return imageTitle;
	}

	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}

	public String getSevaImages() {
		return sevaImages;
	}

	public void setSevaImages(String sevaImages) {
		this.sevaImages = sevaImages;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

}
