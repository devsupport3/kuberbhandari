package com.ui.dao;

import com.ui.model.User;

public interface LoginDAO {

	/* Front User */
	boolean isExistUserEmail(String email);

	boolean isValidUser(String email, String password);

	String changePassword(String email, String currentPassword, String newPassword, String confirmPassword);

	boolean resetPassword(String email, String newPassword);

	User getUserDetail(String email);

	int getUserRoleIdByEmail(String email);

	/* Admin */
	boolean isValidAdminUser(String email, String password);

}
