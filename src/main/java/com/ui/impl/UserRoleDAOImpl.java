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

import com.ui.dao.UserRoleDAO;
import com.ui.model.RolePagePermission;
import com.ui.model.UserRole;

public class UserRoleDAOImpl implements UserRoleDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(UserRoleDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<UserRole> getAllUserRoles() {
		logger.info("Inside Get All User Roles Impl");

		List<UserRole> userRoles = new ArrayList<>();
		String status = "y"; // Active roles

		String sql = "SELECT role_id, role_name, description, status, created_by, created_date, ip_address "
				+ "FROM user_role WHERE status = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserRole userRole = new UserRole(rs.getInt("role_id"), rs.getString("role_name"),
						rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
						rs.getString("created_date"), rs.getString("ip_address"));
				userRoles.add(userRole);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
		return userRoles;
	}

	@Override
	public void addUserRole(UserRole userRole) {
		logger.info("Inside Add User Role Impl");

		String sql = "INSERT INTO user_role (role_name, description, status, created_by, created_date, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, userRole.getRoleName());
			ps.setString(2, userRole.getDescription());
			ps.setString(3, userRole.getStatus());
			ps.setInt(4, userRole.getCreatedBy());
			ps.setString(5, userRole.getCreatedDate());
			ps.setString(6, userRole.getIpAddress());

			ps.executeUpdate();
			logger.info("User Role added successfully");
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public void updateUserRole(UserRole userRole) {
		logger.info("Inside Update User Role Impl");

		String sql = "UPDATE user_role SET role_name = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE role_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, userRole.getRoleName());
			ps.setString(2, userRole.getDescription());
			ps.setString(3, userRole.getStatus());
			ps.setInt(4, userRole.getCreatedBy());
			ps.setString(5, userRole.getCreatedDate());
			ps.setString(6, userRole.getIpAddress());
			ps.setInt(7, userRole.getRoleId());

			ps.executeUpdate();
			logger.info("User Role updated successfully");
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public void deleteUserRole(int roleId) {
		logger.info("Inside Delete User Role Impl");

		String sql = "UPDATE user_role SET status = 'n' WHERE role_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, roleId);

			ps.executeUpdate();
			logger.info("User Role deleted successfully");
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public List<RolePagePermission> getPagePermissionByRoleId(int roleId) {
		logger.info("Inside Get Page Permissions By Role ID Impl");

		List<RolePagePermission> permissions = new ArrayList<>();

		String sql = "SELECT p.page_id, p.page_name, rpp.read_only, rpp.read_write FROM Role_Page_Permissions rpp JOIN pages p ON rpp.page_id = p.page_id WHERE rpp.role_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, roleId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				RolePagePermission permission = new RolePagePermission(rs.getInt("page_id"), rs.getString("page_name"),
						rs.getBoolean("read_only"), rs.getBoolean("read_write"));
				permissions.add(permission);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
		return permissions;
	}

	// Utility method to close the connection
	private void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				logger.error("Error closing connection", e);
			}
		}
	}
}
