package com.ui.model;

public class HinduYear {

	// Constructor with all fields
	public HinduYear(int hinduYearId, String hinduYear, String description, String status, int createdBy,
			String createdDate, String ipAddress) {
		this.hinduYearId = hinduYearId;
		this.hinduYear = hinduYear;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int hinduYearId;
	private String hinduYear;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getHinduYearId() {
		return hinduYearId;
	}

	public void setHinduYearId(int hinduYearId) {
		this.hinduYearId = hinduYearId;
	}

	public String getHinduYear() {
		return hinduYear;
	}

	public void setHinduYear(String hinduYear) {
		this.hinduYear = hinduYear;
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
