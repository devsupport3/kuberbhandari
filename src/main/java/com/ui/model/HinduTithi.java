package com.ui.model;

public class HinduTithi {

	// Constructor with all fields
	public HinduTithi(int hinduTithiId, String tithiName, String tithiNameAlias, String description, String status,
			int createdBy, String createdDate, String ipAddress) {
		this.hinduTithiId = hinduTithiId;
		this.tithiName = tithiName;
		this.tithiNameAlias = tithiNameAlias;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int hinduTithiId;
	private String tithiName;
	private String tithiNameAlias;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getHinduTithiId() {
		return hinduTithiId;
	}

	public void setHinduTithiId(int hinduTithiId) {
		this.hinduTithiId = hinduTithiId;
	}

	public String getTithiName() {
		return tithiName;
	}

	public void setTithiName(String tithiName) {
		this.tithiName = tithiName;
	}

	public String getTithiNameAlias() {
		return tithiNameAlias;
	}

	public void setTithiNameAlias(String tithiNameAlias) {
		this.tithiNameAlias = tithiNameAlias;
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
