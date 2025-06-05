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

import com.ui.dao.VariationDAO;
import com.ui.model.Variation;

public class VariationDAOImpl implements VariationDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(VariationDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<Variation> getAllVariations() {
		logger.info("Fetching all variations");

		List<Variation> variations = new ArrayList<>();
		String sql = "SELECT * FROM variation";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Variation variation = new Variation(rs.getInt("variation_id"), rs.getString("variation_name"),
						rs.getString("description"), rs.getString("image"), rs.getString("status"),
						rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
						rs.getString("ip_address"));
				variations.add(variation);
			}

			/* logger.info("Fetched {} variations", variations.size()); */
		} catch (SQLException e) {
			logger.error("Error fetching all variations", e);
			throw new RuntimeException("Error fetching all variations", e);
		}

		return variations;
	}

	@Override
	public List<Variation> getAllActiveVariations() {
		logger.info("Inside Get All Variations Impl");

		List<Variation> variations = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM variation WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Variation variation = new Variation(rs.getInt("variation_id"), rs.getString("variation_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					variations.add(variation);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching variations", e);
			throw new RuntimeException("Error fetching variations", e);
		}

		return variations;
	}

	@Override
	public Variation addVariation(Variation variation) {
		logger.info("Inside Add Variation Impl");

		String sql = "INSERT INTO variation (variation_name, description, image, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, variation.getVariationName());
			ps.setString(2, variation.getDescription());
			ps.setString(3, variation.getImage());
			ps.setString(4, variation.getStatus());
			ps.setInt(5, variation.getCreatedBy());
			ps.setString(6, variation.getIpAddress());

			ps.executeUpdate();
			logger.info("Variation added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					variation.setVariationId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Variation added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding variation", e);
			throw new RuntimeException("Error adding variation", e);
		}
		return variation;
	}

	@Override
	public void updateVariation(Variation variation) {
		logger.info("Inside Edit Variation Impl");

		String sql = "UPDATE variation SET variation_name = ?, description = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE variation_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, variation.getVariationName());
			ps.setString(2, variation.getDescription());
			ps.setString(3, variation.getImage());
			ps.setString(4, variation.getStatus());
			ps.setInt(5, variation.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(variation.getCreatedDate()));
			ps.setString(7, variation.getIpAddress());
			ps.setInt(8, variation.getVariationId());

			ps.executeUpdate();
			logger.info("Variation updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating variation", e);
			throw new RuntimeException("Error updating variation", e);
		}
	}

	@Override
	public boolean deleteVariation(int variationId) {
		logger.info("Inside Delete Variation Impl");

		String sql = "Delete from variation WHERE variation_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, variationId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Variation with ID: {} marked as deleted successfully", variationId);
				return true;
			} else {
				logger.warn("No variation found with ID: {}", variationId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting Variation with ID: {}", variationId, e);
			throw new RuntimeException("Error deleting variation", e);
		}
	}

	@Override
	public Variation getVariationById(int variationId) {
		logger.info("Inside Get Variation By Id Impl");

		String sql = "SELECT * FROM variation WHERE variation_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, variationId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Variation(rs.getInt("variation_id"), rs.getString("variation_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching variation by ID", e);
			throw new RuntimeException("Error fetching variation by ID", e);
		}

		return null;
	}

}
