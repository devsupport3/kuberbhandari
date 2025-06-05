package com.ui.model;

public class HinduMonthType {

	// Constructor with all fields
	public HinduMonthType(int hinduMonthTypeId, String hinduMonthType, String description, String status, int createdBy,
			String createdDate, String ipAddress) {
		this.hinduMonthTypeId = hinduMonthTypeId;
		this.hinduMonthType = hinduMonthType;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int hinduMonthTypeId;
	private String hinduMonthType;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getHinduMonthTypeId() {
		return hinduMonthTypeId;
	}

	public void setHinduMonthTypeId(int hinduMonthTypeId) {
		this.hinduMonthTypeId = hinduMonthTypeId;
	}

	public String getHinduMonthType() {
		return hinduMonthType;
	}

	public void setHinduMonthType(String hinduMonthType) {
		this.hinduMonthType = hinduMonthType;
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
