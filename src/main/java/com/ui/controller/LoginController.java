package com.ui.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.LoginDAO;
import com.ui.dao.RolePagePermissionDAO;
import com.ui.dao.UserDAO;
import com.ui.enums.UserRoleEnum;
import com.ui.model.Cart;
import com.ui.model.RolePagePermission;
import com.ui.model.User;

@RestController
public class LoginController {

	@Autowired
	private LoginDAO loginDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private RolePagePermissionDAO rolePagePermissionDAO;

	// POST mapping for user login
	@PostMapping("/user-login")
	public boolean userLogin(@RequestParam("email") String email, HttpSession session, Model model) {

		// Validate email for login
		if (loginDAO.isExistUserEmail(email)) {
			int roleId = loginDAO.getUserRoleIdByEmail(email);

			if (roleId != UserRoleEnum.user.getValue()) {
				model.addAttribute("error", "Super Admin and Admin cannot log in here.");
				return false;
			} else {
				User user = loginDAO.getUserDetail(email);

				if (user != null) {
					session.setAttribute("userEmail", email); // Store email in session
					session.setAttribute("userRoleId", roleId);
					session.setAttribute("userName", user.getFirstName() + " " + user.getLastName());
					// return "redirect:/signIn"; // Redirect to sign-in page
					return true;
				} else {
					model.addAttribute("error", "User not found.");
					return false; // Return to login page
				}
			}
		} else {
			model.addAttribute("error", "Email not registered.");
			// return "user_login_register"; // Return to login page with error
			return false;
		}
	}

	@PostMapping("/user-create")
	public ResponseEntity<Map<String, Object>> userCreate(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email,
			@RequestParam("gender") int gender, @RequestParam("mobile") String mobile,
			@RequestParam("password") String password, HttpSession session, HttpServletRequest request) {

		Map<String, Object> response = new HashMap<>();

		// Check if the email already exists
		if (loginDAO.isExistUserEmail(email)) {
			response.put("status", HttpStatus.UNPROCESSABLE_ENTITY);
			response.put("message", "Email is already registered.");
		}

		String IpAddress = request.getHeader("X-FORWARDED-FOR");
		if (IpAddress == null) {
			IpAddress = request.getRemoteAddr();
		}

		// Create the User object
		User user = new User();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime date = LocalDateTime.now();
		user.setRoleId(UserRoleEnum.user.getValue());
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setGenderId(gender);
		user.setMobileNo(mobile);
		user.setEmailId(email);
		user.setPassword(password);
		user.setStatus("y");
		user.setCreatedDate(date.format(formatter));
		user.setIpAddress(IpAddress);

		// Save user to the database
		User isUserCreated = userDAO.addUser(user);

		if (isUserCreated.getUserId() > 0) {
			session.setAttribute("userEmail", email);
			session.setAttribute("userId", isUserCreated.getUserId());
			session.setAttribute("userName", isUserCreated.getFirstName() + " " + isUserCreated.getLastName());
			updateCart(session);
			response.put("status", HttpStatus.OK);
			response.put("message", "Account created successfully!");
		} else {
			response.put("status", HttpStatus.INTERNAL_SERVER_ERROR);
			response.put("message", "Failed to create account. Please try again.");
		}
		return ResponseEntity.ok(response);
	}

	@PostMapping("/user-signin")
	public boolean signIn(@RequestParam String email, @RequestParam String password, HttpSession session) {
		if (email == null || email == "") {
			email = (String) session.getAttribute("userEmail");
		}
		int roleId = loginDAO.getUserRoleIdByEmail(email);
		if (roleId != UserRoleEnum.user.getValue()) {
			return false;
		} else {
			boolean isValidUser = loginDAO.isValidUser(email, password);

			if (isValidUser) {
				User user = loginDAO.getUserDetail(email);
				session.setAttribute("user", user);
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userEmail", user.getEmailId());
				session.setAttribute("userName", user.getFirstName() + " " + user.getLastName());
				updateCart(session);
				return true;
			} else {
				return false;
			}
		}

	}

	/*
	 * @PostMapping("/get-signup-email") public String getSignUpEmail(HttpSession
	 * session) { String sessionEmail = (String) session.getAttribute("userEmail");
	 * return sessionEmail != null ? sessionEmail : "No email found in session."; }
	 */

	@PostMapping("/change-password")
	public String changePassword(@RequestParam String email, @RequestParam String currentPassword,
			@RequestParam String newPassword, @RequestParam String confirmPassword) {

		if (!newPassword.equals(confirmPassword)) {
			return "New password and confirm password do not match.";
		}

		String result = loginDAO.changePassword(email, currentPassword, newPassword, confirmPassword);

		return result; // Return the response from the DAO method
	}

	@PostMapping("/forgot-password")
	public String forgotPassword(@RequestParam("email") String email, Model model) {
		// Check if the email exists in the database
		if (loginDAO.isExistUserEmail(email)) {
			model.addAttribute("success", "A password reset link has been sent to your email.");
			return "success";
		} else {
			model.addAttribute("error", "Email not registered.");
			return "user_forgot_password"; // Return to forgot password page with an error message
		}
	}

	@PostMapping("/reset-password")
	public String resetPassword(@RequestParam("email") String email, @RequestParam("newPassword") String newPassword,
			Model model) {

		if (loginDAO.isExistUserEmail(email)) {

			if (newPassword.length() >= 6) {

				boolean isPasswordReset = loginDAO.resetPassword(email, newPassword);

				if (isPasswordReset) {
					model.addAttribute("success", "Password has been successfully reset.");
					return "user_login_register";
				} else {
					model.addAttribute("error", "Failed to reset password. Please try again.");
					return "user_forgot_password";
				}
			} else {
				model.addAttribute("error", "Password must be at least 6 characters long.");
				return "user_forgot_password";
			}
		} else {
			model.addAttribute("error", "Email not registered.");
			return "user_forgot_password";
		}

	}

	@GetMapping("check-user-login")
	public boolean checkUserLogin(HttpSession session) {
		boolean frontUserId = false;
		if (session.getAttribute("userId") != null) {
			frontUserId = true;
		}
		return frontUserId;
	}

	/*
	 * @PostMapping("/checkout-user-login") public boolean
	 * checkoutUserLogin(@RequestParam("email") String email, HttpSession session,
	 * Model model) {
	 * 
	 * // Validate email for login if (loginDAO.isExistUserEmail(email)) {
	 * 
	 * User user = loginDAO.getUserDetail(email);
	 * 
	 * if (user != null) { session.setAttribute("userEmail", email); // Store email
	 * in session session.setAttribute("userRoleId", user.getRoleId());
	 * session.setAttribute("userName", user.getFirstName() + " " +
	 * user.getLastName()); // return "redirect:/signIn"; // Redirect to sign-in
	 * page updateCart(session); return true; } else { model.addAttribute("error",
	 * "User not found."); return false; // Return to login page }
	 * 
	 * } else { model.addAttribute("error", "Email not registered."); // return
	 * "user_login_register"; // Return to login page with error return false; } }
	 */

	public void updateCart(HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart != null && cart.size() > 0) {
			for (Cart item : cart) {
				item.setUserId((Integer) session.getAttribute("userId"));
			}
			session.setAttribute("cart", cart);
			session.setAttribute("CartLength", cart.size());
		}
	}

	/***************** Admin ************************************/

/*	@PostMapping("/manageKuberbhandari/admin-login")
	public ResponseEntity<Map<String, Object>> adminLogin(@RequestParam String email, @RequestParam String password,
			HttpSession session) {

		boolean isValidAdminUser = loginDAO.isValidAdminUser(email, password);

		Map<String, Object> response = new HashMap<>();

		if (isValidAdminUser) {
			User user = loginDAO.getUserDetail(email);
			if (user.getRoleId() != UserRoleEnum.user.getValue()) {
				List<RolePagePermission> rolePagePermission = rolePagePermissionDAO
						.getPermissionsByRole(user.getRoleId());
				session.setAttribute("adminUser", user);
				session.setAttribute("adminUserRolePagePermission", rolePagePermission);
				session.setAttribute("adminUserName", user.getFirstName() + " " + user.getLastName());
				session.setAttribute("adminLoginUserId", user.getUserId());
				response.put("status", true);
				response.put("message", "Login successful!");
			} else {
				response.put("status", false);
				response.put("message", "Access denied: You do not have permission to log in here.");
			}
		} else {
			response.put("status", false);
			response.put("message", "Invalid username or password");
		}
		return ResponseEntity.ok(response);
	}
	*/
	
	@PostMapping("/manageKuberbhandari/admin-login")
	public ResponseEntity<Map<String, Object>> adminLogin(@RequestBody User loginRequest, HttpSession session) {
	    String email = loginRequest.getEmailId();
	    String password = loginRequest.getPassword();
	    boolean isValidAdminUser = loginDAO.isValidAdminUser(email, password);

		Map<String, Object> response = new HashMap<>();

		if (isValidAdminUser) {
			User user = loginDAO.getUserDetail(email);
			if (user.getRoleId() != UserRoleEnum.user.getValue()) {
				List<RolePagePermission> rolePagePermission = rolePagePermissionDAO
						.getPermissionsByRole(user.getRoleId());
				session.setAttribute("adminUser", user);
				session.setAttribute("adminUserRolePagePermission", rolePagePermission);
				session.setAttribute("adminUserName", user.getFirstName() + " " + user.getLastName());
				session.setAttribute("adminLoginUserId", user.getUserId());
				response.put("status", true);
				response.put("message", "Login successful!");
			} else {
				response.put("status", false);
				response.put("message", "Access denied: You do not have permission to log in here.");
			}
		} else {
			response.put("status", false);
			response.put("message", "Invalid username or password");
		}
		return ResponseEntity.ok(response);
	}
	

	
	@PostMapping("/manageKuberbhandari/admin-logout")
	public boolean adminLogout(HttpSession session) {
		session.invalidate();
		return true;
	}

}
