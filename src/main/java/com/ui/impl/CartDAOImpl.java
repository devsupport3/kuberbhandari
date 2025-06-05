package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.CartDAO;
import com.ui.model.Cart;

public class CartDAOImpl implements CartDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(CartDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Cart addCart(Cart cart) {
		logger.info("Adding cart item");

		String sql = "INSERT INTO order_seva_details (order_seva_id, order_seva_title, order_seva_description, order_seva_price, "
				+ "order_seva_quantity, order_seva_images, user_id, order_number, booking_date, order_variation_id, order_frequency_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, cart.getOrderSevaId());
			ps.setString(2, cart.getOrderSevaTitle());
			ps.setString(3, cart.getOrderSevaDescription());
			ps.setDouble(4, cart.getOrderSevaPrice());
			ps.setInt(5, cart.getOrderSevaQuantity());
			ps.setString(6, cart.getOrderSevaImages());
			ps.setInt(7, cart.getUserId());
			ps.setString(8, cart.getOrderNumber());
			ps.setString(9, cart.getBookingDate());
			ps.setInt(10, cart.getOrderVariationId());
			ps.setInt(11, cart.getOrderFrequencyId());

			ps.executeUpdate();
			logger.info("Cart item added successfully");

			// Retrieve generated key (if needed)
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1);
					cart.setOrderSevaDetailsId(generatedId);
					logger.info("Cart item added with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding cart item", e);
			throw new RuntimeException("Error adding cart item", e);
		}
		return cart;
	}

	@Override
	public void removeFromCart(int sevaId) {
		logger.info("Removing Seva ID {} from cart in DB", sevaId);

		String sql = "DELETE FROM order_seva_details WHERE order_seva_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, sevaId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Seva ID {} removed from cart successfully", sevaId);
			} else {
				logger.warn("No cart item found with Seva ID {}", sevaId);
			}
		} catch (SQLException e) {
			logger.error("Error removing Seva ID {} from cart", sevaId, e);
			throw new RuntimeException("Error removing Seva from cart", e);
		}
	}

	@Override
	public void clearCart(int userId) {
		logger.info("Clearing cart for user ID {}", userId);

		String sql = "DELETE FROM order_seva_details WHERE user_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Cart cleared for user ID {}", userId);
			} else {
				logger.warn("No cart items found for user ID {}", userId);
			}
		} catch (SQLException e) {
			logger.error("Error clearing cart for user ID {}", userId, e);
			throw new RuntimeException("Error clearing cart", e);
		}
	}
}
