package com.ui.dao;

import java.util.List;

import com.ui.model.RolePagePermission;
import com.ui.model.UserRole;

public interface UserRoleDAO {

	List<UserRole> getAllUserRoles();

	void addUserRole(UserRole userRole);

	void updateUserRole(UserRole userRole);

	void deleteUserRole(int roleId);

	List<RolePagePermission> getPagePermissionByRoleId(int roleId);

}
