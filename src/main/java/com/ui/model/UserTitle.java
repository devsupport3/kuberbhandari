package com.ui.model;

public class UserTitle {

	// Constructor
	public UserTitle(int userTitleId, String userTitle, String userTitleDescription, String image, String status,
			int createdBy, String createdDate, String ipAddress) {
		this.userTitleId = userTitleId;
		this.userTitle = userTitle;
		this.userTitleDescription = userTitleDescription;
		this.image = image;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int userTitleId; // Primary key for Users_Title
	private String userTitle; // Title like Shri, Smt., Mrs., Mr.
	private String userTitleDescription;
	private String image;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getUserTitleId() {
		return userTitleId;
	}

	public void setUserTitleId(int userTitleId) {
		this.userTitleId = userTitleId;
	}

	public String getUserTitle() {
		return userTitle;
	}

	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}

	public String getUserTitleDescription() {
		return userTitleDescription;
	}

	public void setUserTitleDescription(String userTitleDescription) {
		this.userTitleDescription = userTitleDescription;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
