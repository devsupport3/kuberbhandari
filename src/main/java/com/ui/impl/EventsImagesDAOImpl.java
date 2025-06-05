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

import com.ui.dao.EventsImagesDAO;
import com.ui.model.EventsImages;

public class EventsImagesDAOImpl implements EventsImagesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(EventsImagesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addEventImage(EventsImages eventImage) {
		logger.info("Inside Add eventImage Impl");

		String sql = "INSERT INTO event_images (event_id, event_image_title, event_image_description, event_image, "
				+ "status, created_by, ip_address) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, eventImage.getEventId());
			ps.setString(2, eventImage.getEventImageTitle());
			ps.setString(3, eventImage.getEventImageDescription());
			ps.setString(4, eventImage.getEventImage());
			ps.setString(5, eventImage.getStatus());
			ps.setInt(6, eventImage.getCreatedBy());
			ps.setString(7, eventImage.getIpAddress());

			ps.executeUpdate();
			logger.info("Event image added successfully");
		} catch (SQLException e) {
			logger.error("Error adding event image", e);
			throw new RuntimeException("Error adding event image", e);
		}
	}

	@Override
	public void updateEventImage(EventsImages eventImage) {
		logger.info("Inside Edit eventImage Impl");

		String sql = "UPDATE event_images SET event_id = ?, event_image_title = ?, event_image_description = ?, "
				+ "event_image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE event_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, eventImage.getEventId());
			ps.setString(2, eventImage.getEventImageTitle());
			ps.setString(3, eventImage.getEventImageDescription());
			ps.setString(4, eventImage.getEventImage());
			ps.setString(5, eventImage.getStatus());
			ps.setInt(6, eventImage.getCreatedBy());
			ps.setTimestamp(7, java.sql.Timestamp.valueOf(eventImage.getCreatedDate()));
			ps.setString(8, eventImage.getIpAddress());
			ps.setInt(9, eventImage.getEventImageId());

			ps.executeUpdate();
			logger.info("Event image updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating event image", e);
			throw new RuntimeException("Error updating event image", e);
		}
	}

	@Override
	public boolean deleteEventImage(int eventImageId) {
		logger.info("Inside Delete eventImage Impl");

		String sql = "Delete from event_images WHERE event_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, eventImageId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("event image with ID: {} marked as deleted successfully", eventImageId);
				return true;
			} else {
				logger.warn("No event image found with ID: {}", eventImageId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting event image with ID: {}", eventImageId, e);
			throw new RuntimeException("Error deleting event image", e);
		}
	}

	@Override
	public List<EventsImages> getAllEventImages() {
		logger.info("Fetching all eventImages");

		List<EventsImages> eventImagesList = new ArrayList<>();
		String sql = "SELECT * FROM event_images";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					EventsImages eventImage = new EventsImages(rs.getInt("event_image_id"), rs.getInt("event_id"),
							rs.getString("event_image_title"), rs.getString("event_image_description"),
							rs.getString("event_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					eventImagesList.add(eventImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all eventImages", e);
			throw new RuntimeException("Error fetching all eventImages", e);
		}

		return eventImagesList;
	}

	@Override
	public List<EventsImages> getAllActiveEventImages() {
		logger.info("Inside Get All eventImages Impl");

		List<EventsImages> eventImagesList = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM event_images WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					EventsImages eventImage = new EventsImages(rs.getInt("event_image_id"), rs.getInt("event_id"),
							rs.getString("event_image_title"), rs.getString("event_image_description"),
							rs.getString("event_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					eventImagesList.add(eventImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching event images", e);
			throw new RuntimeException("Error fetching event images", e);
		}

		return eventImagesList;
	}

	@Override
	public EventsImages getEventImageById(int eventImageId) {
		logger.info("Inside Get eventImage By Id Impl");

		String sql = "SELECT * FROM event_images WHERE event_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, eventImageId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new EventsImages(rs.getInt("event_image_id"), rs.getInt("event_id"),
							rs.getString("event_image_title"), rs.getString("event_image_description"),
							rs.getString("event_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching event image by ID", e);
			throw new RuntimeException("Error fetching event image by ID", e);
		}

		return null; // return null if no record found
	}

	@Override
	public List<EventsImages> getAllEventImagesByEventId(int eventId) {
		logger.info("Inside Get All eventImages Impl");

		List<EventsImages> eventImagesList = new ArrayList<>();

		String sql = "SELECT * FROM event_images WHERE event_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, eventId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					EventsImages eventImage = new EventsImages(rs.getInt("event_image_id"), rs.getInt("event_id"),
							rs.getString("event_image_title"), rs.getString("event_image_description"),
							rs.getString("event_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					eventImagesList.add(eventImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching event images", e);
			throw new RuntimeException("Error fetching event images", e);
		}

		return eventImagesList;
	}
}