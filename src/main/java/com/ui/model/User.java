package com.ui.model;

public class User {

	// Constructor
	public User(int userId, int roleId, int trusteeTypeId, String firstName, String middleName, String lastName,
			int genderId, String description, String mobileNo, String emailId, String password, String image,
			String status, int createdBy, String createdDate, String ipAddress) {
		this.userId = userId;
		this.roleId = roleId;
		this.trusteeTypeId = trusteeTypeId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.genderId = genderId;
		this.description = description;
		this.mobileNo = mobileNo;
		this.emailId = emailId;
		this.password = password;
		this.image = image;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	// Properties
	private int userId; // Primary key for User table
	private int roleId; // Foreign key from role table
	private int trusteeTypeId; // Foreign key from trusteetype table
	private String firstName;
	private String middleName;
	private String lastName;
	private int genderId; // Foreign key from gender table
	private String description;
	private String mobileNo;
	private String emailId;
	private String password;
	private String image;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getTrusteeTypeId() {
		return trusteeTypeId;
	}

	public void setTrusteeTypeId(int trusteeTypeId) {
		this.trusteeTypeId = trusteeTypeId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getGenderId() {
		return genderId;
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
