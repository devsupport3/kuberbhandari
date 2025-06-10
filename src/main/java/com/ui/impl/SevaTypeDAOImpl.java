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
		String sql = "SELECT * FROM seva_type";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaType sevaType = new SevaType(rs.getInt("seva_type_id"), rs.getString("seva_type_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
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

		String sql = "SELECT * FROM seva_type WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					SevaType sevaType = new SevaType(rs.getInt("seva_type_id"), rs.getString("seva_type_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
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

	    String sql = "INSERT INTO seva_type (seva_type_name, description, image, status, created_by, ip_address) "
	            + "VALUES (?, ?, ?, ?, ?, ?)";

	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        bindSevaTypeParams(ps, sevaType, false);
	        ps.executeUpdate();

	        try (ResultSet rs = ps.getGeneratedKeys()) {
	            if (rs.next()) {
	                int generatedId = rs.getInt(1);
	                sevaType.setSevaTypeId(generatedId);
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

	    String sql = "UPDATE seva_type SET seva_type_name = ?, description = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
	            + "WHERE seva_type_id = ?";

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
	    ps.setString(1, sevaType.getSevaTypeName());
	    ps.setString(2, sevaType.getDescription());
	    ps.setString(3, sevaType.getImage());
	    ps.setString(4, sevaType.getStatus());
	    ps.setInt(5, sevaType.getCreatedBy());

	    if (isUpdate) {
	        ps.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));
	        ps.setString(7, sevaType.getIpAddress());
	        ps.setInt(8, sevaType.getSevaTypeId());
	    } else {
	        ps.setString(6, sevaType.getIpAddress());
	    }
	}

	
	
	@Override
	public boolean deleteSevaType(int sevaTypeId) {
		logger.info("Inside Delete SevaType Impl");

		String sql = "Delete from seva_type WHERE seva_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaTypeId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Seva type with ID: {} marked as deleted successfully", sevaTypeId);
				return true;
			} else {
				logger.warn("No Seva type found with ID: {}", sevaTypeId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting SevaType with ID: {}", sevaTypeId, e);
			throw new RuntimeException("Error deleting seva type", e);
		}
	}

	@Override
	public SevaType getSevaTypeById(int sevaTypeId) {
		logger.info("Inside Get SevaType By Id Impl");

		String sql = "SELECT * FROM seva_type WHERE seva_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaTypeId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new SevaType(rs.getInt("seva_type_id"), rs.getString("seva_type_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva type by ID", e);
			throw new RuntimeException("Error fetching seva type by ID", e);
		}

		return null;
	}
}
