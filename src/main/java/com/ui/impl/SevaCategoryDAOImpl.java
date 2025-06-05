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

import com.ui.dao.SevaCategoryDAO;
import com.ui.model.SevaCategory;

public class SevaCategoryDAOImpl implements SevaCategoryDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(SevaCategoryDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<SevaCategory> getAllSevaCategories() {
		logger.info("Fetching all SevaCategories");

		List<SevaCategory> sevaCategories = new ArrayList<>();
		String sql = "SELECT * FROM seva_category";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaCategory sevaCategory = new SevaCategory(rs.getInt("seva_category_id"),
							rs.getString("seva_category_name"), rs.getString("description"), rs.getString("image"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					sevaCategories.add(sevaCategory);
				}
				/* logger.info("Fetched {} SevaCategories", sevaCategories.size()); */
			}
		} catch (SQLException e) {
			logger.error("Error fetching all seva categories", e);
			throw new RuntimeException("Error fetching all seva categories", e);
		}

		return sevaCategories;
	}

	@Override
	public List<SevaCategory> getAllActiveSevaCategories() {
		logger.info("Inside Get All SevaCategories Impl");

		List<SevaCategory> sevaCategories = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM seva_category WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaCategory sevaCategory = new SevaCategory(rs.getInt("seva_category_id"),
							rs.getString("seva_category_name"), rs.getString("description"), rs.getString("image"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					sevaCategories.add(sevaCategory);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva categories", e);
			throw new RuntimeException("Error fetching seva categories", e);
		}

		return sevaCategories;
	}

	@Override
	public SevaCategory addSevaCategory(SevaCategory sevaCategory) {
		logger.info("Inside Add SevaCategory Impl");

		String sql = "INSERT INTO seva_category (seva_category_name, description, image, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, sevaCategory.getSevaCategoryName());
			ps.setString(2, sevaCategory.getDescription());
			ps.setString(3, sevaCategory.getImage());
			ps.setString(4, sevaCategory.getStatus());
			ps.setInt(5, sevaCategory.getCreatedBy());
			ps.setString(6, sevaCategory.getIpAddress());

			ps.executeUpdate();
			logger.info("Seva category added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					sevaCategory.setSevaCategoryId(generatedId); // Set the generated ID back to the object if needed
					logger.info("SevaCategory added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding seva category", e);
			throw new RuntimeException("Error adding seva category", e);
		}
		return sevaCategory;
	}

	@Override
	public void updateSevaCategory(SevaCategory sevaCategory) {
		logger.info("Inside Edit SevaCategory Impl");

		String sql = "UPDATE seva_category SET seva_category_name = ?, description = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE seva_category_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, sevaCategory.getSevaCategoryName());
			ps.setString(2, sevaCategory.getDescription());
			ps.setString(3, sevaCategory.getImage());
			ps.setString(4, sevaCategory.getStatus());
			ps.setInt(5, sevaCategory.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(sevaCategory.getCreatedDate()));
			ps.setString(7, sevaCategory.getIpAddress());
			ps.setInt(8, sevaCategory.getSevaCategoryId());

			ps.executeUpdate();
			logger.info("Seva category updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating seva category", e);
			throw new RuntimeException("Error updating seva category", e);
		}
	}

	@Override
	public boolean deleteSevaCategory(int sevaCategoryId) {
		logger.info("Inside Delete SevaCategory Impl");

		String sql = "Delete from seva_category WHERE seva_category_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaCategoryId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Seva category with ID: {} marked as deleted successfully", sevaCategoryId);
				return true;
			} else {
				logger.warn("No Seva category found with ID: {}", sevaCategoryId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting SevaCategory with ID: {}", sevaCategoryId, e);
			throw new RuntimeException("Error deleting seva category", e);
		}
	}

	@Override
	public SevaCategory getSevaCategoryById(int sevaCategoryId) {
		logger.info("Inside Get SevaCategory By Id Impl");

		String sql = "SELECT * FROM seva_category WHERE seva_category_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaCategoryId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new SevaCategory(rs.getInt("seva_category_id"), rs.getString("seva_category_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva category by ID", e);
			throw new RuntimeException("Error fetching seva category by ID", e);
		}

		return null;
	}
}
