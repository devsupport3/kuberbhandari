package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.SevaTypeDAO;
import com.ui.model.SevaType;

public class SevaTypeDAOImpl implements SevaTypeDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(SevaTypeDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<SevaType> getAllSevaTypes() {
		logger.info("Fetching all SevaTypes");

		List<SevaType> sevaTypes = new ArrayList<>();
		String sql = "SELECT * FROM seva_type WHERE is_deleted = FALSE";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaType sevaType = new SevaType(rs.getInt("id"), rs.getString("name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"),rs.getBoolean("is_active"),rs.getBoolean("is_deleted"));
					sevaTypes.add(sevaType);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all seva types", e);
			throw new RuntimeException("Error fetching all seva types", e);
		}

		return sevaTypes;
	}

	@Override
	public List<SevaType> getAllActiveSevaTypes() {
		logger.info("Inside Get All SevaTypes Impl");

		List<SevaType> sevaTypes = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM seva_type WHERE status = ? AND is_deleted = FALSE";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaType sevaType = new SevaType(rs.getInt("id"), rs.getString("name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"),rs.getBoolean("is_active"),rs.getBoolean("is_deleted"));
					sevaTypes.add(sevaType);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva types", e);
			throw new RuntimeException("Error fetching seva types", e);
		}

		return sevaTypes;
	}

	@Override
	public SevaType addSevaType(SevaType sevaType) {
	    logger.info("Inside Add SevaType Impl");

	    String sql = "INSERT INTO seva_type (name, description, image, status, created_by, is_active, is_deleted, ip_address) "
	            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        bindSevaTypeParams(ps, sevaType, false);
	        ps.executeUpdate();

	        try (ResultSet rs = ps.getGeneratedKeys()) {
	            if (rs.next()) {
	                int generatedId = rs.getInt(1);
	                sevaType.setId(generatedId);
	                logger.info("SevaType added successfully with ID: " + generatedId);
	            }
	        }

	    } catch (SQLException e) {
	        logger.error("Error adding seva type", e);
	        throw new RuntimeException("Error adding seva type", e);
	    }

	    return sevaType;
	}


	@Override
	public boolean updateSevaType(SevaType sevaType) {
	    logger.info("Inside Edit SevaType Impl");

	    String sql = "UPDATE seva_type SET name = ?, description = ?, image = ?, status = ?, created_by = ?,  is_active = ?,  created_date = ?, ip_address = ?"
	            + "WHERE id = ?";

	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        bindSevaTypeParams(ps, sevaType, true);

	        int rowsAffected = ps.executeUpdate();
	        logger.info("SevaType updated successfully, rows affected: " + rowsAffected);
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        logger.error("Error updating seva type", e);
	        throw new RuntimeException("Error updating seva type", e);
	    }
	}

	private void bindSevaTypeParams(PreparedStatement ps, SevaType sevaType, boolean isUpdate) throws SQLException {
	    ps.setString(1, sevaType.getName());
	    ps.setString(2, sevaType.getDescription());
	    ps.setString(3, sevaType.getImage());
	    ps.setString(4, sevaType.getStatus());
	    ps.setInt(5, sevaType.getCreatedBy());
	    ps.setBoolean(6, sevaType.getIsActive());
	    if (isUpdate) {
	        ps.setTimestamp(7, new java.sql.Timestamp(System.currentTimeMillis()));
	        ps.setString(8, sevaType.getIpAddress());
	        ps.setInt(9, sevaType.getId());
	    } else {
	    	ps.setBoolean(7, false); // is_deleted = false when adding
	        ps.setString(8, sevaType.getIpAddress());
	    }
	}

	
	@Override
	public boolean softDeleteByIds(List<Integer> ids) {
	    logger.info("Soft deleting SevaTypes with IDs: {}", ids);

	    if (ids == null || ids.isEmpty()) {
	        logger.warn("No IDs provided for deletion.");
	        return false;
	    }

	    // Dynamically build placeholders (?, ?, ?) for the IN clause
	    String placeholders = ids.stream().map(id -> "?").collect(Collectors.joining(","));
	    String sql = "UPDATE seva_type SET is_deleted = true WHERE id IN (" + placeholders + ")";

	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        for (int i = 0; i < ids.size(); i++) {
	            ps.setInt(i + 1, ids.get(i));
	        }

	        int rowsAffected = ps.executeUpdate();
	        logger.info("Rows marked as deleted: " + rowsAffected);
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        logger.error("Error soft deleting seva types", e);
	        throw new RuntimeException("Error soft deleting seva types", e);
	    }
	}

	
	@Override
	public boolean deleteSevaType(int id) {
	    logger.info("Soft deleting SevaType");

	    String sql = "UPDATE seva_type SET is_deleted = TRUE WHERE id = ?";

	    try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        int rowsAffected = ps.executeUpdate();

	        logger.info("Rows affected during delete: {}", rowsAffected);
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        logger.error("Error soft deleting SevaType", e);
	        throw new RuntimeException("Error soft deleting SevaType", e);
	    }
	}


	@Override
	public SevaType getSevaTypeById(int sevaTypeId) {
		logger.info("Inside Get SevaType By Id Impl");

		String sql = "SELECT * FROM seva_type WHERE id = ? AND is_deleted = FALSE";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaTypeId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new SevaType(rs.getInt("id"), rs.getString("name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"),rs.getBoolean("is_active"),rs.getBoolean("is_deleted"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva type by ID", e);
			throw new RuntimeException("Error fetching seva type by ID", e);
		}

		return null;
	}
}
