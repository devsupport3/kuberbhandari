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

import com.ui.dao.UserTitleDAO;
import com.ui.model.UserTitle;

public class UserTitleDAOImpl implements UserTitleDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(UserTitleDAOImpl.class);

	// Set the data source
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all active user titles
	@Override
	public List<UserTitle> getAllUserTitles() {
		logger.info("Inside Get All UserTitles Impl");

		List<UserTitle> userTitles = new ArrayList<>();
		String status = "y"; // Active user titles

		String sql = "SELECT user_title_id, user_title, user_title_description, image, status, created_by, created_date, ip_address "
				+ "FROM users_title WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					UserTitle userTitle = new UserTitle(rs.getInt("user_title_id"), rs.getString("user_title"),
							rs.getString("user_title_description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getString("created_date"), rs.getString("ip_address"));
					userTitles.add(userTitle);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching user titles", e);
			throw new RuntimeException("Error fetching user titles", e);
		}

		return userTitles;
	}

	// Add a new user title
	@Override
	public void addUserTitle(UserTitle userTitle) {
		logger.info("Inside Add UserTitle Impl");

		String sql = "INSERT INTO users_title (user_title, user_title_description, image, status, created_by, created_date, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, userTitle.getUserTitle());
			ps.setString(2, userTitle.getUserTitleDescription());
			ps.setString(3, userTitle.getImage());
			ps.setString(4, userTitle.getStatus());
			ps.setInt(5, userTitle.getCreatedBy());
			ps.setString(6, userTitle.getCreatedDate());
			ps.setString(7, userTitle.getIpAddress());

			ps.executeUpdate();
			logger.info("User title added successfully");
		} catch (SQLException e) {
			logger.error("Error adding user title", e);
			throw new RuntimeException("Error adding user title", e);
		}
	}

	// Update an existing user title
	@Override
	public void editUserTitle(UserTitle userTitle) {
		logger.info("Inside Edit UserTitle Impl");

		String sql = "UPDATE users_title SET user_title = ?, user_title_description = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE user_title_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, userTitle.getUserTitle());
			ps.setString(2, userTitle.getUserTitleDescription());
			ps.setString(3, userTitle.getImage());
			ps.setString(4, userTitle.getStatus());
			ps.setInt(5, userTitle.getCreatedBy());
			ps.setString(6, userTitle.getCreatedDate());
			ps.setString(7, userTitle.getIpAddress());
			ps.setInt(8, userTitle.getUserTitleId());

			ps.executeUpdate();
			logger.info("User title updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating user title", e);
			throw new RuntimeException("Error updating user title", e);
		}
	}

	// Soft delete a user title by setting status to 'n'
	@Override
	public void deleteUserTitle(int userTitleId) {
		logger.info("Inside Delete UserTitle Impl");

		String sql = "UPDATE users_title SET status = 'n' WHERE user_title_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userTitleId);
			ps.executeUpdate();
			logger.info("User title deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting user title", e);
			throw new RuntimeException("Error deleting user title", e);
		}
	}
}
