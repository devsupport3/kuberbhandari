package com.ui.model;

public class Gender {

	public Gender(int genderId, String genderType) {
		this.genderId = genderId;
		this.genderType = genderType;

	}

	// Properties
	private int genderId; // Primary key for Gender
	private String genderType; // male or female

	public int getGenderId() {
		return genderId;
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}

	public String getGenderType() {
		return genderType;
	}

	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}

}
