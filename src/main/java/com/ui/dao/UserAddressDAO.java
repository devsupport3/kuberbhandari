package com.ui.dao;

import java.util.List;

import com.ui.model.UserAddress;

public interface UserAddressDAO {

	void addUserAddress(UserAddress userAddress);

	UserAddress getUserAddressById(int userAddressId);

	void updateUserAddress(UserAddress userAddress);

	void deleteUserAddress(int userAddressId);

	List<UserAddress> getAllUserAddressesByUserId(int userID);

}
