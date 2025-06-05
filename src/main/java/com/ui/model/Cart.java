package com.ui.model;

public class Cart {

	private int orderSevaDetailsId;
	private int orderSevaId;
	private String orderSevaTitle;
	private String orderSevaDescription;
	private double orderSevaPrice;
	private int orderSevaQuantity;
	private String orderSevaImages;
	private int userId;
	private String orderNumber;
	private String bookingDate;
	private int orderVariationId;
	private int orderFrequencyId;
	private String orderVariationName;
	private String orderFrequencyName;
	private String orderDelivery;

	// Constructor
	public Cart(int orderSevaDetailsId, int orderSevaId, String orderSevaTitle, String orderSevaDescription,
			double orderSevaPrice, int orderSevaQuantity, String orderSevaImages, int userId, String orderNumber,
			String bookingDate, int orderVariationId, int orderFrequencyId, String orderVariationName,
			String orderFrequencyName, String orderDelivery) {
		this.orderSevaDetailsId = orderSevaDetailsId;
		this.orderSevaId = orderSevaId;
		this.orderSevaTitle = orderSevaTitle;
		this.orderSevaDescription = orderSevaDescription;
		this.orderSevaPrice = orderSevaPrice;
		this.orderSevaQuantity = orderSevaQuantity;
		this.orderSevaImages = orderSevaImages;
		this.userId = userId;
		this.bookingDate = bookingDate;
		this.orderNumber = orderNumber;
		this.orderVariationId = orderVariationId;
		this.orderFrequencyId = orderFrequencyId;
		this.orderVariationName = orderVariationName;
		this.orderFrequencyName = orderFrequencyName;
		this.orderDelivery = orderDelivery;
	}

	public String getOrderDelivery() {
		return orderDelivery;
	}

	public void setOrderDelivery(String orderDelivery) {
		this.orderDelivery = orderDelivery;
	}

	public String getOrderVariationName() {
		return orderVariationName;
	}

	public String getOrderFrequencyName() {
		return orderFrequencyName;
	}

	public void setOrderVariationName(String orderVariationName) {
		this.orderVariationName = orderVariationName;
	}

	public void setOrderFrequencyName(String orderFrequencyName) {
		this.orderFrequencyName = orderFrequencyName;
	}

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
	public int getOrderSevaDetailsId() {
		return orderSevaDetailsId;
	}

	public void setOrderSevaDetailsId(int orderSevaDetailsId) {
		this.orderSevaDetailsId = orderSevaDetailsId;
	}

	public int getOrderSevaId() {
		return orderSevaId;
	}

	public void setOrderSevaId(int orderSevaId) {
		this.orderSevaId = orderSevaId;
	}

	public String getOrderSevaTitle() {
		return orderSevaTitle;
	}

	public void setOrderSevaTitle(String orderSevaTitle) {
		this.orderSevaTitle = orderSevaTitle;
	}

	public String getOrderSevaDescription() {
		return orderSevaDescription;
	}

	public void setOrderSevaDescription(String orderSevaDescription) {
		this.orderSevaDescription = orderSevaDescription;
	}

	public double getOrderSevaPrice() {
		return orderSevaPrice;
	}

	public void setOrderSevaPrice(double orderSevaPrice) {
		this.orderSevaPrice = orderSevaPrice;
	}

	public int getOrderSevaQuantity() {
		return orderSevaQuantity;
	}

	public void setOrderSevaQuantity(int orderSevaQuantity) {
		this.orderSevaQuantity = orderSevaQuantity;
	}

	public String getOrderSevaImages() {
		return orderSevaImages;
	}

	public void setOrderSevaImages(String orderSevaImages) {
		this.orderSevaImages = orderSevaImages;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getOrderVariationId() {
		return orderVariationId;
	}

	public void setOrderVariationId(int orderVariationId) {
		this.orderVariationId = orderVariationId;
	}

	public int getOrderFrequencyId() {
		return orderFrequencyId;
	}

	public void setOrderFrequencyId(int orderFrequencyId) {
		this.orderFrequencyId = orderFrequencyId;
	}
}
