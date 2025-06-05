package com.ui.model;

public class TrusteeType {

	// Constructor
	public TrusteeType(int trusteeTypeId, String trusteeTypeName, String status, int createdBy, String createdDate,
			String ipAddress) {
		this.trusteeTypeId = trusteeTypeId;
		this.trusteeTypeName = trusteeTypeName;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int trusteeTypeId; // Primary key for trustee type
	private String trusteeTypeName; // Individual trustee or Pujaris trustee
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getTrusteeTypeId() {
		return trusteeTypeId;
	}

	public void setTrusteeTypeId(int trusteeTypeId) {
		this.trusteeTypeId = trusteeTypeId;
	}

	public String getTrusteeTypeName() {
		return trusteeTypeName;
	}

	public void setTrusteeTypeName(String trusteeTypeName) {
		this.trusteeTypeName = trusteeTypeName;
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
