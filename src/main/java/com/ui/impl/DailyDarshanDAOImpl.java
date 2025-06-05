package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.DailyDarshanDAO;
import com.ui.model.DailyDarshan;

public class DailyDarshanDAOImpl implements DailyDarshanDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(DailyDarshanDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public DailyDarshan addDailyDarshan(DailyDarshan dailyDarshan) {
		logger.info("Inside Add Daily Darshan Impl");

		String sql = "INSERT INTO daily_darshan (daily_darshan_title, daily_darshan_subtitle, "
				+ "daily_darshan_description, daily_darshan_date, daily_darshan_day, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, dailyDarshan.getDailyDarshanTitle());
			ps.setString(2, dailyDarshan.getDailyDarshanSubtitle());
			ps.setString(3, dailyDarshan.getDailyDarshanDescription());
			ps.setString(4, dailyDarshan.getDailyDarshanDate());
			ps.setString(5, dailyDarshan.getDailyDarshanDay());
			ps.setString(6, dailyDarshan.getStatus());
			ps.setInt(7, dailyDarshan.getCreatedBy());
			ps.setString(8, dailyDarshan.getIpAddress());

			ps.executeUpdate();
			logger.info("Daily Darshan added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					dailyDarshan.setDailyDarshanId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Daily Darshan added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding daily darshan", e);
			throw new RuntimeException("Error adding daily darshan", e);
		}
		return dailyDarshan;
	}

	@Override
	public void updateDailyDarshan(DailyDarshan dailyDarshan) {
		logger.info("Inside Edit daily darshan Impl");

		String sql = "UPDATE daily_darshan SET daily_darshan_title = ?, daily_darshan_subtitle = ?, "
				+ "daily_darshan_description = ?, daily_darshan_date = ?, "
				+ "daily_darshan_day = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE daily_darshan_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, dailyDarshan.getDailyDarshanTitle());
			ps.setString(2, dailyDarshan.getDailyDarshanSubtitle());
			ps.setString(3, dailyDarshan.getDailyDarshanDescription());
			ps.setString(4, dailyDarshan.getDailyDarshanDate());
			ps.setString(5, dailyDarshan.getDailyDarshanDay());
			ps.setString(6, dailyDarshan.getStatus());
			ps.setInt(7, dailyDarshan.getCreatedBy());
			ps.setTimestamp(8, java.sql.Timestamp.valueOf(dailyDarshan.getCreatedDate()));
			ps.setString(9, dailyDarshan.getIpAddress());
			ps.setInt(10, dailyDarshan.getDailyDarshanId());

			ps.executeUpdate();
			logger.info("Daily Darshan updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating daily darshan", e);
			throw new RuntimeException("Error updating daily darshan", e);
		}
	}

	@Override
	public boolean deleteDailyDarshan(int dailyDarshanId) {
		logger.info("Inside Delete daily Darshan Impl");

		String sql = "Delete from daily_darshan WHERE daily_darshan_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, dailyDarshanId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Daily darshan with ID: {} marked as deleted successfully", dailyDarshanId);
				return true;
			} else {
				logger.warn("No Daily darshan found with ID: {}", dailyDarshanId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting Daily darshan with ID: {}", dailyDarshanId, e);
			throw new RuntimeException("Error deleting Daily darshan", e);
		}

	}

	@Override
	public DailyDarshan getDailyDarshanById(int dailyDarshanId) {
		logger.info("Inside Get Daily Darshan By Id Impl");

		String sql = "SELECT * FROM daily_darshan WHERE daily_darshan_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, dailyDarshanId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new DailyDarshan(rs.getInt("daily_darshan_id"), rs.getString("daily_darshan_title"),
							rs.getString("daily_darshan_subtitle"), rs.getString("daily_darshan_description"),
							rs.getString("daily_darshan_date"), rs.getString("daily_darshan_day"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching daily darshan by ID", e);
			throw new RuntimeException("Error fetching daily darshan by ID", e);
		}

		return null; // return null if no record found
	}

	@Override
	public List<DailyDarshan> getAllDailyDarshan() {
		logger.info("Fetching all daily darshan");

		List<DailyDarshan> dailyDarshans = new ArrayList<>();
		String sql = "SELECT * FROM daily_darshan order by daily_darshan_id desc";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DailyDarshan dailyDarshan = new DailyDarshan(rs.getInt("daily_darshan_id"),
							rs.getString("daily_darshan_title"), rs.getString("daily_darshan_subtitle"),
							rs.getString("daily_darshan_description"), rs.getString("daily_darshan_date"),
							rs.getString("daily_darshan_day"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					dailyDarshans.add(dailyDarshan);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all daily darshan", e);
			throw new RuntimeException("Error fetching all daily darshan", e);
		}

		return dailyDarshans;
	}

	@Override
	public List<DailyDarshan> getAllActiveDailyDarshan(boolean filterToday) {

		logger.info("Inside Get All Daily Darshan Impl");

		List<DailyDarshan> dailyDarshans = new ArrayList<>();
		String status = "y";
		String sql = filterToday
				? "SELECT * FROM daily_darshan WHERE status = ? AND  daily_darshan_date = DATE_FORMAT(CURDATE(), '%d/%m/%Y')"
				: "SELECT * FROM daily_darshan WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DailyDarshan dailyDarshan = new DailyDarshan(rs.getInt("daily_darshan_id"),
							rs.getString("daily_darshan_title"), rs.getString("daily_darshan_subtitle"),
							rs.getString("daily_darshan_description"), rs.getString("daily_darshan_date"),
							rs.getString("daily_darshan_day"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					dailyDarshans.add(dailyDarshan);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching Daily Darshan", e);
			throw new RuntimeException("Error fetching Daily Darshan", e);
		}

		return dailyDarshans;
	}

}
