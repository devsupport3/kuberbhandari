package com.ui.enums;

public enum UserRoleEnum {

	superadmin(1), admin(2), user(3), pujaris(4), trustees(5), employee(6), supplier(7);

	private final int value; // Field to hold the value

	// Constructor for the enum
	UserRoleEnum(int value) {
		this.value = value;
	}

	// Getter method to access the value
	public int getValue() {
		return value;
	}
}
