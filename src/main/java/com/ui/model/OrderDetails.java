package com.ui.model;

import java.util.List;

public class OrderDetails {

	private int orderDetailsId;
	private int sequence;
	private String orderNumber;
	private int userAddressId;
	private double totalAmount;
	private double subTotal;
	private String orderStatus;
	private String paymentStatus;
	private String trackingId;
	private String bankReferenceNumber;
	private String failureMessage;
	private String paymentMode;
	private String cardName;
	private String bankName;
	private int statusCode;
	private String currency;
	private String orderDate;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	private String billerName;
	private String billerEmailid;
	private String billerAddress1;
	private String billerAddress2;
	private String billerCountryName;
	private String billerStateName;
	private String billerCityName;
	private String billerPincode;
	private String billerMobileno;
	private List<OrderSevaDetails> orderSevaDetailsList;

	// Constructor
	public OrderDetails(int orderDetailsId, int sequence, String orderNumber, int userAddressId, double totalAmount,
			double subTotal, String orderStatus, String paymentStatus, String trackingId, String bankReferenceNumber,
			String failureMessage, String paymentMode, String cardName, String bankName, int statusCode,
			String currency, String orderDate, int createdBy, String createdDate, String ipAddress, String billerName,
			String billerEmailid, String billerAddress1, String billerAddress2, String billerCountryName,
			String billerStateName, String billerCityName, String billerPincode, String billerMobileno) {
		this.orderDetailsId = orderDetailsId;
		this.sequence = sequence;
		this.orderNumber = orderNumber;
		this.userAddressId = userAddressId;
		this.totalAmount = totalAmount;
		this.subTotal = subTotal;
		this.orderStatus = orderStatus;
		this.paymentStatus = paymentStatus;
		this.trackingId = trackingId;
		this.bankReferenceNumber = bankReferenceNumber;
		this.failureMessage = failureMessage;
		this.paymentMode = paymentMode;
		this.cardName = cardName;
		this.bankName = bankName;
		this.statusCode = statusCode;
		this.currency = currency;
		this.orderDate = orderDate;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
		this.billerName = billerName;
		this.billerEmailid = billerEmailid;
		this.billerAddress1 = billerAddress1;
		this.billerAddress2 = billerAddress2;
		this.billerCountryName = billerCountryName;
		this.billerStateName = billerStateName;
		this.billerCityName = billerCityName;
		this.billerPincode = billerPincode;
		this.billerMobileno = billerMobileno;
	}

	public OrderDetails() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
	public int getOrderDetailsId() {
		return orderDetailsId;
	}

	public void setOrderDetailsId(int orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getUserAddressId() {
		return userAddressId;
	}

	public void setUserAddressId(int userAddressId) {
		this.userAddressId = userAddressId;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getTrackingId() {
		return trackingId;
	}

	public void setTrackingId(String trackingId) {
		this.trackingId = trackingId;
	}

	public String getBankReferenceNumber() {
		return bankReferenceNumber;
	}

	public void setBankReferenceNumber(String bankReferenceNumber) {
		this.bankReferenceNumber = bankReferenceNumber;
	}

	public String getFailureMessage() {
		return failureMessage;
	}

	public void setFailureMessage(String failureMessage) {
		this.failureMessage = failureMessage;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getBillerName() {
		return billerName;
	}

	public String getBillerEmailid() {
		return billerEmailid;
	}

	public String getBillerAddress1() {
		return billerAddress1;
	}

	public String getBillerAddress2() {
		return billerAddress2;
	}

	public String getBillerCountryName() {
		return billerCountryName;
	}

	public String getBillerStateName() {
		return billerStateName;
	}

	public String getBillerCityName() {
		return billerCityName;
	}

	public String getBillerPincode() {
		return billerPincode;
	}

	public String getBillerMobileno() {
		return billerMobileno;
	}

	public void setBillerName(String billerName) {
		this.billerName = billerName;
	}

	public void setBillerEmailid(String billerEmailid) {
		this.billerEmailid = billerEmailid;
	}

	public void setBillerAddress1(String billerAddress1) {
		this.billerAddress1 = billerAddress1;
	}

	public void setBillerAddress2(String billerAddress2) {
		this.billerAddress2 = billerAddress2;
	}

	public void setBillerCountryName(String billerCountryName) {
		this.billerCountryName = billerCountryName;
	}

	public void setBillerStateName(String billerStateName) {
		this.billerStateName = billerStateName;
	}

	public void setBillerCityName(String billerCityName) {
		this.billerCityName = billerCityName;
	}

	public void setBillerPincode(String billerPincode) {
		this.billerPincode = billerPincode;
	}

	public void setBillerMobileno(String billerMobileno) {
		this.billerMobileno = billerMobileno;
	}

	public List<OrderSevaDetails> getOrderSevaDetailsList() {
		return orderSevaDetailsList;
	}

	public void setOrderSevaDetailsList(List<OrderSevaDetails> orderSevaDetailsList) {
		this.orderSevaDetailsList = orderSevaDetailsList;
	}

}
