package com.ui.dao;

import java.util.List;

import com.ui.model.OrderDetails;
import com.ui.model.OrderSevaDetails;
import com.ui.model.User;

public interface UserDAO {

	User addUser(User user);

	User getUserById(int userId);

	void updateUser(User user);

	void deleteUser(int userId);

	List<User> getAllUsers();

	int getLastOrderSequence();

	String getLastOrderNumber();

	void addCcavenueResponse(OrderDetails orderDetail);

	void insertOrderDetail(OrderSevaDetails orderSevaDetails);

	void updateOrderStatus(OrderDetails orderdetails);

	List<OrderDetails> getOrderDetailByOrderNumber(String ordernumber);

	List<OrderDetails> getAllOrderDetailsByUserId(int userId);

	List<OrderDetails> getAllOrderDetails();

	int getLastOrderSevaDetailId();

	void addOrder(OrderDetails orderDetail);

	List<OrderSevaDetails> getOrderSevaDetailsByOrderNumber(String ordernumber);

	OrderDetails getBillerInformationByUserId(int loginUserId);
}
