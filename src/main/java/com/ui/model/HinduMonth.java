package com.ui.model;

public class HinduMonth {

	// Constructor with all fields
	public HinduMonth(int hinduMonthId, String hinduMonthName, String hinduMonthNameAlias, String description,
			String status, int createdBy, String createdDate, String ipAddress) {
		this.hinduMonthId = hinduMonthId;
		this.hinduMonthName = hinduMonthName;
		this.hinduMonthNameAlias = hinduMonthNameAlias;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int hinduMonthId;
	private String hinduMonthName;
	private String hinduMonthNameAlias;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getHinduMonthId() {
		return hinduMonthId;
	}

	public void setHinduMonthId(int hinduMonthId) {
		this.hinduMonthId = hinduMonthId;
	}

	public String getHinduMonthName() {
		return hinduMonthName;
	}

	public void setHinduMonthName(String hinduMonthName) {
		this.hinduMonthName = hinduMonthName;
	}

	public String getHinduMonthNameAlias() {
		return hinduMonthNameAlias;
	}

	public void setHinduMonthNameAlias(String hinduMonthNameAlias) {
		this.hinduMonthNameAlias = hinduMonthNameAlias;
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
