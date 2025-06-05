package com.ui.model;

public class Country {

	// Constructor
	public Country(int countryId, String countryName, String countryDiallingCode, String countryFlagImage,
			String countryMapImage, String status, int createdBy, String createdDate, String ipAddress) {
		this.countryId = countryId;
		this.countryName = countryName;
		this.countryDiallingCode = countryDiallingCode;
		this.countryFlagImage = countryFlagImage;
		this.countryMapImage = countryMapImage;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int countryId; // Primary key for Country
	private String countryName;
	private String countryDiallingCode;
	private String countryFlagImage;
	private String countryMapImage;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters and Setters
	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getCountryDiallingCode() {
		return countryDiallingCode;
	}

	public void setCountryDiallingCode(String countryDiallingCode) {
		this.countryDiallingCode = countryDiallingCode;
	}

	public String getCountryFlagImage() {
		return countryFlagImage;
	}

	public void setCountryFlagImage(String countryFlagImage) {
		this.countryFlagImage = countryFlagImage;
	}

	public String getCountryMapImage() {
		return countryMapImage;
	}

	public void setCountryMapImage(String countryMapImage) {
		this.countryMapImage = countryMapImage;
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
