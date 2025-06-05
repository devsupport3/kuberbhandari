package com.ui.dao;

import java.util.List;

import com.ui.model.UserType;

public interface UserTypeDAO {

	List<UserType> getAllUserTypes();

	void addUserType(UserType userType);

	void editUserType(UserType userType);

	void deleteUserType(int userTypeId);

}
