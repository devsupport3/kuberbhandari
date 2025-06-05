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

import com.ui.dao.SevaImagesDAO;
import com.ui.model.SevaImages;

public class SevaImagesDAOImpl implements SevaImagesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(SevaImagesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addSevaImage(SevaImages sevaImages) {
		logger.info("Inside Add SevaImage Impl");

		String sql = "INSERT INTO seva_images (seva_id, image_title, image_description, seva_images, "
				+ "status, created_by, ip_address) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaImages.getSevaId());
			ps.setString(2, sevaImages.getImageTitle());
			ps.setString(3, sevaImages.getImageDescription());
			ps.setString(4, sevaImages.getSevaImages());
			ps.setString(5, sevaImages.getStatus());
			ps.setInt(6, sevaImages.getCreatedBy());
			ps.setString(7, sevaImages.getIpAddress());

			ps.executeUpdate();
			logger.info("Seva image added successfully");
		} catch (SQLException e) {
			logger.error("Error adding seva image", e);
			throw new RuntimeException("Error adding seva image", e);
		}
	}

	@Override
	public void editSevaImage(SevaImages sevaImages) {
		logger.info("Inside Edit SevaImage Impl");

		String sql = "UPDATE seva_images SET seva_id = ?, image_title = ?, image_description = ?, "
				+ "seva_images = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE seva_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaImages.getSevaId());
			ps.setString(2, sevaImages.getImageTitle());
			ps.setString(3, sevaImages.getImageDescription());
			ps.setString(4, sevaImages.getSevaImages());
			ps.setString(5, sevaImages.getStatus());
			ps.setInt(6, sevaImages.getCreatedBy());
			ps.setTimestamp(7, java.sql.Timestamp.valueOf(sevaImages.getCreatedDate()));
			ps.setString(8, sevaImages.getIpAddress());
			ps.setInt(9, sevaImages.getSevaImageId());

			ps.executeUpdate();
			logger.info("Seva image updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating seva image", e);
			throw new RuntimeException("Error updating seva image", e);
		}
	}

	@Override
	public boolean deleteSevaImage(int sevaImageId) {
		logger.info("Inside Delete SevaImage Impl");

		String sql = "Delete from seva_images WHERE seva_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaImageId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Seva image with ID: {} marked as deleted successfully", sevaImageId);
				return true;
			} else {
				logger.warn("No Seva image found with ID: {}", sevaImageId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting seva image with ID: {}", sevaImageId, e);
			throw new RuntimeException("Error deleting seva image", e);
		}
	}

	@Override
	public List<SevaImages> getAllSevaImages() {
		logger.info("Fetching all SevaImages");

		List<SevaImages> sevaImagesList = new ArrayList<>();
		String sql = "SELECT * FROM seva_images";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaImages sevaImage = new SevaImages(rs.getInt("seva_image_id"), rs.getInt("seva_id"),
							rs.getString("image_title"), rs.getString("image_description"), rs.getString("seva_images"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					sevaImagesList.add(sevaImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all SevaImages", e);
			throw new RuntimeException("Error fetching all SevaImages", e);
		}

		return sevaImagesList;
	}

	@Override
	public List<SevaImages> getAllActiveSevaImages() {
		logger.info("Inside Get All SevaImages Impl");

		List<SevaImages> sevaImagesList = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM seva_images WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaImages sevaImage = new SevaImages(rs.getInt("seva_image_id"), rs.getInt("seva_id"),
							rs.getString("image_title"), rs.getString("image_description"), rs.getString("seva_images"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					sevaImagesList.add(sevaImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva images", e);
			throw new RuntimeException("Error fetching seva images", e);
		}

		return sevaImagesList;
	}

	@Override
	public SevaImages getSevaImageById(int sevaImageId) {
		logger.info("Inside Get SevaImage By Id Impl");

		String sql = "SELECT * FROM seva_images WHERE seva_image_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaImageId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new SevaImages(rs.getInt("seva_image_id"), rs.getInt("seva_id"), rs.getString("image_title"),
							rs.getString("image_description"), rs.getString("seva_images"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva image by ID", e);
			throw new RuntimeException("Error fetching seva image by ID", e);
		}

		return null; // return null if no record found
	}

	@Override
	public List<SevaImages> getAllSevaImagesBySevaId(int sevaId) {
		logger.info("Inside Get All SevaImages Impl");

		List<SevaImages> sevaImagesList = new ArrayList<>();

		String sql = "SELECT * FROM seva_images WHERE seva_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaImages sevaImage = new SevaImages(rs.getInt("seva_image_id"), rs.getInt("seva_id"),
							rs.getString("image_title"), rs.getString("image_description"), rs.getString("seva_images"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					sevaImagesList.add(sevaImage);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva images", e);
			throw new RuntimeException("Error fetching seva images", e);
		}

		return sevaImagesList;
	}
}
