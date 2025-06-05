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

import com.ui.dao.OrderDetailsDAO;
import com.ui.model.OrderDetails;

public class OrderDetailsDAOImpl implements OrderDetailsDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(OrderDetailsDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public OrderDetails addOrderDetails(OrderDetails orderDetails) {
		logger.info("Adding new order details");

		String sql = "INSERT INTO order_details (sequence, order_number, user_address_id, total_amount, sub_total, order_status, payment_status, "
				+ "tracking_id, bank_reference_number, failure_message, payment_mode, card_name, bank_name, status_code, currency, order_date, "
				+ "created_by, ip_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, orderDetails.getSequence());
			ps.setString(2, orderDetails.getOrderNumber());
			ps.setInt(3, orderDetails.getUserAddressId());
			ps.setDouble(4, orderDetails.getTotalAmount());
			ps.setDouble(5, orderDetails.getSubTotal());
			ps.setString(6, orderDetails.getOrderStatus());
			ps.setString(7, orderDetails.getPaymentStatus());
			ps.setString(8, orderDetails.getTrackingId());
			ps.setString(9, orderDetails.getBankReferenceNumber());
			ps.setString(10, orderDetails.getFailureMessage());
			ps.setString(11, orderDetails.getPaymentMode());
			ps.setString(12, orderDetails.getCardName());
			ps.setString(13, orderDetails.getBankName());
			ps.setInt(14, orderDetails.getStatusCode());
			ps.setString(15, orderDetails.getCurrency());
			ps.setString(16, orderDetails.getOrderDate());
			ps.setInt(17, orderDetails.getCreatedBy());
			ps.setString(18, orderDetails.getIpAddress());

			ps.executeUpdate();

			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1);
					orderDetails.setOrderDetailsId(generatedId);
					logger.info("Order added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding order details", e);
			throw new RuntimeException("Error adding order details", e);
		}
		return orderDetails;
	}
}
