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

import com.ui.dao.UserDAO;
import com.ui.model.OrderDetails;
import com.ui.model.OrderSevaDetails;
import com.ui.model.User;

public class UserDAOImpl implements UserDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Add a new user
	@Override
	public User addUser(User user) {
		logger.info("Inside Add User Impl");
		boolean isAddUser = false;

		String sql = "INSERT INTO user (role_id, trustee_type_id, first_name, middle_name, last_name, gender_id, description, mobile_no, email_id, password, image, status, created_by, ip_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, user.getRoleId());
			ps.setInt(2, user.getTrusteeTypeId());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getMiddleName());
			ps.setString(5, user.getLastName());
			ps.setInt(6, user.getGenderId());
			ps.setString(7, user.getDescription());
			ps.setString(8, user.getMobileNo());
			ps.setString(9, user.getEmailId());
			ps.setString(10, user.getPassword());
			ps.setString(11, user.getImage());
			ps.setString(12, user.getStatus());
			ps.setInt(13, user.getCreatedBy());
			ps.setString(14, user.getIpAddress());

			ps.executeUpdate();
			isAddUser = true;
			logger.info("User added successfully");

			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					user.setUserId(generatedId); // Set the generated ID back to the object if needed
					logger.info("User added successfully with ID: " + generatedId);
				}
			}

		} catch (SQLException e) {
			logger.error("Error adding user", e);
			throw new RuntimeException(e);
		}
		return user;
	}

	// Get a user by ID
	@Override
	public User getUserById(int userId) {
		logger.info("Inside Get User By ID Impl");

		String sql = "SELECT * FROM user WHERE user_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return new User(rs.getInt("user_id"), rs.getInt("role_id"), rs.getInt("trustee_type_id"),
						rs.getString("first_name"), rs.getString("middle_name"), rs.getString("last_name"),
						rs.getInt("gender_id"), rs.getString("description"), rs.getString("mobile_no"),
						rs.getString("email_id"), rs.getString("password"), rs.getString("image"),
						rs.getString("status"), rs.getInt("created_by"), rs.getString("created_date"),
						rs.getString("ip_address"));
			}
		} catch (SQLException e) {
			logger.error("Error fetching user by ID", e);
			throw new RuntimeException(e);
		}

		return null; // Return null if no user is found
	}

	// Update an existing user
	@Override
	public void updateUser(User user) {
		logger.info("Inside Update User Impl");

		String sql = "UPDATE user SET role_id = ?, trustee_type_id = ?, first_name = ?, middle_name = ?, last_name = ?, gender_id = ?, description = ?, mobile_no = ?, email_id = ?, password = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE user_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, user.getRoleId());
			ps.setInt(2, user.getTrusteeTypeId());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getMiddleName());
			ps.setString(5, user.getLastName());
			ps.setInt(6, user.getGenderId());
			ps.setString(7, user.getDescription());
			ps.setString(8, user.getMobileNo());
			ps.setString(9, user.getEmailId());
			ps.setString(10, user.getPassword());
			ps.setString(11, user.getImage());
			ps.setString(12, user.getStatus());
			ps.setInt(13, user.getCreatedBy());
			ps.setString(14, user.getCreatedDate());
			ps.setString(15, user.getIpAddress());
			/* ps.setInt(16, user.getUserId()); */

			ps.executeUpdate();
			logger.info("User updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating user", e);
			throw new RuntimeException(e);
		}
	}

	// Delete a user (soft delete by setting status to 'n')
	@Override
	public void deleteUser(int userId) {
		logger.info("Inside Delete User Impl");

		String sql = "UPDATE user SET status = 'n' WHERE user_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.executeUpdate();
			logger.info("User deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting user", e);
			throw new RuntimeException(e);
		}
	}

	// Get all users (active users)
	@Override
	public List<User> getAllUsers() {
		logger.info("Inside Get All Users Impl");

		List<User> usersList = new ArrayList<>();
		String sql = "SELECT * FROM user WHERE status = 'y'";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User(rs.getInt("user_id"), rs.getInt("role_id"), rs.getInt("trustee_type_id"),
						rs.getString("first_name"), rs.getString("middle_name"), rs.getString("last_name"),
						rs.getInt("gender_id"), rs.getString("description"), rs.getString("mobile_no"),
						rs.getString("email_id"), rs.getString("password"), rs.getString("image"),
						rs.getString("status"), rs.getInt("created_by"), rs.getString("created_date"),
						rs.getString("ip_address"));
				usersList.add(user);
			}
		} catch (SQLException e) {
			logger.error("Error fetching users", e);
			throw new RuntimeException(e);
		}

		return usersList;
	}

	@Override
	public void insertOrderDetail(OrderSevaDetails orderSevaDetails) {
		String sql = "insert into order_seva_details (order_seva_id, order_seva_title, order_seva_description, order_seva_price, order_seva_quantity, order_seva_images, user_id, order_number,  order_variation_id, order_frequency_id, booking_date) values (?,?,?,?,?,?,?,?,?,?,?)";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, orderSevaDetails.getOrderSevaId());
			ps.setString(2, orderSevaDetails.getOrderSevaTitle());
			ps.setString(3, orderSevaDetails.getOrderSevaDescription());
			ps.setDouble(4, orderSevaDetails.getOrderSevaPrice());
			ps.setInt(5, orderSevaDetails.getOrderSevaQuantity());
			ps.setString(6, orderSevaDetails.getOrderSevaImages());
			ps.setInt(7, orderSevaDetails.getUserId());
			ps.setString(8, orderSevaDetails.getOrderNumber());
			ps.setInt(9, orderSevaDetails.getOrderVariationId());
			ps.setInt(10, orderSevaDetails.getOrderFrequencyId());
			ps.setString(11, orderSevaDetails.getBookingDate());

			ps.executeUpdate();
		}

		catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public void addCcavenueResponse(OrderDetails orderDetail) {
		logger.info("Inside Add CCAvenue Response");

		String sql = "update order_details set order_status=?, payment_status=?, tracking_id=?, bank_reference_number=?, failure_message=?, payment_mode=?, card_name=?, bank_name=?, status_code=?, currency=? where order_number=?";

		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, orderDetail.getOrderStatus());
			ps.setString(2, orderDetail.getPaymentStatus());
			ps.setString(3, orderDetail.getTrackingId());
			ps.setString(4, orderDetail.getBankReferenceNumber());
			ps.setString(5, orderDetail.getFailureMessage());
			ps.setString(6, orderDetail.getPaymentMode());
			ps.setString(7, orderDetail.getCardName());
			ps.setString(8, orderDetail.getBankName());
			ps.setInt(9, orderDetail.getStatusCode());
			ps.setString(10, orderDetail.getCurrency());
			ps.setString(11, orderDetail.getOrderNumber());

			ps.executeUpdate();
		}

		catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<OrderDetails> getOrderDetailByOrderNumber(String ordernumber) {
		logger.info("Inside Get Order Detail By Order Number");

		List<OrderDetails> OrderDetail = new ArrayList<OrderDetails>();

		String sql = "select od.* ,os.order_seva_title from order_details od left join order_seva_details os on od.order_number= os.order_number left join seva s on os.order_seva_id =s.seva_id where od.order_number=?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, ordernumber);

			OrderDetails orderdetail = null;

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				orderdetail = new OrderDetails(

						rs.getInt("order_details_id"), rs.getInt("sequence"), rs.getString("order_number"),
						rs.getInt("user_address_id"), rs.getFloat("total_amount"), rs.getFloat("sub_total"),
						rs.getString("order_status"), rs.getString("payment_status"), rs.getString("tracking_id"),
						rs.getString("bank_reference_number"), rs.getString("failure_message"),
						rs.getString("payment_mode"), rs.getString("card_name"), rs.getString("bank_name"),
						rs.getInt("status_code"), rs.getString("currency"), rs.getString("order_date"),
						rs.getInt("created_by"), rs.getString("created_date"), rs.getString("ip_address"),
						rs.getString("biller_name"), rs.getString("biller_emailid"), rs.getString("biller_address1"),
						rs.getString("biller_address2"), rs.getString("biller_country_name"),
						rs.getString("biller_state_name"), rs.getString("biller_city_name"),
						rs.getString("biller_pincode"), rs.getString("biller_mobileno"));
				orderdetail.setBankName(rs.getString("bank_name"));
				orderdetail.setOrderStatus(rs.getString("order_status"));
				orderdetail.setPaymentStatus(rs.getString("payment_status")

				);
				OrderDetail.add(orderdetail);
			}
			rs.close();
			ps.close();

			return OrderDetail;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<OrderSevaDetails> getOrderSevaDetailsByOrderNumber(String ordernumber) {

		logger.info("Inside Get Order Seva Details By Order Number");

		List<OrderSevaDetails> OrderSevaDetails = new ArrayList<OrderSevaDetails>();

		String sql = "select os.*,  v.variation_name, f.frequency_name, s.delivery from order_seva_details os left join order_details od on od.order_number = os.order_number left join seva s on os.order_seva_id =s.seva_id "
				+ " left join variation v on  v.variation_id = s.variation_id left join frequency f on f.frequency_id = s.frequency_id where os.order_number=?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, ordernumber);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OrderSevaDetails orderSevaDetails = new OrderSevaDetails();

				orderSevaDetails.setOrderSevaDetailsId(rs.getInt("order_seva_details_id"));
				orderSevaDetails.setOrderSevaId(rs.getInt("order_seva_id"));
				orderSevaDetails.setOrderSevaTitle(rs.getString("order_seva_title"));
				orderSevaDetails.setOrderSevaDescription(rs.getString("order_seva_description"));
				orderSevaDetails.setOrderSevaPrice(rs.getFloat("order_seva_price"));
				orderSevaDetails.setOrderSevaQuantity(rs.getInt("order_seva_quantity"));
				orderSevaDetails.setOrderSevaImages(rs.getString("order_seva_images"));
				orderSevaDetails.setUserId(rs.getInt("user_id"));
				orderSevaDetails.setOrderNumber(rs.getString("order_number"));
				orderSevaDetails.setOrderVariationId(rs.getInt("order_variation_id"));
				orderSevaDetails.setOrderFrequencyId(rs.getInt("order_frequency_id"));
				orderSevaDetails.setBookingDate(rs.getString("booking_date"));
				orderSevaDetails.setVariationName(rs.getString("variation_name"));
				orderSevaDetails.setFrequencyName(rs.getString("frequency_name"));
				orderSevaDetails.setOrderDelivery(rs.getString("delivery"));

				OrderSevaDetails.add(orderSevaDetails);
			}
			rs.close();
			ps.close();

			return OrderSevaDetails;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<OrderDetails> getAllOrderDetails() {

		Connection conn = null;

		List<OrderDetails> orderDetails = new ArrayList<OrderDetails>();

		String sql = "SELECT * FROM order_details ORDER BY order_details_id desc";
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setOrderDetailsId(rs.getInt("order_details_id"));
				orderDetail.setSequence(rs.getInt("sequence"));
				orderDetail.setOrderNumber(rs.getString("order_number"));
				orderDetail.setUserAddressId(rs.getInt("user_address_id"));
				orderDetail.setTotalAmount(rs.getFloat("total_amount"));
				orderDetail.setSubTotal(rs.getFloat("sub_total"));
				orderDetail.setOrderStatus(rs.getString("order_status"));
				orderDetail.setPaymentStatus(rs.getString("payment_status"));
				orderDetail.setTrackingId(rs.getString("tracking_id"));
				orderDetail.setBankReferenceNumber(rs.getString("bank_reference_number"));
				orderDetail.setFailureMessage(rs.getString("failure_message"));
				orderDetail.setPaymentMode(rs.getString("payment_mode"));
				orderDetail.setCardName(rs.getString("card_name"));
				orderDetail.setBankName(rs.getString("bank_name"));
				orderDetail.setStatusCode(rs.getInt("status_code"));
				orderDetail.setCurrency(rs.getString("currency"));
				orderDetail.setOrderDate(rs.getString("order_date"));
				orderDetail.setBillerName(rs.getString("biller_name"));
				orderDetail.setBillerEmailid(rs.getString("biller_emailid"));
				orderDetail.setBillerAddress1(rs.getString("biller_address1"));
				orderDetail.setBillerAddress2(rs.getString("biller_address2"));
				orderDetail.setBillerCountryName(rs.getString("biller_country_name"));
				orderDetail.setBillerStateName(rs.getString("biller_state_name"));
				orderDetail.setBillerCityName(rs.getString("biller_city_name"));
				orderDetail.setBillerPincode(rs.getString("biller_pincode"));
				orderDetail.setBillerMobileno(rs.getString("biller_mobileno"));

				orderDetails.add(orderDetail);
			}
			return orderDetails;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return orderDetails;

	}

	@Override
	public List<OrderDetails> getAllOrderDetailsByUserId(int userId) {

		Connection conn = null;

		List<OrderDetails> orderDetailsList = new ArrayList<>();

		String sql = "SELECT od.* FROM order_details od " + " WHERE od.created_by = ? "
				+ "ORDER BY od.order_details_id DESC";

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setOrderDetailsId(rs.getInt("order_details_id"));
				orderDetail.setSequence(rs.getInt("sequence"));
				orderDetail.setOrderNumber(rs.getString("order_number"));
				orderDetail.setUserAddressId(rs.getInt("user_address_id"));
				orderDetail.setTotalAmount(rs.getFloat("total_amount"));
				orderDetail.setSubTotal(rs.getFloat("sub_total"));
				orderDetail.setOrderStatus(rs.getString("order_status"));
				orderDetail.setPaymentStatus(rs.getString("payment_status"));
				orderDetail.setTrackingId(rs.getString("tracking_id"));
				orderDetail.setBankReferenceNumber(rs.getString("bank_reference_number"));
				orderDetail.setFailureMessage(rs.getString("failure_message"));
				orderDetail.setPaymentMode(rs.getString("payment_mode"));
				orderDetail.setCardName(rs.getString("card_name"));
				orderDetail.setBankName(rs.getString("bank_name"));
				orderDetail.setStatusCode(rs.getInt("status_code"));
				orderDetail.setCurrency(rs.getString("currency"));
				orderDetail.setOrderDate(rs.getString("order_date"));
				orderDetail.setBillerName(rs.getString("biller_name"));
				orderDetail.setBillerEmailid(rs.getString("biller_emailid"));
				orderDetail.setBillerAddress1(rs.getString("biller_address1"));
				orderDetail.setBillerAddress2(rs.getString("biller_address2"));
				orderDetail.setBillerCountryName(rs.getString("biller_country_name"));
				orderDetail.setBillerStateName(rs.getString("biller_state_name"));
				orderDetail.setBillerCityName(rs.getString("biller_city_name"));
				orderDetail.setBillerPincode(rs.getString("biller_pincode"));
				orderDetail.setBillerMobileno(rs.getString("biller_mobileno"));
				orderDetailsList.add(orderDetail);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return orderDetailsList;

	}

	@Override
	public OrderDetails getBillerInformationByUserId(int loginUserId) {

		Connection conn = null;

		OrderDetails orderDetail = null;

		String sql = "select * from order_details where created_by = ? order by order_details_id desc limit 1";
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, loginUserId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				orderDetail = new OrderDetails();
				
				orderDetail.setBillerName(rs.getString("biller_name"));
				orderDetail.setBillerEmailid(rs.getString("biller_emailid"));
				orderDetail.setBillerAddress1(rs.getString("biller_address1"));
				orderDetail.setBillerAddress2(rs.getString("biller_address2"));
				orderDetail.setBillerCountryName(rs.getString("biller_country_name"));
				orderDetail.setBillerStateName(rs.getString("biller_state_name"));
				orderDetail.setBillerCityName(rs.getString("biller_city_name"));
				orderDetail.setBillerPincode(rs.getString("biller_pincode"));
				orderDetail.setBillerMobileno(rs.getString("biller_mobileno"));

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return orderDetail;

	}

	@Override
	public void updateOrderStatus(OrderDetails orderdetails) {

		logger.info("Inside Update Order Status");

		String sql = "insert into order_details (sequence, order_number, biller_name, biller_emailid, biller_address1, biller_address2, biller_country_name, biller_state_name, biller_city_name, biller_pincode, biller_mobileno, sub_total, total_amount, user_address_id, order_status, payment_status, tracking_id, bank_reference_number, failure_message, payment_mode, card_name, bank_name, status_code, currency, order_date, created_by, ip_address) "
				+ "select sequence, order_number, biller_name, biller_emailid, biller_address1, biller_address2, biller_country_name, biller_state_name, biller_city_name, biller_pincode, biller_mobileno, sub_total, total_amount, user_address_id, ?, payment_status, tracking_id, bank_reference_number, failure_message, payment_mode, card_name, bank_name, status_code, currency, order_date, ?, ?, from order_details where order_number=? order by order_details_id desc limit 0,1";

		Connection conn = null;
		System.out.println("QUEERYYYYYYY" + sql);
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, orderdetails.getOrderStatus());
			ps.setInt(2, orderdetails.getCreatedBy());
			ps.setString(3, orderdetails.getIpAddress());
			ps.setString(4, orderdetails.getOrderNumber());

			ps.executeUpdate();
		}

		catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public int getLastOrderSequence() {
		logger.info("Inside get last order sequence Impl");

		String sql = "select max(sequence) as sequence from order_details";

		int sequence = 0;

		Connection conn = null;

		try {
			conn = dataSource.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				sequence = rs.getInt("sequence");
			}
			rs.close();
			ps.close();
			return sequence;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public String getLastOrderNumber() {
		logger.info("Inside get last order number Impl");

		String sql = "select order_number from order_details order by order_details_id desc limit 0,1";

		String ordernumber = "";

		Connection conn = null;

		try {
			conn = dataSource.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ordernumber = rs.getString("order_number");
			}
			rs.close();
			ps.close();
			return ordernumber;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public void addOrder(OrderDetails orderDetail) {
		String sql = "insert into order_details (sequence, order_number, biller_name, biller_emailid, biller_address1, biller_address2, biller_country_name, biller_state_name, biller_city_name, biller_pincode, biller_mobileno, sub_total, total_amount, user_address_id, order_status, payment_status, payment_mode, created_by, ip_address) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, orderDetail.getSequence());
			ps.setString(2, orderDetail.getOrderNumber());
			ps.setString(3, orderDetail.getBillerName());
			ps.setString(4, orderDetail.getBillerEmailid());
			ps.setString(5, orderDetail.getBillerAddress1());
			ps.setString(6, orderDetail.getBillerAddress2());
			ps.setString(7, orderDetail.getBillerCountryName());
			ps.setString(8, orderDetail.getBillerStateName());
			ps.setString(9, orderDetail.getBillerCityName());
			ps.setString(10, orderDetail.getBillerPincode());
			ps.setString(11, orderDetail.getBillerMobileno());
			ps.setDouble(12, orderDetail.getSubTotal());
			ps.setDouble(13, orderDetail.getTotalAmount());
			ps.setInt(14, orderDetail.getUserAddressId());
			ps.setString(15, orderDetail.getOrderStatus());
			ps.setString(16, orderDetail.getPaymentStatus());
			ps.setString(17, orderDetail.getPaymentMode());
			ps.setInt(18, orderDetail.getCreatedBy());
			ps.setString(19, orderDetail.getIpAddress());

			ps.executeUpdate();
		}

		catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public int getLastOrderSevaDetailId() {
		String sql = "select order_seva_details_id from order_seva_details order by order_seva_details_id desc limit 0,1";
		int id = 0;
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getInt("order_seva_details_id");
			}
			rs.close();
			ps.close();
			return id;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

}
