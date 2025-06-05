package com.ui.model;

public class Festival {

	// Constructor with all fields
	public Festival(int festivalId, String festivalName, String description, String status, int createdBy,
			String createdDate, String ipAddress) {
		this.festivalId = festivalId;
		this.festivalName = festivalName;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int festivalId;
	private String festivalName;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getFestivalId() {
		return festivalId;
	}

	public void setFestivalId(int festivalId) {
		this.festivalId = festivalId;
	}

	public String getFestivalName() {
		return festivalName;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
