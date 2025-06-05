package com.ui.model;

public class UserAddress {

	public UserAddress() {

	}

	// Constructor
	public UserAddress(int userAddressId, int userId, String fullName, String address1, String address2,
			String cityName, String stateName, int countryId, int createdBy, String createdDate, String pincode,
			String status, String ipAddress, String mobileNo, String emailId, String countryName) {
		this.userAddressId = userAddressId;
		this.userId = userId;
		this.fullName = fullName;
		this.address1 = address1;
		this.address2 = address2;
		this.cityName = cityName;
		this.stateName = stateName;
		this.countryId = countryId;
		this.pincode = pincode;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
		this.mobileNo = mobileNo;
		this.emailId = emailId;
		this.countryName = countryName;
	}

	// Properties
	private int userAddressId; // Primary key for User_Address
	private int userId; // Foreign key from users table
	private String fullName;
	private String address1;
	private String address2;
	private String cityName;
	private String stateName;
	private int countryId; // Foreign key from country
	private String pincode;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	private String mobileNo;
	private String emailId;
	private String countryName;

	// Getters and Setters
	public int getUserAddressId() {
		return userAddressId;
	}

	public void setUserAddressId(int userAddressId) {
		this.userAddressId = userAddressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
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

	public String getMobileNo() {
		return mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

}
