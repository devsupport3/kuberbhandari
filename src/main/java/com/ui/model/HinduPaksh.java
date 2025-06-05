package com.ui.model;

public class HinduPaksh {

	// Constructor with all fields
	public HinduPaksh(int hinduPakshId, String pakshName, String pakshNameAlias, String description, String status,
			int createdBy, String createdDate, String ipAddress) {
		this.hinduPakshId = hinduPakshId;
		this.pakshName = pakshName;
		this.pakshNameAlias = pakshNameAlias;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int hinduPakshId;
	private String pakshName;
	private String pakshNameAlias;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getHinduPakshId() {
		return hinduPakshId;
	}

	public void setHinduPakshId(int hinduPakshId) {
		this.hinduPakshId = hinduPakshId;
	}

	public String getPakshName() {
		return pakshName;
	}

	public void setPakshName(String pakshName) {
		this.pakshName = pakshName;
	}

	public String getPakshNameAlias() {
		return pakshNameAlias;
	}

	public void setPakshNameAlias(String pakshNameAlias) {
		this.pakshNameAlias = pakshNameAlias;
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
