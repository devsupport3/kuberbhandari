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

import com.ui.dao.GalleryImagesDAO;
import com.ui.model.GalleryImages;

public class GalleryImagesDAOImpl implements GalleryImagesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(GalleryImagesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addGalleryImage(GalleryImages galleryImages) {
		logger.info("Inside Add Gallery Image Impl");

		String sql = "INSERT INTO album_image (album_id, image_title, image_description, image, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, galleryImages.getAlbumId());
			ps.setString(2, galleryImages.getImageTitle());
			ps.setString(3, galleryImages.getImageDescription());
			ps.setString(4, galleryImages.getImage());
			ps.setString(5, galleryImages.getStatus());
			ps.setInt(6, galleryImages.getCreatedBy());
			ps.setString(7, galleryImages.getIpAddress());

			ps.executeUpdate();
			logger.info("Gallery image added successfully");
		} catch (SQLException e) {
			logger.error("Error adding gallery image", e);
			throw new RuntimeException("Error adding gallery image", e);
		}
	}

	@Override
	public void updateGalleryImage(GalleryImages galleryImages) {
		logger.info("Inside Edit Gallery Image Impl");

		String sql = "UPDATE album_image SET album_id = ?, image_title = ?, image_description = ?, "
				+ "image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE album_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, galleryImages.getAlbumId());
			ps.setString(2, galleryImages.getImageTitle());
			ps.setString(3, galleryImages.getImageDescription());
			ps.setString(4, galleryImages.getImage());
			ps.setString(5, galleryImages.getStatus());
			ps.setInt(6, galleryImages.getCreatedBy());
			ps.setTimestamp(7, java.sql.Timestamp.valueOf(galleryImages.getCreatedDate()));
			ps.setString(8, galleryImages.getIpAddress());
			ps.setInt(9, galleryImages.getAlbumImageId());

			ps.executeUpdate();
			logger.info("Gallery image updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating Gallery image", e);
			throw new RuntimeException("Error updating Gallery image", e);
		}
	}

	@Override
	public boolean deleteGalleryImage(int albumImageId) {
		logger.info("Inside Delete Gallery Image Impl");

		String sql = "DELETE FROM album_image WHERE album_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, albumImageId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Gallery image with ID: {} deleted successfully", albumImageId);
				return true;
			} else {
				logger.warn("No gallery image found with ID: {}", albumImageId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting gallery image with ID: {}", albumImageId, e);
			throw new RuntimeException("Error deleting gallery image", e);
		}
	}

	@Override
	public List<GalleryImages> getAllGalleryImagesByGalleryId(int albumId) {
		logger.info("Inside Get All Gallery Images Impl");

		List<GalleryImages> galleryImagesList = new ArrayList<>();

		String sql = "SELECT * FROM album_image WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, albumId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					GalleryImages galleryImage = new GalleryImages(rs.getInt("album_image_id"), rs.getInt("album_id"),
							rs.getString("image_title"), rs.getString("image_description"), rs.getString("image"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					galleryImagesList.add(galleryImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching Gallery images", e);
			throw new RuntimeException("Error fetching Gallery images", e);
		}

		return galleryImagesList;
	}

	@Override
	public List<GalleryImages> getAllGalleryImagesByAlbumId(int albumId) {

		logger.info("Inside Get All galleryImages Impl");

		List<GalleryImages> galleryImagesList = new ArrayList<>();

		String sql = "SELECT * FROM album_image WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, albumId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					GalleryImages galleryImage = new GalleryImages(rs.getInt("album_image_id"), rs.getInt("album_id"),
							rs.getString("image_title"), rs.getString("image_description"), rs.getString("image"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					galleryImagesList.add(galleryImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching gallery images", e);
			throw new RuntimeException("Error fetching gallery images", e);
		}

		return galleryImagesList;
	}

	@Override
	public void deleteGalleryImagesByAlbumId(int albumId) {
		logger.info("Deleting all images for album ID: {}", albumId);

		String sql = "DELETE FROM album_image WHERE album_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, albumId);
			ps.executeUpdate();

			logger.info("Images deleted for album ID: {}", albumId);

		} catch (SQLException e) {
			logger.error("Error deleting images for album ID: {}", albumId, e);
			throw new RuntimeException("Failed to delete gallery images", e);
		}
	}

}