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

import com.ui.dao.GalleryDAO;
import com.ui.model.Gallery;

public class GalleryDAOImpl implements GalleryDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(GalleryDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Gallery addGallery(Gallery gallery) {
		logger.info("Inside Add Gallery Impl");

		String sql = "INSERT INTO album (album_title, album_subtitle, album_date, description, "
				+ "status, created_by, ip_address) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, gallery.getAlbumTitle());
			ps.setString(2, gallery.getAlbumSubtitle());
			ps.setString(3, gallery.getAlbumDate());
			ps.setString(4, gallery.getDescription());
			ps.setString(5, gallery.getStatus());
			ps.setInt(6, gallery.getCreatedBy());
			ps.setString(7, gallery.getIpAddress());

			ps.executeUpdate();
			logger.info("Gallery added successfully");

			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1);
					gallery.setAlbumId(generatedId);
					logger.info("Gallery added with ID: " + generatedId);
				}
			}

		} catch (SQLException e) {
			logger.error("Error adding gallery", e);
			throw new RuntimeException("Error adding gallery", e);
		}

		return gallery;
	}

	@Override
	public void updateGallery(Gallery gallery) {
		logger.info("Inside Edit Gallery Impl");

		String sql = "UPDATE album SET album_title = ?, album_subtitle = ?, "
				+ "album_date = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, gallery.getAlbumTitle());
			ps.setString(2, gallery.getAlbumSubtitle());
			ps.setString(3, gallery.getAlbumDate());
			ps.setString(4, gallery.getDescription());
			ps.setString(5, gallery.getStatus());
			ps.setInt(6, gallery.getCreatedBy());
			ps.setTimestamp(7, java.sql.Timestamp.valueOf(gallery.getCreatedDate()));
			ps.setString(8, gallery.getIpAddress());
			ps.setInt(9, gallery.getAlbumId());

			ps.executeUpdate();
			logger.info("Gallery updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating gallery", e);
			throw new RuntimeException("Error updating gallery", e);
		}
	}

	@Override
	public boolean deleteGallery(int albumId) {
		logger.info("Inside Delete Gallery Impl");

		String sql = "DELETE FROM album WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, albumId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Gallery with ID: {} deleted successfully", albumId);
				return true;
			} else {
				logger.warn("No gallery found with ID: {}", albumId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting gallery with ID: {}", albumId, e);
			throw new RuntimeException("Error deleting gallery", e);
		}
	}

	@Override
	public List<Gallery> getAllGallery() {
		logger.info("Fetching all gallery");

		List<Gallery> galleries = new ArrayList<>();
		String sql = "SELECT * FROM album ORDER BY album_id DESC";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Gallery gallery = new Gallery(rs.getInt("album_id"), rs.getString("album_title"),
							rs.getString("album_subtitle"), rs.getString("album_date"), rs.getString("description"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					galleries.add(gallery);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all galleries", e);
			throw new RuntimeException("Error fetching all galleries", e);
		}

		return galleries;
	}

	@Override
	public Gallery getGalleryById(int albumId) {

		logger.info("Fetching gallery by ID: " + albumId);

		String sql = "SELECT * FROM album WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, albumId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Gallery(rs.getInt("album_id"), rs.getString("album_title"),
							rs.getString("album_subtitle"), rs.getString("album_date"), rs.getString("description"),
							rs.getString("status"), rs.getInt("created_by"), rs.getString("created_date"),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching gallery by ID", e);
			throw new RuntimeException("Error fetching gallery by ID", e);
		}
		return null;
	}

	@Override
	public List<Gallery> getAllActiveGallery() {

		logger.info("Fetching all active gallery");

		List<Gallery> galleries = new ArrayList<>();
		String status = "y";
		String sql = "SELECT * FROM album WHERE status = ? ORDER BY album_id DESC";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Gallery gallery = new Gallery(rs.getInt("album_id"), rs.getString("album_title"),
							rs.getString("album_subtitle"), rs.getString("album_date"), rs.getString("description"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					galleries.add(gallery);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching active gallery", e);
			throw new RuntimeException("Error fetching active gallery", e);
		}

		return galleries;
	}

}