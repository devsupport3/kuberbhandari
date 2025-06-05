package com.ui.dao;

import java.util.List;

import com.ui.model.RolePagePermission;

public interface RolePagePermissionDAO {

	void addRolePagePermission(RolePagePermission permission);

	RolePagePermission getRolePagePermission(int roleId, int pageId);

	void updateRolePagePermission(RolePagePermission permission);

	void deleteRolePagePermission(int permissionId);

	List<RolePagePermission> getPermissionsByRole(int roleId);

}
