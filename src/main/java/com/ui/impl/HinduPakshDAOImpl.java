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

import com.ui.dao.HinduPakshDAO;
import com.ui.model.HinduPaksh;

public class HinduPakshDAOImpl implements HinduPakshDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HinduPakshDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public HinduPaksh addHinduPaksh(HinduPaksh hinduPaksh) {

		logger.info("Inside Add Hindu Paksh Impl");

		String sql = "INSERT INTO hindu_paksh (paksh_name, paksh_name_alias, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, hinduPaksh.getPakshName());
			ps.setString(2, hinduPaksh.getPakshNameAlias());
			ps.setString(3, hinduPaksh.getDescription());
			ps.setString(4, hinduPaksh.getStatus());
			ps.setInt(5, hinduPaksh.getCreatedBy());
			ps.setString(6, hinduPaksh.getIpAddress());

			ps.executeUpdate();
			logger.info("Hindu paksh added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					hinduPaksh.setHinduPakshId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Hindu paksh added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding hindu paksh", e);
			throw new RuntimeException("Error adding hindu paksh", e);
		}
		return hinduPaksh;
	}

	@Override
	public void updateHinduPaksh(HinduPaksh hinduPaksh) {

		logger.info("Inside Edit Hindu Paksh Impl");

		String sql = "UPDATE hindu_paksh SET paksh_name = ?, paksh_name_alias = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE hindu_paksh_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hinduPaksh.getPakshName());
			ps.setString(2, hinduPaksh.getPakshNameAlias());
			ps.setString(3, hinduPaksh.getDescription());
			ps.setString(4, hinduPaksh.getStatus());
			ps.setInt(5, hinduPaksh.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(hinduPaksh.getCreatedDate()));
			ps.setString(7, hinduPaksh.getIpAddress());
			ps.setInt(8, hinduPaksh.getHinduPakshId());

			ps.executeUpdate();
			logger.info("Hindu paksh updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating hindu paksh", e);
			throw new RuntimeException("Error updating hindu paksh", e);
		}
	}

	@Override
	public boolean deleteHinduPaksh(int hinduPakshId) {

		logger.info("Inside Delete Hindu Paksh Impl");

		String sql = "Delete from hindu_paksh WHERE hindu_paksh_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, hinduPakshId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Hindu paksh with ID: {} marked as deleted successfully", hinduPakshId);
				return true;
			} else {
				logger.warn("No hindu paksh found with ID: {}", hinduPakshId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting hindu paksh with ID: {}", hinduPakshId, e);
			throw new RuntimeException("Error deleting hindu paksh", e);
		}
	}

	@Override
	public HinduPaksh getHinduPakshById(int hinduPakshId) {

		logger.info("Inside Get Hindu Paksh By Id Impl");

		String sql = "SELECT * FROM hindu_paksh WHERE hindu_paksh_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, hinduPakshId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new HinduPaksh(rs.getInt("hindu_paksh_id"), rs.getString("paksh_name"),
							rs.getString("paksh_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu paksh by ID", e);
			throw new RuntimeException("Error fetching hindu paksh by ID", e);
		}

		return null;
	}

	@Override
	public List<HinduPaksh> getAllHinduPaksh() {

		logger.info("Fetching all hindu paksh");

		List<HinduPaksh> hinduPakshs = new ArrayList<>();

		String sql = "SELECT * FROM hindu_paksh";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduPaksh hinduPaksh = new HinduPaksh(rs.getInt("hindu_paksh_id"), rs.getString("paksh_name"),
							rs.getString("paksh_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduPakshs.add(hinduPaksh);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all hindu paksh", e);
			throw new RuntimeException("Error fetching all hindu paksh", e);
		}

		return hinduPakshs;
	}

	@Override
	public List<HinduPaksh> getAllActiveHinduPaksh() {

		logger.info("Inside Get All Hindu Paksh Impl");

		List<HinduPaksh> hinduPakshs = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM hindu_paksh WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduPaksh hinduPaksh = new HinduPaksh(rs.getInt("hindu_paksh_id"), rs.getString("paksh_name"),
							rs.getString("paksh_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduPakshs.add(hinduPaksh);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu paksh", e);
			throw new RuntimeException("Error fetching hindu paksh", e);
		}

		return hinduPakshs;
	}
}
