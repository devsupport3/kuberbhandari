package com.ui.model;

public class SevaCategory {

	public SevaCategory(int sevaCategoryId, String sevaCategoryName, String description, String image, String status,
			int createdBy, String createdDate, String ipAddress) {
		this.sevaCategoryId = sevaCategoryId;
		this.sevaCategoryName = sevaCategoryName;
		this.description = description;
		this.image = image;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int sevaCategoryId; // Primary key for Seva Category
	private String sevaCategoryName;
	private String description;
	private String image;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getSevaCategoryId() {
		return sevaCategoryId;
	}

	public void setSevaCategoryId(int sevaCategoryId) {
		this.sevaCategoryId = sevaCategoryId;
	}

	public String getSevaCategoryName() {
		return sevaCategoryName;
	}

	public void setSevaCategoryName(String sevaCategoryName) {
		this.sevaCategoryName = sevaCategoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
