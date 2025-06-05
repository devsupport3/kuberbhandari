package com.ui.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ui.impl.UserAddressDAOImpl;
import com.ui.impl.UserDAOImpl;
import com.ui.model.Cart;
import com.ui.model.Festival;
import com.ui.model.OrderDetails;
import com.ui.model.OrderSevaDetails;
import com.ui.model.RolePagePermission;
import com.ui.model.UserAddress;
import com.ui.model.WebServiceResponse;

@RestController
public class UserController {

	@Autowired
	private UserAddressDAOImpl userAddressDAO;

	@Autowired
	private UserDAOImpl userDao;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@GetMapping("/manageKuberbhandari/GetCurrentUserPagePermission")
	public ResponseEntity<List<RolePagePermission>> GetCurrentUserPagePermission(HttpSession session) {
		List<RolePagePermission> rolePagePermission = (List<RolePagePermission>) session.getAttribute("adminUserRolePagePermission");
		if (rolePagePermission == null || rolePagePermission.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
		}
		return ResponseEntity.ok(rolePagePermission);
	}

	// Add a new user address
	@PostMapping("/addDeliveryAddress")
	public ResponseEntity<Map<String, Object>> addUserAddress(@RequestBody UserAddress userAddress, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> response = new HashMap<>();
		int userId = (int) session.getAttribute("userId");
		String IpAddress = request.getHeader("X-FORWARDED-FOR");
		if (IpAddress == null) {
			IpAddress = request.getRemoteAddr();
		}

		try {
			userAddress.setUserId(userId);
			userAddress.setCreatedBy(userId);
			userAddress.setIpAddress(IpAddress);
			if (userId == -1) {
				setGuestUserDeliveryAddress(session, userAddress);
			} else {
				userAddressDAO.addUserAddress(userAddress);
			}
			response.put("status", HttpStatus.OK);
			response.put("message", "User address added successfully");
		} catch (Exception e) {
			response.put("status", HttpStatus.INTERNAL_SERVER_ERROR);
			response.put("message", "Error adding user address: " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	// Get a user address by ID
	@GetMapping("/getUserAddressById/{id}")
	public ResponseEntity<?> getUserAddressById(@PathVariable("id") int userAddressId) {
		UserAddress userAddress = userAddressDAO.getUserAddressById(userAddressId);
		if (userAddress != null) {
			return ResponseEntity.ok(userAddress);
		} else {
			return ResponseEntity.status(404).body("User address not found");
		}
	}

	// Update a user address
	@PostMapping("/updateUserAddress")
	public ResponseEntity<String> updateUserAddress(@RequestBody UserAddress userAddress) {
		try {
			userAddressDAO.updateUserAddress(userAddress);
			return ResponseEntity.ok("User address updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating user address: " + e.getMessage());
		}
	}

	// Soft delete a user address by setting status to 'n'
	@DeleteMapping("/deleteUserAddress/{id}")
	public ResponseEntity<Map<String, Object>> deleteUserAddress(@PathVariable("id") int userAddressId,
			HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		try {

			if (userAddressId == -1) {
				session.setAttribute("selectedDeliveryUserAddressId", null);
				removeGuestUserDeliveryAddress(session);
			} else {
				if (userAddressId > 0) {
					userAddressDAO.deleteUserAddress(userAddressId);
				}
			}

			response.put("status", HttpStatus.OK);
			response.put("message", "User address deleted successfully");
		} catch (Exception e) {
			response.put("status", HttpStatus.INTERNAL_SERVER_ERROR);
			response.put("message", "Error deleting user address: " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	// Get all user addresses for a specific user (only active ones)
	@GetMapping("/getAllUserAddressesByUserId")
	public ResponseEntity<?> getAllUserAddressesByUserId(HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
		}

		if (userId == -1) {
			if (session.getAttribute("guestaddress1") != null) {
				return ResponseEntity.ok(getGuestUserAddress(session));
			}
		} else {
			List<UserAddress> addresses = userAddressDAO.getAllUserAddressesByUserId(userId);
			if (!addresses.isEmpty()) {
				return ResponseEntity.ok(addresses);
			}
		}
		return ResponseEntity.status(HttpStatus.NO_CONTENT).body("No user addresses found");

	}

	@PostMapping("ccavenueResponse")
	public WebServiceResponse ccavenueResponse(String orderid, String trackingid, String bankrefnumber,
			String orderstatus, String failuremessage, String paymentmode, String cardname, String statuscode,
			String currency, HttpSession session, HttpServletRequest request, HttpServletResponse res) {

		logger.info("Inside CCAvenue Response");

		System.out.println("Controller---------" + session.getAttribute("userId"));
		WebServiceResponse webServiceResponse = new WebServiceResponse();

		trackingid = trackingid.equalsIgnoreCase("null") ? "" : trackingid;
		bankrefnumber = bankrefnumber.equalsIgnoreCase("null") ? "" : bankrefnumber;
		orderstatus = orderstatus.equalsIgnoreCase("null") ? "" : orderstatus;
		failuremessage = failuremessage.equalsIgnoreCase("null") ? "" : failuremessage;
		paymentmode = paymentmode.equalsIgnoreCase("null") ? "" : paymentmode;
		cardname = cardname.equalsIgnoreCase("null") ? "" : cardname;
		statuscode = statuscode.equalsIgnoreCase("null") ? "" : statuscode;
		currency = currency.equalsIgnoreCase("null") ? "" : currency;

		OrderDetails orderDetail = new OrderDetails();
		orderDetail.setOrderNumber(orderid);
		orderDetail.setTrackingId(trackingid.isEmpty() ? "" : trackingid);
		orderDetail.setBankReferenceNumber(bankrefnumber.isEmpty() ? "" : bankrefnumber);
		orderDetail.setOrderStatus("New");
		orderDetail.setFailureMessage(failuremessage.isEmpty() ? "" : failuremessage);
		orderDetail.setPaymentStatus(orderstatus.isEmpty() ? "" : orderstatus);
		orderDetail.setPaymentMode(paymentmode.isEmpty() ? "" : paymentmode);
		orderDetail.setCardName(cardname.isEmpty() ? "" : cardname);
		orderDetail.setBankName(cardname.isEmpty() ? "" : cardname);
		orderDetail.setStatusCode(statuscode.isEmpty() ? 0 : Integer.parseInt(statuscode));
		orderDetail.setCurrency(currency.isEmpty() ? "" : currency);

		userDao.addCcavenueResponse(orderDetail);
		webServiceResponse.setSuccess(true);
		webServiceResponse.setReturnObj(orderid);
		session.setAttribute("ordernumber", orderid);
		session.setAttribute("orderStatus", orderstatus);

		if (session.getAttribute("userId") == null) {
			List<OrderDetails> orderdetail = userDao.getOrderDetailByOrderNumber(orderid);
			if (orderdetail.get(0).getCreatedBy() != 0) {
				userDao.getUserById(orderdetail.get(0).getCreatedBy());
			}
		}

		if (session.getAttribute("addToCarts") == null) {
			ArrayList<OrderSevaDetails> addToCarts = new ArrayList<OrderSevaDetails>();

			List<OrderSevaDetails> OrderSevaDetails = userDao.getOrderSevaDetailsByOrderNumber(orderid);

			int count = 0;

			for (int i = 0; i < OrderSevaDetails.size(); i++) {
				OrderSevaDetails ordersevadetails = new OrderSevaDetails(
						OrderSevaDetails.get(i).getOrderSevaDetailsId(), OrderSevaDetails.get(i).getOrderSevaId(),
						OrderSevaDetails.get(i).getOrderSevaTitle(), OrderSevaDetails.get(i).getOrderSevaDescription(),
						OrderSevaDetails.get(i).getOrderSevaPrice(), OrderSevaDetails.get(i).getOrderSevaQuantity(),
						OrderSevaDetails.get(i).getOrderSevaImages(), OrderSevaDetails.get(i).getUserId(),
						OrderSevaDetails.get(i).getOrderNumber(), OrderSevaDetails.get(i).getOrderVariationId(),
						OrderSevaDetails.get(i).getOrderFrequencyId(), OrderSevaDetails.get(i).getBookingDate(),
						OrderSevaDetails.get(i).getVariationName(), OrderSevaDetails.get(i).getFrequencyName(),
						OrderSevaDetails.get(i).getOrderDelivery());

				count = count + OrderSevaDetails.get(i).getOrderSevaQuantity();

				addToCarts.add(ordersevadetails);
			}

			session.setAttribute("addToCarts", addToCarts);

			List<OrderDetails> orderdetail = userDao.getOrderDetailByOrderNumber(orderid);

			session.setAttribute("totalAmount", orderdetail.get(0).getTotalAmount());
			session.setAttribute("countItems", count);

			session.setAttribute("billingname", orderdetail.get(0).getBillerName());
			session.setAttribute("billingemail", orderdetail.get(0).getBillerEmailid());
			session.setAttribute("billingaddress1", orderdetail.get(0).getBillerAddress1());
			session.setAttribute("billingaddress2", orderdetail.get(0).getBillerAddress2());
			session.setAttribute("billingcountryname", orderdetail.get(0).getBillerCountryName());
			session.setAttribute("billingstatename", orderdetail.get(0).getBillerStateName());
			session.setAttribute("billingcityname", orderdetail.get(0).getBillerCityName());
			session.setAttribute("billingpincode", orderdetail.get(0).getBillerPincode());
			session.setAttribute("billingmobileno", orderdetail.get(0).getBillerMobileno());

			session.setAttribute("subtotal", orderdetail.get(0).getSubTotal());
			session.setAttribute("total", orderdetail.get(0).getTotalAmount());

			orderDetail.setSubTotal(orderdetail.get(0).getSubTotal());
		}

		if (orderstatus.equalsIgnoreCase("Success")) {
			session.setAttribute("countItems", null);
			session.setAttribute("totalAmount", null);
		}

		return webServiceResponse;
	}

	@GetMapping("/get-selected-delivery-address")
	public ResponseEntity<UserAddress> getSeletedDeliveryAddress(Locale locale, Model model, HttpSession session) {
		int userDeliveryAddressId = (int) (session.getAttribute("selectedDeliveryUserAddressId") != null
				? session.getAttribute("selectedDeliveryUserAddressId")
				: 0);
		if (userDeliveryAddressId > 0) {
			UserAddress userAddress = userAddressDAO.getUserAddressById(userDeliveryAddressId);
			return ResponseEntity.ok(userAddress);
		}

		if (userDeliveryAddressId == -1) {
			return ResponseEntity.ok(getGuestUserAddress(session).get(0));
		}
		return null;
	}

	@GetMapping("/getBillerInformationByLoginUserId")
	public ResponseEntity<UserAddress> getBillerInformationByLoginUserId(HttpSession session) {
		try {
			Integer userId = (Integer) session.getAttribute("userId");

			if (userId == null || userId == 0) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
			}

			if (userId == -1) {
				UserAddress address = new UserAddress();
				address.setAddress1("");
				address.setAddress2("");
				address.setCityName("");
				address.setCountryName("");
				address.setEmailId("");
				address.setMobileNo("");
				address.setFullName("");
				address.setPincode("");
				address.setStateName("");
				address.setUserId(-1);
				return ResponseEntity.ok(address);
			}

			if (userId > 0) {
				OrderDetails orderDetails = userDao.getBillerInformationByUserId(userId);

				if (orderDetails != null) {
					UserAddress address = new UserAddress();
					address.setAddress1(orderDetails.getBillerAddress1());
					address.setAddress2(orderDetails.getBillerAddress2());
					address.setCityName(orderDetails.getBillerCityName());
					address.setCountryName(orderDetails.getBillerCountryName());
					address.setEmailId(orderDetails.getBillerEmailid());
					address.setMobileNo(orderDetails.getBillerMobileno());
					address.setFullName(orderDetails.getBillerName());
					address.setPincode(orderDetails.getBillerPincode());
					address.setStateName(orderDetails.getBillerStateName());

					return ResponseEntity.ok(address);
				}
			}
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("setBillingAddress")
	public String setBillingAddress(String billingname, String billingemail, String billingaddress1,
			String billingaddress2, String billingcountryname, String billingstatename, String billingcityname,
			int billingpincode, String billingmobileno, HttpSession session) {
		logger.info("Inside Set Billing Address");

		session.setMaxInactiveInterval(30 * 60); // Set Session Time Out time is 30 Minutes

		session.setAttribute("billingname", billingname);
		session.setAttribute("billingemail", billingemail);
		session.setAttribute("billingaddress1", billingaddress1);
		session.setAttribute("billingaddress2", billingaddress2);
		session.setAttribute("billingcountryname", billingcountryname);
		session.setAttribute("billingstatename", billingstatename);
		session.setAttribute("billingcityname", billingcityname);
		session.setAttribute("billingpincode", billingpincode);
		session.setAttribute("billingmobileno", billingmobileno);

		return "";
	}

	@PostMapping("addOrderSeva")
	public String addOrderSeva(HttpSession session, HttpServletRequest request) {
		logger.info("Inside Add Order seva");

		int userId = 0;

		try {
			if (session.getAttribute("userId").toString() != null) {
				userId = Integer.parseInt(session.getAttribute("userId").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String IpAddress = request.getHeader("X-FORWARDED-FOR");
		if (IpAddress == null) {
			IpAddress = request.getRemoteAddr();
		}

		String ordernumber = null;

		ordernumber = userDao.getLastOrderNumber();

		if (session.getAttribute("cart") != null && session.getAttribute("CartLength") != null) {
			try {
				List<Cart> addToCarts = (List<Cart>) session.getAttribute("cart");
				List<OrderSevaDetails> lst = new ArrayList<OrderSevaDetails>();

				for (int i = 0; i < addToCarts.size(); i++) {
					OrderSevaDetails orderSevaDetail = new OrderSevaDetails();

					orderSevaDetail.setOrderSevaId(addToCarts.get(i).getOrderSevaId());
					orderSevaDetail.setOrderSevaTitle(addToCarts.get(i).getOrderSevaTitle());
					orderSevaDetail.setOrderSevaDescription(addToCarts.get(i).getOrderSevaDescription());
					orderSevaDetail.setOrderSevaPrice(addToCarts.get(i).getOrderSevaPrice());
					orderSevaDetail.setOrderSevaQuantity(addToCarts.get(i).getOrderSevaQuantity());
					orderSevaDetail.setOrderSevaImages(addToCarts.get(i).getOrderSevaImages());
					orderSevaDetail.setUserId(userId);
					orderSevaDetail.setOrderNumber(ordernumber);
					orderSevaDetail.setOrderVariationId(addToCarts.get(i).getOrderVariationId());
					orderSevaDetail.setOrderFrequencyId(addToCarts.get(i).getOrderFrequencyId());
					orderSevaDetail.setBookingDate(addToCarts.get(i).getBookingDate());

					lst.add(orderSevaDetail);
					// userDao.insertOrderDetail(orderSevaDetail);

					/*
					 * int orderSevaDetailsId = 0;
					 * 
					 * orderSevaDetailsId = userDao.getLastOrderSevaDetailId();
					 */
				}
				if (lst.size() > 0) {
					for (int i = 0; i < lst.size(); i++) {
						userDao.insertOrderDetail(lst.get(i));
					}
				}
			} catch (Exception e) {
				return "Can Not Add Seva...Try Again";
			}
		} else {
			return "Can Not Add Seva...Try Again";
		}
		return "";
	}

	@PostMapping("addOrder")
	public String addOrder(String billingname, String billingemail, String billingaddress1, String billingaddress2,
			String billingcountryname, String billingstatename, String billingcityname, String billingpincode,
			String billingmobileno, String paymentoption, HttpSession session, HttpServletRequest request) {

		logger.info("Inside Add Order");
		int userId = 0;
		int userAddressId = 0;
		List<Cart> cart = null;
		String userName = "";
		try {
			if (session.getAttribute("userId") != null) {
				userId = Integer.parseInt(session.getAttribute("userId").toString());
			}
			if (session.getAttribute("userName") != null) {
				userName = session.getAttribute("userName").toString();
			}
			if (session.getAttribute("selectedDeliveryUserAddressId") != null) {
				userAddressId = (int) session.getAttribute("selectedDeliveryUserAddressId");
			}
			if (session.getAttribute("cart") != null) {
				cart = (List<Cart>) session.getAttribute("cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (userName.isEmpty()) {
			if (null != session.getAttribute("guestFirstName") && null != session.getAttribute("guestLastName")) {
				userName = session.getAttribute("guestFirstName") + " " + session.getAttribute("guestLastName");
			} else {
				userName = billingname;
			}
		}

		String IpAddress = request.getHeader("X-FORWARDED-FOR");
		if (IpAddress == null) {
			IpAddress = request.getRemoteAddr();
		}

		String ordernumber = null;
		String orderno = null;

		int sequence = userDao.getLastOrderSequence();

		if (sequence == 0) {
			orderno = "KB" + "0000001";
		} else {
			if (sequence + 1 >= 1 && sequence + 1 < 10) {
				orderno = "KB" + "000000" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 10 && sequence + 1 < 100) {
				orderno = "KB" + "00000" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 100 && sequence + 1 < 1000) {
				orderno = "KB" + "0000" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 1000 && sequence + 1 < 10000) {
				orderno = "KB" + "000" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 10000 && sequence + 1 < 100000) {
				orderno = "KB" + "00" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 100000 && sequence + 1 < 1000000) {
				orderno = "KB" + "0" + Integer.toString(sequence + 1);
			} else if (sequence + 1 >= 1000000 && sequence + 1 < 10000000) {
				orderno = "KB" + Integer.toString(sequence + 1);
			}
		}
		OrderDetails orderDetail = new OrderDetails();

		orderDetail.setSequence(sequence + 1);

		orderDetail.setOrderNumber(orderno);
		orderDetail.setUserAddressId(userAddressId);

		orderDetail.setBillerName(billingname);
		orderDetail.setBillerEmailid(billingemail);
		orderDetail.setBillerAddress1(billingaddress1);
		orderDetail.setBillerAddress2(billingaddress2);
		orderDetail.setBillerCountryName(billingcountryname);
		orderDetail.setBillerStateName(billingstatename);
		orderDetail.setBillerCityName(billingcityname);
		orderDetail.setBillerPincode(billingpincode);
		orderDetail.setBillerMobileno(billingmobileno);
		orderDetail.setSubTotal(calculateTotal(cart));
		orderDetail.setTotalAmount(calculateTotal(cart));

		if (paymentoption.equalsIgnoreCase("online")) {
			orderDetail.setOrderStatus("In Complete");
			orderDetail.setPaymentStatus("Unpaid");
			orderDetail.setPaymentMode("To Be Selected");
		} else {
			orderDetail.setOrderStatus("New");
			orderDetail.setPaymentStatus("Unpaid");
			orderDetail.setPaymentMode("COD");
			session.setAttribute("ordernumber", orderno);
			session.setAttribute("orderStatus", "Success");
		}

		orderDetail.setCreatedBy(userId);
		orderDetail.setIpAddress(IpAddress);

		userDao.addOrder(orderDetail);

		ordernumber = userDao.getLastOrderNumber();

		session.setAttribute("ordernumber", ordernumber);
		session.setAttribute("total", orderDetail.getTotalAmount());

		String res = addOrderSeva(session, request);
		if (!res.isEmpty()) {
			return res;
		} else {
			return "";
		}
	}

	public static double calculateTotal(List<Cart> cartItems) {
		double total = 0;
		for (Cart item : cartItems) {
			total += item.getOrderSevaPrice() * item.getOrderSevaQuantity();
		}
		return new BigDecimal(total).setScale(2, RoundingMode.HALF_UP).floatValue();
	}

	@GetMapping(value = "/getOrderDetailById", produces = "application/json")
	public List<OrderDetails> getOrderDetailById(HttpSession session, String ordernumber) {
		logger.info("Inside Get Order Detail By Order Number");

		List<OrderDetails> orderdetails = userDao.getOrderDetailByOrderNumber(ordernumber);

		for (OrderDetails o : orderdetails) {
			List<OrderSevaDetails> osd = userDao.getOrderSevaDetailsByOrderNumber(o.getOrderNumber());
			o.setOrderSevaDetailsList(osd);
		}

		if (orderdetails != null && orderdetails.size() > 0) {
			if (orderdetails.get(0).getPaymentStatus().equalsIgnoreCase("Success")
					|| orderdetails.get(0).getPaymentMode().equalsIgnoreCase("COD")) {
				setSessionsAllToNull(session);
			}
		}
		return orderdetails;
	}

	@GetMapping(value = "/getOrderSevaDetailsById", produces = "application/json")
	public List<OrderSevaDetails> getOrderSevaDetailsById(String ordernumber) {
		logger.info("Inside Get Order Seva Detail By Order Number");

		List<OrderSevaDetails> ordersevadetails = userDao.getOrderSevaDetailsByOrderNumber(ordernumber);

		return ordersevadetails;
	}

	@GetMapping(value = "/getAllOrderDetails", produces = "application/json")
	public List<OrderDetails> getAllOrderDetails(HttpSession session) {
		logger.info("Inside Get Order Detail");

		List<OrderDetails> orderdetails = userDao.getAllOrderDetails();

		for (OrderDetails o : orderdetails) {
			List<OrderSevaDetails> osd = userDao.getOrderSevaDetailsByOrderNumber(o.getOrderNumber());
			o.setOrderSevaDetailsList(osd);
		}

		return orderdetails;
	}

	@GetMapping(value = "/getAllOrderDetailsByUserId", produces = "application/json")
	public List<OrderDetails> getAllOrderDetailsByUserId(HttpSession session) {
		logger.info("Fetching order details for user ID: ");

		int userId = 0;

		try {
			if (session.getAttribute("userId").toString() != null) {
				userId = Integer.parseInt(session.getAttribute("userId").toString());
			}

			List<OrderDetails> orderdetails = userDao.getAllOrderDetailsByUserId(userId);

			for (OrderDetails o : orderdetails) {
				List<OrderSevaDetails> osd = userDao.getOrderSevaDetailsByOrderNumber(o.getOrderNumber());
				o.setOrderSevaDetailsList(osd);
			}
			return orderdetails;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@PostMapping("sendOrderConfirmationMail")
	public String sendOrderConfirmationMail(String ordernumber, HttpSession session, HttpServletRequest request,
			HttpServletResponse res) {

		try {

			OrderDetails orderPlaced = userDao.getOrderDetailByOrderNumber(ordernumber).get(0);
			List<OrderSevaDetails> OrderSevaDetails = userDao.getOrderSevaDetailsByOrderNumber(ordernumber);
			// List<OrderTax> ordertax = userDao.getOrderTaxByOrderNumber(ordernumber);

			// Send Email to User for Order Confirmation
			logger.info("Inside Send Email For Order Placed Successfully");

			res.addHeader("Access-Control-Allow-Origin", "*");

			final String username = "test1@ultrasmartsolutions.in";
			final String password = "devNtest@UI5432";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", "mail.ultrasmartsolutions.in");
			props.put("mail.smtp.port", "587");

			// props.put("mail.smtp.starttls.enable", "true");

			javax.mail.Session session1 = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			InternetAddress[] myBccList = InternetAddress.parse("webmaster@ultrainfotech.net");

			Message message = new MimeMessage(session1);
			message.setFrom(new InternetAddress("test1@ultrasmartsolutions.in", "Shree Kubereshwar Mahadev"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(orderPlaced.getBillerEmailid()));
			message.setRecipients(Message.RecipientType.BCC, myBccList);
			message.setSubject("Kuberbhandari - Your Order Placed Successfully");
			StringBuilder sb = new StringBuilder();

			sb = includeStringBuilderContent(sb, orderPlaced, OrderSevaDetails);

			message.setContent(sb.toString(), "text/html; charset=UTF-8");
			Transport.send(message);
			logger.info("Inside Email Send Successfully");
			return "success";
		} catch (Exception msg) {
			msg.printStackTrace();
			System.out.println("Not send mail " + msg);
		}
		return "fail";
	}

	private StringBuilder includeStringBuilderContent(StringBuilder sb, OrderDetails orderPlaced,
			List<OrderSevaDetails> orderSevaDetails) {
		DecimalFormat df = new DecimalFormat("0.00");

		sb.append(
				"<h1 style='font-size: 2.3em; color: #CC3300; text-transform: uppercase; font-weight: bolder; margin-bottom: 5px; margin-left: 180px;'>Shree Kubereshwar Mahadev, Karnali</h1>");
		// sb.append("<h2 style='font-size: 15px; color: #87655b; font-weight: bolder;
		// margin-left: 270px;'>Karnali</h2>");
		sb.append("<p style='font-size: 15px;'> \n Dear " + orderPlaced.getBillerName() + ",</p>");
		sb.append("<p style='font-size: 14px;'>We have received confirm order from you for following items</p><br/>");
		sb.append("<html></head>");
		sb.append(
				"<table border='0' cellspacing='1' cellpadding='0'><tbody><tr><td style='background: #CCCCCC; padding: 0in  0in  0in  0in;'>");
		sb.append(
				"<div align='center'><table  border='0' cellspacing='1' cellpadding='0' style='background: #CCCCCC;'><tbody><tr><td valign='top' style='background: white; padding: 0in  0in  0in  0in;'><div align='center'>");
		sb.append(
				"<table  border='0' cellspacing='0' cellpadding='0' width='580' style='width: 435.0pt;'><tbody><tr><td style='padding: 3.0pt  3.0pt  7.0pt  3.0pt;'><div align='center'><table  border='0' cellspacing='0' cellpadding='0' width='100%' style='width: 100.0%;'><tbody>");
		sb.append("<tr><td style='padding: 1.25pt  2.25pt  1.25pt  2.25pt;'><p><b>Order Number:</b>&nbsp;</td><td>"
				+ orderPlaced.getOrderNumber() + "</p></td><td style='padding: 1.25pt  2.25pt  1.25pt  2.25pt;'>");

		sb.append("<strong>Order Date:</strong>&nbsp;</td><td>" + orderPlaced.getOrderDate() + "</td></tr>");
		sb.append("<tr><td style='padding: 1.25pt  2.25pt  1.25pt  2.25pt;'><p><b>Payment Method:</b>&nbsp;</td><td>"
				+ orderPlaced.getPaymentMode()
				+ "</p></td><td style='padding: 1.25pt  2.25pt  1.25pt  2.25pt;'><p><b>Total Amount:</b> "
				+ "</p></td><td>  &#8377; " + df.format(orderPlaced.getTotalAmount()) + "</td></tr> ");
		sb.append("</tbody></table></div>");
		sb.append(
				"<div align='center'><table  border='0' cellspacing='1' cellpadding='0' width='100%' style='width: 100.0%;'><tbody><tr><td style='background: #CCCCCC; padding: 0in  0in  0in  0in;'><div align='center'><table  border='0' cellspacing='1' cellpadding='0' width='100%' style='width: 100.0%; background: #CCCCCC;'><tbody><tr><td width='70%' style='width: 70.0%; background: white; padding: 0in  0in  0in  0in;'><table  border='0' cellspacing='0' cellpadding='0' width='100%' style='width: 100.0%;'><tbody><tr><td>");
		sb.append("<tr><td>");

		sb.append("<table  border='1' style='width: 730px;float: left;border-collapse: collapse;'>");
		sb.append("<tr style='background-color: #ddd;'>");
		sb.append("<td style='padding: 5px;' width='30%' align='center' ><strong>Item</strong></td>");
		sb.append("<td width='30%' align='center'><strong>Price</strong></td>");
		sb.append("<td width='20%' align='center'><strong>Qty</strong></td>");
		sb.append("<td width='20%' align='center'><strong>Total</strong></td>");
		sb.append("</tr>");

		DecimalFormat qtynumber = new DecimalFormat("#");
		// float totalTaxPaid = 0;

		for (int i = 0; i < orderSevaDetails.size(); i++) {

			sb.append(" <tr><td colspan='4' align='left' style='padding-left: 6px;'>");
			/*
			 * for (int j = 0; j < ordertax.size(); j++) { if
			 * (ordertax.get(j).getOrderProductDetailsId() ==
			 * orderProductDetails.get(i).getOrderProductDetailId() &&
			 * ordertax.get(j).getTaxOn().equalsIgnoreCase("subtotal")) {
			 * sb.append(ordertax.get(j).getTaxName() + " @ " +
			 * ordertax.get(j).getTaxValue() + " : " + ordertax.get(j).getTaxAmount() +
			 * "    "); totalTaxPaid = totalTaxPaid + ordertax.get(j).getTaxAmount(); } }
			 */

			sb.append("</td></tr>");
			sb.append(" <tr>");

			sb.append("<td align='left' style='padding-left: 6px;'>" + orderSevaDetails.get(i).getOrderSevaTitle()
					+ " </td>");

			sb.append("<td align='right'> &#8377; " + df.format(orderSevaDetails.get(i).getOrderSevaPrice())
					+ " </td>  ");
			sb.append("<td align='right'>" + df.format(orderSevaDetails.get(i).getOrderSevaQuantity()) + " </td>  ");
			sb.append("<td align='right'> &#8377; " + df.format(
					orderSevaDetails.get(i).getOrderSevaQuantity() * orderSevaDetails.get(i).getOrderSevaPrice())
					+ " </td>  ");
			sb.append("</tr>");
		}
		/*
		 * sb.append("  <tr>"); sb.
		 * append(" <td colspan='3' align='right' style='padding-right: 10px;'><strong>Sub Total : </strong></td>"
		 * ); sb.
		 * append(" <td colspan='1' align='right' style='padding-right: 5px;'><strong> &#8377; "
		 * + df.format(orderPlaced.getSubTotal()) + " </strong></td>");
		 * sb.append(" </tr>");
		 */

		/*
		 * if (orderPlaced.getDiscountAmount() != 0) { sb.append("  <tr>"); sb.
		 * append(" <td colspan='3' align='right' style='padding-right: 10px;'><strong>Discount : </strong></td>"
		 * ); sb.
		 * append(" <td colspan='1' align='right' style='padding-right: 5px;'><strong> &#8377; "
		 * + df.format(orderPlaced.getDiscountAmount()) + " </strong></td>");
		 * sb.append(" </tr>"); }
		 * 
		 * if (orderPlaced.getShippingCharges() != 0) { sb.append("  <tr>"); sb.append(
		 * " <td colspan='3' align='right' style='padding-right: 10px;'><strong>Shipping Charges :</strong></td>"
		 * ); sb.
		 * append(" <td colspan='1' align='right' style='padding-right: 5px;'><strong> &#8377; "
		 * + df.format(orderPlaced.getShippingCharges()) + " </strong></td>");
		 * sb.append(" </tr>"); }
		 * 
		 * sb.append("  <tr>"); sb.
		 * append(" <td colspan='3' align='right' style='padding-right: 10px;'><strong>Total Tax : </strong></td>"
		 * ); sb.
		 * append(" <td colspan='1' align='right' style='padding-right: 5px;'><strong> &#8377; "
		 * + df.format(totalTaxPaid) + " </strong></td>"); sb.append(" </tr>");
		 */

		sb.append("  <tr>");
		sb.append(" <td colspan='3' align='right' style='padding-right: 10px;'><strong>Total Amount :</strong></td>");
		sb.append(" <td colspan='1' align='right' style='padding-right: 5px;'><strong> &#8377; "
				+ df.format(orderPlaced.getTotalAmount()) + " </strong></td>");
		sb.append(" </tr> ");

		/*
		 * if (orderPlaced.getBillerNote() != null) { sb.append("  <tr>"); sb.
		 * append(" <td colspan='4'  style='padding: 5px;'><strong>Special instructions: </strong> "
		 * + orderPlaced.getBillerNote() + " </td>"); sb.append(" </tr>"); }
		 */

		sb.append("<tr style='background-color: #ddd;'>");
		sb.append("<td colspan='2' align='center'>");
		sb.append("<strong>&nbsp;&nbsp;Payment Details:&nbsp; </strong>");
		sb.append("</td>");
		sb.append("<td style='padding: 5px;' colspan='2' align='center' >");
		sb.append("<strong>&nbsp;&nbsp;Billing Address:&nbsp; </strong>");
		sb.append("</td>");
		/*
		 * sb.append("<td style='padding: 5px;' colspan='2' align='center' >");
		 * sb.append("<strong>&nbsp;&nbsp;Shipping Address:&nbsp; </strong>");
		 * sb.append("</td>");
		 */
		sb.append("</tr> ");
		sb.append("<tr>");

		sb.append("<td colspan='2' align='left'>");
		if (orderPlaced.getPaymentMode().equalsIgnoreCase("COD")) {
		} else {
			sb.append("&nbsp;&nbsp;<strong>Tracking ID.   :</strong>" + orderPlaced.getTrackingId() + "<br>");
			sb.append("&nbsp;&nbsp;<strong>Bank Ref No.   :</strong>" + orderPlaced.getBankReferenceNumber() + "<br>");
			sb.append("&nbsp;&nbsp;<strong>Transaction Date  :</strong>" + orderPlaced.getOrderDate() + ",<br>");
			sb.append("&nbsp;&nbsp;<strong>Bank Name         :</strong>" + orderPlaced.getCardName() + ",<br>");
			sb.append("&nbsp;&nbsp;<strong>Amount Paid       :</strong> &#8377; "
					+ df.format(orderPlaced.getTotalAmount()) + "<br></p>");
		}
		sb.append("</td>");

		sb.append("<td colspan='2' align='left'>");
		sb.append("&nbsp;&nbsp;" + orderPlaced.getBillerName() + "<br>");
		sb.append("&nbsp;&nbsp;" + orderPlaced.getBillerAddress1() + ",<br>");
		if (orderPlaced.getBillerAddress2() != null)
			sb.append("&nbsp;&nbsp;" + orderPlaced.getBillerAddress2() + ",<br>");
		sb.append("&nbsp;&nbsp;" + orderPlaced.getBillerCityName() + ", " + orderPlaced.getBillerStateName() + ",<br>");
		sb.append("&nbsp;&nbsp;" + orderPlaced.getBillerCountryName() + " " + orderPlaced.getBillerPincode()
				+ ".<br></p>");
		sb.append("</td>");
		/*
		 * sb.append("<td colspan='2' align='left'>"); sb.append("&nbsp;&nbsp;" +
		 * orderPlaced.getCustomerName() + "<br>"); sb.append("&nbsp;&nbsp;" +
		 * orderPlaced.getCustomerAddress1() + ",<br>"); if
		 * (orderPlaced.getCustomerAddress2() != null) sb.append("&nbsp;&nbsp;" +
		 * orderPlaced.getCustomerAddress2() + ",<br>"); sb.append("&nbsp;&nbsp;" +
		 * orderPlaced.getCustomerCityName() + ", " + orderPlaced.getCustomerStateName()
		 * + ",<br>"); sb.append("&nbsp;&nbsp;" + orderPlaced.getCustomerPincode() + " "
		 * + orderPlaced.getCustomerCountryName() + ".<br></p>"); sb.append("</td>");
		 */
		sb.append("</tr>");

		sb.append("</tbody></table></td></tr></tbody></table></div></td>");
		sb.append("</tr></tbody></table></div></td></tr></tbody></table></div></td>");
		sb.append("</tr></tbody></table></div></td></tr></tbody></table>");
		sb.append("</table></body></html>");
		sb.append(
				"<p style='font-size: 15px;'><h2 style='color: #800080;'> For Any Queries, you may contact us at mahiti@shreekuberbhandarikarnali.org</h2></p>");
		sb.append("<p style='font-size: 14px;'>With Regards,<br/> Shree Kubereshwar Mahadev, Karnali</p>");
		return sb;
	}

	@PostMapping("cancelOrder")
	public String cancelOrder(HttpSession session, HttpServletRequest request, HttpServletResponse res) {
		logger.info("Inside Cancel Order");

		session.removeAttribute("cart");

		setSessionsAllToNull(session);

		return "";
	}

	private void setSessionsAllToNull(HttpSession session) {
		try {

			session.setAttribute("cart", null);
			session.setAttribute("CartLength", null);
			session.setAttribute("selectedDeliveryUserAddressId", null);
			session.setAttribute("countItems", null);
			session.setAttribute("totalAmount", null);

			session.setAttribute("subtotal", null);
			session.setAttribute("total", null);
			session.setAttribute("ordernumber", null);
			session.setAttribute("orderStatus", null);

			session.setAttribute("billingname", null);
			session.setAttribute("billingemail", null);
			session.setAttribute("billingaddress1", null);
			session.setAttribute("billingaddress2", null);
			session.setAttribute("billingcountryname", null);
			session.setAttribute("billingstatename", null);
			session.setAttribute("billingcityname", null);
			session.setAttribute("billingpincode", null);
			session.setAttribute("billingmobileno", null);

			session.setAttribute("deliveryname", null);
			session.setAttribute("deliveryemail", null);
			session.setAttribute("deliveryaddress1", null);
			session.setAttribute("deliveryaddress2", null);
			session.setAttribute("deliverycountryname", null);
			session.setAttribute("deliverystatename", null);
			session.setAttribute("deliverycityname", null);
			session.setAttribute("deliverypincode", null);
			session.setAttribute("deliverymobileno", null);

			if ((Integer) session.getAttribute("userId") == -1) {
				removeGuestUserDeliveryAddress(session);
			}

		} catch (Exception e) {

		}
	}

	@PostMapping("setGuestSession")
	public String setGuestSession(String guestemail, String guestmobileno, String guestFirstName, String guestLastName,
			HttpSession session) {
		logger.info("Inside Set Guest Session");
		try {
			session.setMaxInactiveInterval(30 * 60); // Set Session Time Out time is 30 Minutes

			session.setAttribute("userId", -1); // for guest user
			session.setAttribute("guestFirstName", guestFirstName);
			session.setAttribute("guestLastName", guestLastName);
			session.setAttribute("guestemail", guestemail);
			session.setAttribute("guestmobileno", guestmobileno);

		} catch (Exception e) {

		}

		return "";
	}

	private List<UserAddress> getGuestUserAddress(HttpSession session) {
		logger.info("Inside Get Guest Addresses");
		session.setAttribute("selectedDeliveryUserAddressId", -1);

		List<UserAddress> addresses = new ArrayList<UserAddress>();

		UserAddress userAddress = new UserAddress();
		userAddress.setUserAddressId(-1);
		userAddress.setFullName(
				session.getAttribute("guestname") != null ? (String) session.getAttribute("guestname") : "");
		userAddress.setEmailId(
				session.getAttribute("guestemail") != null ? session.getAttribute("guestemail").toString() : "");
		userAddress.setAddress1(
				session.getAttribute("guestaddress1") != null ? session.getAttribute("guestaddress1").toString() : "");
		userAddress.setAddress2(
				session.getAttribute("guestaddress2") != null ? session.getAttribute("guestaddress2").toString() : "");
		userAddress.setCityName(
				session.getAttribute("guestcityname") != null ? session.getAttribute("guestcityname").toString() : "");
		userAddress.setStateName(
				session.getAttribute("gueststatename") != null ? session.getAttribute("gueststatename").toString()
						: "");
		userAddress.setCountryId(session.getAttribute("guestcountryid") != null
				? Integer.parseInt(session.getAttribute("guestcountryid").toString())
				: 0);
		userAddress.setCountryName(
				session.getAttribute("guestcountryname") != null ? session.getAttribute("guestcountryname").toString()
						: "");
		userAddress.setPincode(
				session.getAttribute("guestpincode") != null ? (String) session.getAttribute("guestpincode") : "");
		userAddress.setMobileNo(
				session.getAttribute("guestmobileno") != null ? session.getAttribute("guestmobileno").toString() : "");

		addresses.add(userAddress);
		return addresses;
	}

	private void setGuestUserDeliveryAddress(HttpSession session, UserAddress userAddress) {
		logger.info("Inside Set Guest Delivery Address");

		session.setMaxInactiveInterval(30 * 60); // Set Session Time Out time is 30 Minutes

		session.setAttribute("guestname", userAddress.getFullName());
		session.setAttribute("guestemail", userAddress.getEmailId());
		session.setAttribute("guestaddress1", userAddress.getAddress1());
		session.setAttribute("guestaddress2", userAddress.getAddress2());
		session.setAttribute("guestcountryid", userAddress.getCountryId());
		session.setAttribute("guestcountryname", userAddress.getCountryName());
		session.setAttribute("gueststatename", userAddress.getStateName());
		session.setAttribute("guestcityname", userAddress.getCityName());
		session.setAttribute("guestpincode", userAddress.getPincode());
		session.setAttribute("guestmobileno", userAddress.getMobileNo());
		session.setAttribute("selectedDeliveryUserAddressId", -1); // for guest user

	}

	private void removeGuestUserDeliveryAddress(HttpSession session) {
		session.setAttribute("guestname", null);
		session.setAttribute("guestemail", null);
		session.setAttribute("guestaddress1", null);
		session.setAttribute("guestaddress2", null);
		session.setAttribute("guestcountryid", null);
		session.setAttribute("guestcountryname", null);
		session.setAttribute("gueststatename", null);
		session.setAttribute("guestcityname", null);
		session.setAttribute("guestpincode", null);
		session.setAttribute("guestmobileno", null);
	}
}
