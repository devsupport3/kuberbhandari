package com.ui.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.CartDAO;
import com.ui.dao.OrderDetailsDAO;
import com.ui.dao.SevaDAO;
import com.ui.dao.SevaImagesDAO;
import com.ui.model.Cart;
import com.ui.model.Seva;
import com.ui.model.SevaImages;

@RestController
public class CartController {

	@Autowired
	private SevaDAO sevaDAO;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private OrderDetailsDAO orderDetailsDAO;

	@Autowired
	private SevaImagesDAO sevaImagesDAO;

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@PostMapping("/addToCart")
	public ResponseEntity<List<Cart>> addToCart(@RequestParam("sevaId") int sevaId,
			@RequestParam("bookigDate") String bookingDate, @RequestParam("quantity") int orderSevaQuantity,
			HttpSession session) {
		logger.info("Adding Seva ID {} to cart", sevaId);

		try {
			// Retrieve Seva details
			Seva seva = sevaDAO.getSevaById(sevaId);

			if (seva == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
			}

			List<SevaImages> sevaImages = sevaImagesDAO.getAllSevaImagesBySevaId(sevaId);

			int frontUserId = -1;
			if (session.getAttribute("userId") != null) {
				frontUserId = (Integer) session.getAttribute("userId");
			}

			// Get or create the cart session
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			String orderNumber;
			if (cart == null || cart.size() <= 0) {
				cart = new ArrayList<>();
				orderNumber = generateOrderNumber();
			} else {
				orderNumber = cart.get(0).getOrderNumber();
			}

			// Check if Seva already exists in the cart
			boolean found = false;
			for (Cart item : cart) {
				if (item.getOrderSevaId() == sevaId && item.getBookingDate().equals(bookingDate)) {
					item.setOrderSevaQuantity(item.getOrderSevaQuantity() + orderSevaQuantity);
					found = true;
					break;
				}
			}

			// If not found, add new Seva to cart
			if (!found) {
				Cart newCartItem = new Cart();
				newCartItem.setOrderSevaId(seva.getSevaId());
				newCartItem.setOrderSevaTitle(seva.getSevaTitle());
				newCartItem.setOrderSevaDescription(seva.getSevaDescription());
				newCartItem.setOrderSevaPrice(seva.getSevaPrice());
				newCartItem.setOrderSevaQuantity(orderSevaQuantity);
				newCartItem.setOrderSevaImages(sevaImages.get(0).getSevaImages());
				newCartItem.setUserId(frontUserId);
				newCartItem.setOrderNumber(orderNumber);
				newCartItem.setBookingDate(bookingDate);
				newCartItem.setOrderVariationId(seva.getVariationId());
				newCartItem.setOrderFrequencyId(seva.getFrequencyId());
				newCartItem.setOrderVariationName(seva.getVariationName());
				newCartItem.setOrderFrequencyName(seva.getFrequencyName());
				newCartItem.setOrderDelivery(seva.getDelivery());

				cart.add(newCartItem);
			}

			// Save updated cart in session
			session.setAttribute("cart", cart);
			session.setAttribute("CartLength", cart.size());
			/*
			 * // Add cart item to the database using addCart method Cart addedCart =
			 * cartDAO.addCart(cart.get(cart.size() - 1));
			 * 
			 * // Optionally, add order details for this cart item OrderDetails orderDetails
			 * = new OrderDetails();
			 * orderDetails.setOrderSevaId(addedCart.getOrderSevaId());
			 * orderDetails.setOrderSevaTitle(addedCart.getOrderSevaTitle());
			 * orderDetails.setOrderSevaDescription(seva.getSevaDescription());
			 * orderDetails.setOrderSevaPrice(addedCart.getOrderSevaPrice());
			 * orderDetails.setOrderSevaQuantity(addedCart.getOrderSevaQuantity());
			 * orderDetails.setOrderSevaImages(addedCart.getOrderSevaImages()); // Add other
			 * necessary fields for OrderDetails
			 * orderDetailsDAO.addOrderDetails(orderDetails);
			 */

			return ResponseEntity.ok(cart);

		} catch (Exception e) {
			logger.error("Error adding Seva to cart", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	public static String generateOrderNumber() {
		// Generate a random number, for example between 1 and 9999999
		Random random = new Random();
		int randomNumber = random.nextInt(10000000); // Generates a number between 0 and 9999999

		// Format the number with leading zeros to be 7 digits long
		String formattedNumber = String.format("%07d", randomNumber);

		// Prefix with 'KB' and return the result
		return "KB" + formattedNumber;
	}

	@GetMapping("/getCart")
	public ResponseEntity<List<Cart>> getCart(HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
		}
		session.setAttribute("CartLength", cart.size());
		return ResponseEntity.ok(cart);
	}

	@PostMapping("/removeFromCart")
	public ResponseEntity<List<Cart>> removeFromCart(@RequestParam("sevaId") int sevaId,
			@RequestParam("bookingDate") String bookingDate, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");

		if (cart != null) {
			boolean itemFound = false;
			for (int i = 0; i < cart.size(); i++) {
				Cart item = cart.get(i);
				if (item.getOrderSevaId() == sevaId && item.getBookingDate().equals(bookingDate)) {
					cart.remove(i);
					itemFound = true;
					break;
				}
			}

			if (itemFound) {

				// Call the removeFromCart method to remove from the DB
				cartDAO.removeFromCart(sevaId);
				session.setAttribute("cart", cart);
				session.setAttribute("CartLength", cart.size());
				if (checkDeliveryEnabled(cart) == false) {
					session.setAttribute("selectedDeliveryUserAddressId", 0);
				}
				return ResponseEntity.ok(cart);
			} else {
				return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	}

	@GetMapping("check-delivery-enabled")
	public boolean checkDeliveryEnabled(HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		return checkDeliveryEnabled(cart);
	}

	public boolean checkDeliveryEnabled(List<Cart> cart) {
		if (cart == null || cart.isEmpty()) {
			return false;
		}
		// Check if any cart item has delivery set to "y"
		for (Cart item : cart) {
			if ("y".equalsIgnoreCase(item.getOrderDelivery())) {
				return true;
			}
		}
		return false;
	}

	@GetMapping("cancel-order")
	public ResponseEntity<List<Cart>> cancelOrder(HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
		}
		cart.clear();
		session.setAttribute("cart", cart);
		session.setAttribute("CartLength", cart.size());
		return ResponseEntity.ok(cart);
	}
}
