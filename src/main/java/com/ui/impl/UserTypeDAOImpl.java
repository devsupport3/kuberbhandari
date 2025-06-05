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

import com.ui.dao.UserTypeDAO;
import com.ui.model.UserType;

public class UserTypeDAOImpl implements UserTypeDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(UserTypeDAOImpl.class);

	// Set the data source
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all active user types
	@Override
	public List<UserType> getAllUserTypes() {
		logger.info("Inside Get All UserTypes Impl");

		List<UserType> userTypes = new ArrayList<>();
		String status = "y"; // Active user types

		String sql = "SELECT user_type_id, user_type_name, status, created_by, created_date, ip_address "
				+ "FROM user_type WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					UserType userType = new UserType(rs.getInt("user_type_id"), rs.getString("user_type_name"),
							rs.getString("status"), rs.getInt("created_by"), rs.getString("created_date"),
							rs.getString("ip_address"));
					userTypes.add(userType);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching user types", e);
			throw new RuntimeException("Error fetching user types", e);
		}

		return userTypes;
	}

	// Add a new user type
	@Override
	public void addUserType(UserType userType) {
		logger.info("Inside Add UserType Impl");

		String sql = "INSERT INTO user_type (user_type_name, status, created_by, created_date, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, userType.getUserTypeName());
			ps.setString(2, userType.getStatus());
			ps.setInt(3, userType.getCreatedBy());
			ps.setString(4, userType.getCreatedDate());
			ps.setString(5, userType.getIpAddress());

			ps.executeUpdate();
			logger.info("User type added successfully");
		} catch (SQLException e) {
			logger.error("Error adding user type", e);
			throw new RuntimeException("Error adding user type", e);
		}
	}

	// Update an existing user type
	@Override
	public void editUserType(UserType userType) {
		logger.info("Inside Edit UserType Impl");

		String sql = "UPDATE user_type SET user_type_name = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE user_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, userType.getUserTypeName());
			ps.setString(2, userType.getStatus());
			ps.setInt(3, userType.getCreatedBy());
			ps.setString(4, userType.getCreatedDate());
			ps.setString(5, userType.getIpAddress());
			ps.setInt(6, userType.getUserTypeId());

			ps.executeUpdate();
			logger.info("User type updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating user type", e);
			throw new RuntimeException("Error updating user type", e);
		}
	}

	// Soft delete a user type by setting status to 'n'
	@Override
	public void deleteUserType(int userTypeId) {
		logger.info("Inside Delete UserType Impl");

		String sql = "UPDATE user_type SET status = 'n' WHERE user_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userTypeId);
			ps.executeUpdate();
			logger.info("User type deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting user type", e);
			throw new RuntimeException("Error deleting user type", e);
		}
	}
}
