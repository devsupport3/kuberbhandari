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

import com.ui.dao.GenderDAO;
import com.ui.model.Gender;

public class GenderDAOImpl implements GenderDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(GenderDAOImpl.class);

	// Set the data source
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all genders
	@Override
	public List<Gender> getAllGenders() {
		logger.info("Fetching all genders");

		List<Gender> genders = new ArrayList<>();
		String sql = "SELECT gender_id, gender_type FROM gender";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gender gender = new Gender(rs.getInt("gender_id"), rs.getString("gender_type"));
				genders.add(gender);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			logger.error("Error fetching genders", e);
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

		return genders;
	}

	// Add a new gender
	@Override
	public void addGender(Gender gender) {
		logger.info("Adding a new gender");

		String sql = "INSERT INTO gender (gender_type) VALUES (?)";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, gender.getGenderType());

			ps.executeUpdate();
			logger.info("Gender added successfully");
		} catch (SQLException e) {
			logger.error("Error adding gender", e);
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	// Update an existing gender
	@Override
	public void updateGender(Gender gender) {
		logger.info("Updating gender with ID: {}", gender.getGenderId());

		String sql = "UPDATE gender SET gender_type = ? WHERE gender_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, gender.getGenderType());
			ps.setInt(2, gender.getGenderId());

			ps.executeUpdate();
			logger.info("Gender updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating gender", e);
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	// Delete a gender
	@Override
	public void deleteGender(int genderId) {
		logger.info("Deleting gender with ID: {}", genderId);

		String sql = "DELETE FROM gender WHERE gender_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, genderId);

			ps.executeUpdate();
			logger.info("Gender deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting gender", e);
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
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