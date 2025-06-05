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

import com.ui.dao.DailyDarshanImagesDAO;
import com.ui.model.DailyDarshanImages;

public class DailyDarshanImagesDAOImpl implements DailyDarshanImagesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(DailyDarshanImagesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addDailyDarshanImage(DailyDarshanImages dailyDarshanImages) {
		logger.info("Inside Add DailyDarshanImage Impl");

		String sql = "INSERT INTO daily_darshan_images (daily_darshan_id, image_title, image_description, daily_darshan_images, image_input_type, youtube_url, "
				+ "status, created_by, ip_address) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, dailyDarshanImages.getDailyDarshanId());
			ps.setString(2, dailyDarshanImages.getImageTitle());
			ps.setString(3, dailyDarshanImages.getImageDescription());
			ps.setString(4, dailyDarshanImages.getDailyDarshanImages());
			ps.setString(5, dailyDarshanImages.getImageInputType());
			ps.setString(6, dailyDarshanImages.getYouTubeUrl());
			ps.setString(7, dailyDarshanImages.getStatus());
			ps.setInt(8, dailyDarshanImages.getCreatedBy());
			ps.setString(9, dailyDarshanImages.getIpAddress());

			ps.executeUpdate();
			logger.info("Daily Darshan image added successfully");
		} catch (SQLException e) {
			logger.error("Error adding Daily Darshan image", e);
			throw new RuntimeException("Error adding Daily Darshan image", e);
		}
	}

	@Override
	public void updateDailyDarshanImage(DailyDarshanImages dailyDarshanImages) {
		logger.info("Inside Edit Daily Darshan Image Impl");

		String sql = "UPDATE daily_darshan_images SET daily_darshan_id = ?, image_title = ?, image_description = ?, "
				+ "daily_darshan_images = ?, image_input_type = ?, youtube_url = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE daily_darshan_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, dailyDarshanImages.getDailyDarshanId());
			ps.setString(2, dailyDarshanImages.getImageTitle());
			ps.setString(3, dailyDarshanImages.getImageDescription());
			ps.setString(4, dailyDarshanImages.getDailyDarshanImages());
			ps.setString(5, dailyDarshanImages.getImageInputType());
			ps.setString(6, dailyDarshanImages.getYouTubeUrl());
			ps.setString(7, dailyDarshanImages.getStatus());
			ps.setInt(8, dailyDarshanImages.getCreatedBy());
			ps.setTimestamp(9, java.sql.Timestamp.valueOf(dailyDarshanImages.getCreatedDate()));
			ps.setString(10, dailyDarshanImages.getIpAddress());
			ps.setInt(11, dailyDarshanImages.getDailyDarshanImageId());

			ps.executeUpdate();
			logger.info("Daily Darshan image updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating Daily Darshan image", e);
			throw new RuntimeException("Error updating Daily Darshan image", e);
		}
	}

	@Override
	public boolean deleteDailyDarshanImage(int dailyDarshanImageId) {
		logger.info("Inside Delete Daily Darshan Image Impl");

		String sql = "Delete from daily_darshan_images WHERE daily_darshan_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, dailyDarshanImageId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Daily Darshan image with ID: {} marked as deleted successfully", dailyDarshanImageId);
				return true;
			} else {
				logger.warn("No daily darshan image found with ID: {}", dailyDarshanImageId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting daily darshan image with ID: {}", dailyDarshanImageId, e);
			throw new RuntimeException("Error deleting daily darshan image", e);
		}
	}

	@Override
	public boolean deleteDailyDarshanImages(int dailyDarshanId) {

		logger.info("Inside Delete Daily Darshan Image Impl");

		String sql = "Delete from daily_darshan_images WHERE daily_darshan_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, dailyDarshanId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Daily Darshan image with ID: {} marked as deleted successfully", dailyDarshanId);
				return true;
			} else {
				logger.warn("No daily darshan image found with ID: {}", dailyDarshanId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting daily darshan image with ID: {}", dailyDarshanId, e);
			throw new RuntimeException("Error deleting daily darshan image", e);
		}
	}

	@Override
	public DailyDarshanImages getDailyDarshanImageById(int dailyDarshanImageId) {
		logger.info("Inside Get Daily Darshan Image By Id Impl");

		String sql = "SELECT * FROM daily_darshan_images WHERE daily_darshan_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, dailyDarshanImageId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new DailyDarshanImages(rs.getInt("daily_darshan_image_id"), rs.getInt("daily_darshan_id"),
							rs.getString("image_title"), rs.getString("image_description"),
							rs.getString("daily_darshan_images"), rs.getString("image_input_type"), rs.getString("youtube_url"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching daily darshan image by ID", e);
			throw new RuntimeException("Error fetching daily darshan image by ID", e);
		}

		return null; // return null if no record found
	}

	@Override
	public List<DailyDarshanImages> getAllDailyDarshanImagesByDailyDarshanId(int dailyDarshanId) {
		logger.info("Inside Get All daily darshan Images Impl");

		List<DailyDarshanImages> dailyDarshanImagesList = new ArrayList<>();

		String sql = "SELECT * FROM daily_darshan_images WHERE daily_darshan_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, dailyDarshanId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DailyDarshanImages dailyDarshanImage = new DailyDarshanImages(rs.getInt("daily_darshan_image_id"),
							rs.getInt("daily_darshan_id"), rs.getString("image_title"),
							rs.getString("image_description"), rs.getString("daily_darshan_images"), rs.getString("image_input_type"),
							rs.getString("youtube_url"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					dailyDarshanImagesList.add(dailyDarshanImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching Daily Darshan images", e);
			throw new RuntimeException("Error fetching Daily Darshan images", e);
		}

		return dailyDarshanImagesList;
	}

	@Override
	public List<DailyDarshanImages> getAllDailyDarshanImages() {
		logger.info("Fetching all DailyDarshanImages");

		List<DailyDarshanImages> dailyDarshanImagesList = new ArrayList<>();
		String sql = "SELECT * FROM daily_darshan_images";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DailyDarshanImages dailyDarshanImage = new DailyDarshanImages(rs.getInt("daily_darshan_image_id"),
							rs.getInt("daily_darshan_id"), rs.getString("image_title"),
							rs.getString("image_description"), rs.getString("daily_darshan_images"), rs.getString("image_input_type"),
							rs.getString("youtube_url"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					dailyDarshanImagesList.add(dailyDarshanImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all DailyDarshanImages", e);
			throw new RuntimeException("Error fetching all DailyDarshanImages", e);
		}

		return dailyDarshanImagesList;
	}

	@Override
	public List<DailyDarshanImages> getAllActiveDailyDarshanImages() {
		logger.info("Inside Get All DailyDarshanImages Impl");

		List<DailyDarshanImages> dailyDarshanImagesList = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM daily_darshan_images WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DailyDarshanImages dailyDarshanImage = new DailyDarshanImages(rs.getInt("daily_darshan_image_id"),
							rs.getInt("daily_darshan_id"), rs.getString("image_title"),
							rs.getString("image_description"), rs.getString("daily_darshan_images"), rs.getString("image_input_type"),
							rs.getString("youtube_url"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					dailyDarshanImagesList.add(dailyDarshanImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching daily Darshan images", e);
			throw new RuntimeException("Error fetching daily Darshan images", e);
		}

		return dailyDarshanImagesList;
	}
}
