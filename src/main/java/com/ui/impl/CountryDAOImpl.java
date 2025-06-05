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

import com.ui.dao.CountryDAO;
import com.ui.model.Country;

public class CountryDAOImpl implements CountryDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(CountryDAOImpl.class);

	// Set the data source
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all countries with status 'y'
	@Override
	public List<Country> getAllCountry() {
		logger.info("Inside Get All Country Impl");

		List<Country> countries = new ArrayList<>();
		String status = "y";

		String sql = "SELECT country_id, country_name, country_dialling_code, country_flag_image, "
				+ "country_map_image, status, created_by, created_date, ip_address " + "FROM country WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Country country = new Country(rs.getInt("country_id"), rs.getString("country_name"),
							rs.getString("country_dialling_code"), rs.getString("country_flag_image"),
							rs.getString("country_map_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getString("created_date"), rs.getString("ip_address"));
					countries.add(country);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching countries", e);
			throw new RuntimeException("Error fetching countries", e);
		}

		return countries;
	}

	// Add a new country
	@Override
	public String addCountry(Country country) {
		logger.info("Inside Add Country Impl");

		String sql = "INSERT INTO country (country_name, country_dialling_code, country_flag_image, "
				+ "country_map_image, status, created_by, created_date, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, country.getCountryName());
			ps.setString(2, country.getCountryDiallingCode());
			ps.setString(3, country.getCountryFlagImage());
			ps.setString(4, country.getCountryMapImage());
			ps.setString(5, country.getStatus());
			ps.setInt(6, country.getCreatedBy());
			ps.setString(7, country.getCreatedDate());
			ps.setString(8, country.getIpAddress());

			ps.executeUpdate();
			logger.info("Country added successfully");
		} catch (SQLException e) {
			logger.error("Error adding country", e);
			throw new RuntimeException("Error adding country", e);
		}
		return "Success";
	}

	// Update an existing country
	@Override
	public String editCountry(Country country) {
		logger.info("Inside Edit Country Impl");

		String sql = "UPDATE country SET country_name = ?, country_dialling_code = ?, country_flag_image = ?, "
				+ "country_map_image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE country_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, country.getCountryName());
			ps.setString(2, country.getCountryDiallingCode());
			ps.setString(3, country.getCountryFlagImage());
			ps.setString(4, country.getCountryMapImage());
			ps.setString(5, country.getStatus());
			ps.setInt(6, country.getCreatedBy());
			ps.setString(7, country.getCreatedDate());
			ps.setString(8, country.getIpAddress());
			ps.setInt(9, country.getCountryId());

			ps.executeUpdate();
			logger.info("Country updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating country", e);
			throw new RuntimeException("Error updating country", e);
		}
		return "Success";
	}

	// Delete a country (soft delete by setting status to 'n')
	@Override
	public String deleteCountry(int countryId) {
		logger.info("Inside Delete Country Impl");

		String sql = "UPDATE country SET status = 'n' WHERE country_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, countryId);
			ps.executeUpdate();
			logger.info("Country deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting country", e);
			throw new RuntimeException("Error deleting country", e);
		}
		return "Success";
	}

	// Get a country by its ID
	@Override
	public Country getCountryById(int countryId) {
		logger.info("Inside Get Country By Id Impl");

		Country country = null;
		String sql = "SELECT country_id, country_name, country_dialling_code, country_flag_image, "
				+ "country_map_image, status, created_by, created_date, ip_address "
				+ "FROM country WHERE country_id = ? AND status = 'y'";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, countryId); // Set the country ID parameter

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					// Create the Country object from the result set
					country = new Country(rs.getInt("country_id"), rs.getString("country_name"),
							rs.getString("country_dialling_code"), rs.getString("country_flag_image"),
							rs.getString("country_map_image"), rs.getString("status"), rs.getInt("created_by"),
							rs.getString("created_date"), rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching country by ID", e);
			throw new RuntimeException("Error fetching country by ID", e);
		}

		return country;
	}

}
