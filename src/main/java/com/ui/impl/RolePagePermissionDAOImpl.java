package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.RolePagePermissionDAO;
import com.ui.model.RolePagePermission;

public class RolePagePermissionDAOImpl implements RolePagePermissionDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(RolePagePermissionDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Add a new Role-Page Permission
	@Override
	public void addRolePagePermission(RolePagePermission permission) {
		logger.info("Inside Add RolePagePermission Impl");

		String sql = "INSERT INTO role_page_permission (role_id, page_id, read_only, read_write) VALUES (?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, permission.getRoleId());
			ps.setInt(2, permission.getPageId());
			ps.setBoolean(3, permission.isReadOnly());
			ps.setBoolean(4, permission.isReadWrite());

			ps.executeUpdate();
			logger.info("RolePagePermission added successfully");
		} catch (SQLException e) {
			logger.error("Error adding RolePagePermission", e);
			throw new RuntimeException(e);
		}
	}

	// Get permissions for a specific role and page
	@Override
	public RolePagePermission getRolePagePermission(int roleId, int pageId) {
		logger.info("Inside Get RolePagePermission Impl");

		String sql = "SELECT permission_id, role_id, page_id, read_only, read_write FROM role_page_permission WHERE role_id = ? AND page_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, roleId);
			ps.setInt(2, pageId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return new RolePagePermission(rs.getInt("permission_id"), rs.getInt("role_id"), rs.getInt("page_id"),
						rs.getBoolean("read_only"), rs.getBoolean("read_write"));
			}
		} catch (SQLException e) {
			logger.error("Error fetching RolePagePermission", e);
			throw new RuntimeException(e);
		}

		return null; // Return null if no matching permission is found
	}

	// Update an existing Role-Page Permission
	@Override
	public void updateRolePagePermission(RolePagePermission permission) {
		logger.info("Inside Update RolePagePermission Impl");

		String sql = "UPDATE role_page_permission SET read_only = ?, read_write = ? WHERE permission_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setBoolean(1, permission.isReadOnly());
			ps.setBoolean(2, permission.isReadWrite());
			ps.setInt(3, permission.getPermissionId());

			ps.executeUpdate();
			logger.info("RolePagePermission updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating RolePagePermission", e);
			throw new RuntimeException(e);
		}
	}

	// Delete a Role-Page Permission by setting its status (soft delete)
	@Override
	public void deleteRolePagePermission(int permissionId) {
		logger.info("Inside Delete RolePagePermission Impl");

		String sql = "DELETE FROM role_page_permission WHERE permission_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, permissionId);
			ps.executeUpdate();
			logger.info("RolePagePermission deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting RolePagePermission", e);
			throw new RuntimeException(e);
		}
	}

	// Get all permissions for a specific role
	/*
	 * @Override public List<RolePagePermission> getPermissionsByRole(int roleId) {
	 * logger.info("Inside Get Permissions By Role Impl");
	 * 
	 * List<RolePagePermission> permissionsList = new ArrayList<>(); String sql =
	 * "SELECT * FROM role_page_permission WHERE role_id = ?";
	 * 
	 * try (Connection conn = dataSource.getConnection(); PreparedStatement ps =
	 * conn.prepareStatement(sql)) {
	 * 
	 * ps.setInt(1, roleId); ResultSet rs = ps.executeQuery();
	 * 
	 * while (rs.next()) { RolePagePermission permission = new
	 * RolePagePermission(rs.getInt("permission_id"), rs.getInt("role_id"),
	 * rs.getInt("page_id"), rs.getBoolean("read_only"),
	 * rs.getBoolean("read_write")); permissionsList.add(permission); } } catch
	 * (SQLException e) { logger.error("Error fetching permissions for role", e);
	 * throw new RuntimeException(e); }
	 * 
	 * return permissionsList; }
	 */

	@Override
	public List<RolePagePermission> getPermissionsByRole(int roleId) {
		logger.info("Fetching permissions with page info for roleId: " + roleId);

		List<RolePagePermission> permissionsList = new ArrayList<>();

		String sql = "SELECT rpp.permission_id, rpp.role_id, rpp.page_id, rpp.read_only, rpp.read_write, p.page_name "
				+ "FROM role_page_permission rpp " + "INNER JOIN pages p ON rpp.page_id = p.page_id "
				+ "WHERE rpp.role_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, roleId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				RolePagePermission permission = new RolePagePermission(rs.getInt("permission_id"), rs.getInt("role_id"),
						rs.getInt("page_id"), rs.getBoolean("read_only"), rs.getBoolean("read_write"));
				permission.setPageName(rs.getString("page_name"));
				permissionsList.add(permission);
			}
		} catch (SQLException e) {
			logger.error("Error fetching permissions for role " + roleId, e);
			throw new RuntimeException(e);
		}

		return permissionsList;
	}

}
