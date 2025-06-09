package com.ui.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ui.dao.LoginDAO;
import com.ui.model.Cart;
import com.ui.model.User;

@Controller
@EnableAsync
public class MainController {

	@Autowired
	LoginDAO logindao;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@GetMapping("/")
	public String home(HttpServletRequest request) {
		return "index";
	}

	@GetMapping("/login-register")
	public String userLoginRegister() {
		return "user_login_register";
	}

	@GetMapping("/signIn")
	public String userSignIn(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/";
		}
		return "sign_in";
	}

	@GetMapping("/userForgotPassword")
	public String userForgotPassword(Locale locale, Model model, HttpSession session) {
		return "user_forgot_password";

	}

	@GetMapping("/userChangePassword")
	public String userChangePassword(Locale locale, Model model, SitePreference sitePreference, HttpSession session) {
		if (session.getAttribute("userid") != null) {
			return "index";
		}
		return "user_change_password";

	}

	@GetMapping("/check-session")
	public ResponseEntity<String> checkSession(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return ResponseEntity.ok("Session is still active");
		} else {
			return ResponseEntity.ok("Session is invalidated");
		}
	}

	@GetMapping("/kuber-bhandari")
	public String kuberBhandariHistory(Locale locale, Model model, HttpSession session) {
		return "kuber_bhandari";

	}

	@GetMapping("/kuber-bhandari-campus")
	public String kuberBhandariCampus(Locale locale, Model model, HttpSession session) {
		return "kuber_bhandari_campus";

	}

	@GetMapping("/pujaris")
	public String pujaris(Locale locale, Model model, HttpSession session) {
		return "pujaris";

	}

	@GetMapping("/trust")
	public String trust(Locale locale, Model model, HttpSession session) {
		return "trust";

	}

	@GetMapping("/sampark")
	public String sampark(Locale locale, Model model, HttpSession session) {
		return "sampark";

	}

	@GetMapping("/prabhu-seva")
	public String prabhuSeva(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "seva";

	}

	@GetMapping("/jan-seva")
	public String janSeva(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "";

	}

	@GetMapping("/seva-details")
	public String sevaDetail(@RequestParam(value = "sevaId") int sevaId, Locale locale, Model model,
			HttpSession session) {

		return "seva_details";
	}

	@GetMapping("/cart")
	public String cart(Locale locale, Model model, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return "index";
		}
		return "cart";
	}

	@GetMapping("/checkout")
	public String checkout(Locale locale, Model model, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return "index";
		}
		return "checkout";
	}

	@GetMapping("/delivery-address")
	public String deliveryAddress(Locale locale, Model model, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return "index";
		}
		return "delivery_address";
	}

	@GetMapping("/order-summary")
	public String orderSummary(@RequestParam(value = "userAddressId", required = false) Integer userAddressId,
			Locale locale, Model model, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return "index";
		}

		if (userAddressId != null && (userAddressId > 0 || userAddressId == -1)) {
			session.setAttribute("selectedDeliveryUserAddressId", userAddressId);
		}
		return "order_summary";
	}

	@GetMapping("/payment-option")
	public String paymentOption(Locale locale, Model model, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			return "index";
		}

		return "payment_option";
	}

	@GetMapping("/logout")
	public String logout(Locale locale, Model model, HttpSession session) {
		session.invalidate();

		return "index";

	}

	@RequestMapping(value = { "/ccavRequestHandler" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String ccavRequestHandler(final Model model) {
		return "ccavRequestHandler";
	}

	@RequestMapping(value = { "/ccavResponseHandler" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String ccavResponseHandler(final Model model) {
		return "ccavResponseHandler";
	}

	@GetMapping({ "datafrom" })
	public String datafrom(final Locale locale, final Model model, final HttpSession session) {
		MainController.logger.info("===== CART PAGE =====");
		return "datafrom";
	}

	/*
	 * @RequestMapping(value = { "/order_confirmation" }, method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String
	 * order_confirmation(final Model model, final HttpSession session) { Boolean
	 * isDeliveryEnabled = (Boolean) session.getAttribute("deliveryEnabled"); if
	 * (Boolean.TRUE.equals(isDeliveryEnabled)) { return
	 * "order_confirmation_for_delivery"; } else { return "booking_confirmation"; }
	 * }
	 */

	@RequestMapping(value = { "/order_confirmation" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String order_confirmation(final Model model, final HttpSession session) {
		return "order_confirmation";
	}

	@RequestMapping(value = { "/manage-address" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String manage_address(final Model model, final HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "manage_address";
		}
		return "index";
	}

	@RequestMapping(value = { "/order-history" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String my_orders(final Model model, final HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "my_order";
		}
		return "index";
	}

	@GetMapping("/darshan")
	public String dailyDarshan(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "darshan";

	}

	@GetMapping("/gallery")
	public String gallery(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "gallery";

	}

	@GetMapping("/events")
	public String events(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "events";

	}

	@GetMapping("/important-dates")
	public String importantDates(Locale locale, Model model, HttpSession session, SitePreference sitePreference) {
		session.setAttribute("sitepreference", sitePreference);

		return "important_dates";

	}

	/************** Admin ********************/

	@GetMapping("/manageKuberbhandari")
	public String manageKuberbhandari(Locale locale, Model model, SitePreference sitePreference, HttpSession session) {
		logger.info("Manage Kuberbhandari page accessed.");
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/login")
	public String adminLogin() {
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/admin-dashboard")
	public String adminHome(Locale locale, Model model, HttpSession session) {
		logger.info("Admin dashboard accessed.");

		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_dashboard";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/admin-seva-master")
	public String adminSeva1(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_seva_master";
		}
		return "admin/admin_login";
	}

	
	@GetMapping("/manageKuberbhandari/seva-type-master")
	public String sevaTypeMaster(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/seva_type_master";
		}
		return "admin/seva_type_master";
	}
	
	
	@GetMapping("/manageKuberbhandari/admin-seva")
	public String adminSeva(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_seva";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/seva-booked")
	public String sevaBooked(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/booking";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/admin-daily-darshan")
	public String adminDailyDarshan(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_daily_darshan";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/hindu-calendar-master")
	public String adminHinduCalendar(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/hindu_calendar";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/english-calendar-master")
	public String adminEnglishCalendar(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/english_calendar";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/gallery")
	public String gallery(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_gallery";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/events")
	public String events(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_events";
		}
		return "admin/admin_login";
	}

	@GetMapping("/manageKuberbhandari/admin-important-dates")
	public String adminImportantDates(HttpSession session) {
		User user = (User) session.getAttribute("adminUser");

		if (user != null) {
			logger.debug("Session details - ID: {}, Role: {}, Status: {}", user.getUserId());
			return "admin/admin_imp_date";
		}
		return "admin/admin_login";
	}
}
