package com.ui.model;

public class RolePagePermission {

	public RolePagePermission(int permissionId, int roleId, int pageId, boolean readOnly, boolean readWrite) {
		super();
		this.permissionId = permissionId;
		this.roleId = roleId;
		this.pageId = pageId;
		this.readOnly = readOnly;
		this.readWrite = readWrite;
	}

	public RolePagePermission(int pageId, String pageName, boolean readOnly, boolean readWrite) {
		super();
		this.pageId = pageId;
		this.pageName = pageName;
		this.readOnly = readOnly;
		this.readWrite = readWrite;
	}

	// Properties
	private int permissionId; // Primary key for Role_Page_Permission
	private int roleId;
	private int pageId;
	private boolean readOnly;
	private boolean readWrite;
	private String pageName;

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public boolean isReadOnly() {
		return readOnly;
	}

	public void setReadOnly(boolean readOnly) {
		this.readOnly = readOnly;
	}

	public boolean isReadWrite() {
		return readWrite;
	}

	public void setReadWrite(boolean readWrite) {
		this.readWrite = readWrite;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

}
