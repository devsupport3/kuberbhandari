package com.ui.model;

public class SevaType {

	// Constructor with all fields
	public SevaType(int sevaTypeId, String sevaTypeName, String description, String image, String status, int createdBy,
			String createdDate, String ipAddress) {
		this.sevaTypeId = sevaTypeId;
		this.sevaTypeName = sevaTypeName;
		this.description = description;
		this.image = image;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int sevaTypeId;
	private String sevaTypeName;
	private String description;
	private String image;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getSevaTypeId() {
		return sevaTypeId;
	}

	public void setSevaTypeId(int sevaTypeId) {
		this.sevaTypeId = sevaTypeId;
	}

	public String getSevaTypeName() {
		return sevaTypeName;
	}

	public void setSevaTypeName(String sevaTypeName) {
		this.sevaTypeName = sevaTypeName;
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
