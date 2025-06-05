package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ui.dao.FestivalDAO;
import com.ui.dao.HinduMonthDAO;
import com.ui.dao.HinduMonthTypeDAO;
import com.ui.dao.HinduPakshDAO;
import com.ui.dao.HinduTithiDAO;
import com.ui.dao.HinduYearDAO;
import com.ui.dao.ImportantDatesDAO;
import com.ui.dao.SamvatDAO;
import com.ui.model.Festival;
import com.ui.model.HinduMonth;
import com.ui.model.HinduMonthType;
import com.ui.model.HinduPaksh;
import com.ui.model.HinduTithi;
import com.ui.model.HinduYear;
import com.ui.model.ImportantDates;
import com.ui.model.Samvat;

@RestController
@RequestMapping("/manageKuberbhandari")
public class ImportantDatesController {

	@Autowired
	private FestivalDAO festivalDAO;

	@Autowired
	private SamvatDAO samvatDAO;

	@Autowired
	private HinduYearDAO hinduYearDAO;

	@Autowired
	private HinduMonthDAO hinduMonthDAO;

	@Autowired
	private HinduPakshDAO hinduPakshDAO;

	@Autowired
	private HinduTithiDAO hinduTithiDAO;

	@Autowired
	private HinduMonthTypeDAO hinduMonthTypeDAO;

	@Autowired
	private ImportantDatesDAO importantDatesDAO;

	private static final Logger logger = LoggerFactory.getLogger(ImportantDatesController.class);

	/************************ Festivals ************************/

	@GetMapping("/getAllFestivals")
	public ResponseEntity<List<Festival>> getAllFestivals() {

		logger.info("Fetching all festivals");

		try {
			List<Festival> festivals = festivalDAO.getAllFestivals();
			return ResponseEntity.ok(festivals);

		} catch (Exception e) {
			logger.error("Error fetching all festivals", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveFestivals")
	public ResponseEntity<List<Festival>> getAllActiveFestivals() {

		logger.info("Fetching all active festivals");

		try {
			List<Festival> activeFestivals = festivalDAO.getAllActiveFestivals();

			if (activeFestivals.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeFestivals);
		} catch (Exception e) {
			logger.error("Error fetching active festivals", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getFestivalById/{id}")
	public ResponseEntity<Festival> getFestivalById(@PathVariable("id") int id) {

		logger.info("Fetching Festival with ID: {}", id);

		try {
			Festival festival = festivalDAO.getFestivalById(id);

			if (festival == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(festival);
		} catch (Exception e) {
			logger.error("Error fetching festival with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addFestival")
	public ResponseEntity<Festival> addFestival(@RequestParam("festivalStr") String festivalStr, HttpSession session,
			HttpServletRequest request) {

		Gson gson = new Gson();
		Festival festival = gson.fromJson(festivalStr, Festival.class);

		logger.info("Adding new festival: {}", festival);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (festival == null || festival.getFestivalName() == null || festival.getFestivalName().isEmpty()) {

				logger.error("Festival name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				festival.setCreatedBy(adminLoginUserId);
				festival.setIpAddress(ipAddress);

				Festival savedFestival = festivalDAO.addFestival(festival);

				if (savedFestival.getFestivalId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedFestival);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new festival", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateFestival")
	public ResponseEntity<Festival> updateFestival(@RequestParam("id") int id,
			@RequestParam("festivalStr") String festivalStr, HttpSession session, HttpServletRequest request) {

		logger.info("Updating festival with ID: {}", id);

		Gson gson = new Gson();
		Festival festival = gson.fromJson(festivalStr, Festival.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (festival == null || festival.getFestivalName() == null || festival.getFestivalName().isEmpty()) {

				logger.error("Festival name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				Festival existingFestival = festivalDAO.getFestivalById(id);
				if (existingFestival == null) {
					return ResponseEntity.notFound().build();
				}

				festival.setFestivalId(id); // Ensure correct ID is updated
				festival.setCreatedBy(adminLoginUserId);
				festival.setIpAddress(ipAddress);

				festivalDAO.updateFestival(festival);

				return ResponseEntity.ok(festival);

			} catch (Exception e) {
				logger.error("Error updating festival with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteFestival/{id}")
	public ResponseEntity<Void> deleteFestival(@PathVariable("id") int id) {

		logger.info("Deleting festival with ID: {}", id);

		try {
			Festival existingFestival = festivalDAO.getFestivalById(id);
			if (existingFestival == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = festivalDAO.deleteFestival(id);

			if (isDeleted) {
				logger.info("Festival with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete festival with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting festival with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Samvat ************************/

	@GetMapping("/getAllSamvat")
	public ResponseEntity<List<Samvat>> getAllSamvat() {

		logger.info("Fetching all samvat");

		try {
			List<Samvat> samvat = samvatDAO.getAllSamvat();
			return ResponseEntity.ok(samvat);

		} catch (Exception e) {
			logger.error("Error fetching all samvat", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveSamvat")
	public ResponseEntity<List<Samvat>> getAllActiveSamvat() {

		logger.info("Fetching all active samvat");

		try {
			List<Samvat> activeSamvat = samvatDAO.getAllActiveSamvat();

			if (activeSamvat.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeSamvat);
		} catch (Exception e) {
			logger.error("Error fetching active samvat", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getSamvatById/{id}")
	public ResponseEntity<Samvat> getSamvatById(@PathVariable("id") int id) {

		logger.info("Fetching samvat with ID: {}", id);

		try {
			Samvat samvat = samvatDAO.getSamvatById(id);

			if (samvat == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(samvat);
		} catch (Exception e) {
			logger.error("Error fetching samvat with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addSamvat")
	public ResponseEntity<Samvat> addSamvat(@RequestParam("samvatStr") String samvatStr, HttpSession session,
			HttpServletRequest request) {

		Gson gson = new Gson();
		Samvat samvat = gson.fromJson(samvatStr, Samvat.class);

		logger.info("Adding new samvat: {}", samvat);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (samvat == null || samvat.getSamvatName() == null || samvat.getSamvatName().isEmpty()) {

				logger.error("Samvat name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				samvat.setCreatedBy(adminLoginUserId);
				samvat.setIpAddress(ipAddress);

				Samvat savedSamvat = samvatDAO.addSamvat(samvat);

				if (savedSamvat.getSamvatId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedSamvat);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new samvat", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateSamvat")
	public ResponseEntity<Samvat> updateSamvat(@RequestParam("id") int id, @RequestParam("samvatStr") String samvatStr,
			HttpSession session, HttpServletRequest request) {

		logger.info("Updating samvat with ID: {}", id);

		Gson gson = new Gson();
		Samvat samvat = gson.fromJson(samvatStr, Samvat.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (samvat == null || samvat.getSamvatName() == null || samvat.getSamvatName().isEmpty()) {

				logger.error("Samvat name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				Samvat existingSamvat = samvatDAO.getSamvatById(id);
				if (existingSamvat == null) {
					return ResponseEntity.notFound().build();
				}

				samvat.setSamvatId(id); // Ensure correct ID is updated
				samvat.setCreatedBy(adminLoginUserId);
				samvat.setIpAddress(ipAddress);

				samvatDAO.updateSamvat(samvat);

				return ResponseEntity.ok(samvat);

			} catch (Exception e) {
				logger.error("Error updating samvat with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteSamvat/{id}")
	public ResponseEntity<Void> deleteSamvat(@PathVariable("id") int id) {

		logger.info("Deleting samvat with ID: {}", id);

		try {
			Samvat existingSamvat = samvatDAO.getSamvatById(id);
			if (existingSamvat == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = samvatDAO.deleteSamvat(id);

			if (isDeleted) {
				logger.info("Samvat with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete samvat with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting samvat with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Hindu Paksh ************************/

	@GetMapping("/getAllHinduPaksh")
	public ResponseEntity<List<HinduPaksh>> getAllHinduPaksh() {

		logger.info("Fetching all hindu paksh");

		try {
			List<HinduPaksh> hinduPaksh = hinduPakshDAO.getAllHinduPaksh();
			return ResponseEntity.ok(hinduPaksh);

		} catch (Exception e) {
			logger.error("Error fetching all hindu paksh", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveHinduPaksh")
	public ResponseEntity<List<HinduPaksh>> getAllActiveHinduPaksh() {

		logger.info("Fetching all active hindu paksh");

		try {
			List<HinduPaksh> activeHinduPaksh = hinduPakshDAO.getAllActiveHinduPaksh();

			if (activeHinduPaksh.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeHinduPaksh);
		} catch (Exception e) {
			logger.error("Error fetching active hindu paksh", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getHinduPakshById/{id}")
	public ResponseEntity<HinduPaksh> getHinduPakshById(@PathVariable("id") int id) {

		logger.info("Fetching hindu paksh with ID: {}", id);

		try {
			HinduPaksh hinduPaksh = hinduPakshDAO.getHinduPakshById(id);

			if (hinduPaksh == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(hinduPaksh);
		} catch (Exception e) {
			logger.error("Error fetching hindu paksh with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addHinduPaksh")
	public ResponseEntity<HinduPaksh> addHinduPaksh(@RequestParam("hinduPakshStr") String hinduPakshStr,
			HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		HinduPaksh hinduPaksh = gson.fromJson(hinduPakshStr, HinduPaksh.class);

		logger.info("Adding new hindu paksh: {}", hinduPaksh);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (hinduPaksh == null || hinduPaksh.getPakshName() == null || hinduPaksh.getPakshName().isEmpty()) {

				logger.error("Hindu paksh name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				hinduPaksh.setCreatedBy(adminLoginUserId);
				hinduPaksh.setIpAddress(ipAddress);

				HinduPaksh savedHinduPaksh = hinduPakshDAO.addHinduPaksh(hinduPaksh);

				if (savedHinduPaksh.getHinduPakshId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedHinduPaksh);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new hindu paksh", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateHinduPaksh")
	public ResponseEntity<HinduPaksh> updateHinduPaksh(@RequestParam("id") int id,
			@RequestParam("hinduPakshStr") String hinduPakshStr, HttpSession session, HttpServletRequest request) {

		logger.info("Updating hindu paksh with ID: {}", id);

		Gson gson = new Gson();
		HinduPaksh hinduPaksh = gson.fromJson(hinduPakshStr, HinduPaksh.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (hinduPaksh == null || hinduPaksh.getPakshName() == null || hinduPaksh.getPakshName().isEmpty()) {

				logger.error("Hindu paksh name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				HinduPaksh existingHinduPaksh = hinduPakshDAO.getHinduPakshById(id);
				if (existingHinduPaksh == null) {
					return ResponseEntity.notFound().build();
				}

				hinduPaksh.setHinduPakshId(id); // Ensure correct ID is updated
				hinduPaksh.setCreatedBy(adminLoginUserId);
				hinduPaksh.setIpAddress(ipAddress);

				hinduPakshDAO.updateHinduPaksh(hinduPaksh);

				return ResponseEntity.ok(hinduPaksh);

			} catch (Exception e) {
				logger.error("Error updating hindu paksh with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteHinduPaksh/{id}")
	public ResponseEntity<Void> deleteHinduPaksh(@PathVariable("id") int id) {

		logger.info("Deleting hindu paksh with ID: {}", id);

		try {
			HinduPaksh existingHinduPaksh = hinduPakshDAO.getHinduPakshById(id);
			if (existingHinduPaksh == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = hinduPakshDAO.deleteHinduPaksh(id);

			if (isDeleted) {
				logger.info("Hindu paksh with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete hindu paksh with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting hindu paksh with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Hindu Year ************************/

	@GetMapping("/getAllHinduYear")
	public ResponseEntity<List<HinduYear>> getAllHinduYear() {

		logger.info("Fetching all hindu year");

		try {
			List<HinduYear> hinduYear = hinduYearDAO.getAllHinduYear();
			return ResponseEntity.ok(hinduYear);

		} catch (Exception e) {
			logger.error("Error fetching all hindu year", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveHinduYear")
	public ResponseEntity<List<HinduYear>> getAllActiveHinduYear() {

		logger.info("Fetching all active hindu year");

		try {
			List<HinduYear> activeHinduYear = hinduYearDAO.getAllActiveHinduYear();

			if (activeHinduYear.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeHinduYear);
		} catch (Exception e) {
			logger.error("Error fetching active hindu year", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getHinduYearById/{id}")
	public ResponseEntity<HinduYear> getHinduYearById(@PathVariable("id") int id) {

		logger.info("Fetching hindu year with ID: {}", id);

		try {
			HinduYear hinduYear = hinduYearDAO.getHinduYearById(id);

			if (hinduYear == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(hinduYear);
		} catch (Exception e) {
			logger.error("Error fetching hindu year with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addHinduYear")
	public ResponseEntity<HinduYear> addHinduYear(@RequestParam("hinduYearStr") String hinduYearStr,
			HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		HinduYear hinduYear = gson.fromJson(hinduYearStr, HinduYear.class);

		logger.info("Adding new hindu year: {}", hinduYear);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (hinduYear == null || hinduYear.getHinduYear() == null || hinduYear.getHinduYear().isEmpty()) {

				logger.error("Hindu year cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				hinduYear.setCreatedBy(adminLoginUserId);
				hinduYear.setIpAddress(ipAddress);

				HinduYear savedHinduYear = hinduYearDAO.addHinduYear(hinduYear);

				if (savedHinduYear.getHinduYearId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedHinduYear);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new hindu year", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateHinduYear")
	public ResponseEntity<HinduYear> updateHinduYear(@RequestParam("id") int id,
			@RequestParam("hinduYearStr") String hinduYearStr, HttpSession session, HttpServletRequest request) {

		logger.info("Updating hindu year with ID: {}", id);

		Gson gson = new Gson();
		HinduYear hinduYear = gson.fromJson(hinduYearStr, HinduYear.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (hinduYear == null || hinduYear.getHinduYear() == null || hinduYear.getHinduYear().isEmpty()) {

				logger.error("Hindu year cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				HinduYear existingHinduYear = hinduYearDAO.getHinduYearById(id);
				if (existingHinduYear == null) {
					return ResponseEntity.notFound().build();
				}

				hinduYear.setHinduYearId(id); // Ensure correct ID is updated
				hinduYear.setCreatedBy(adminLoginUserId);
				hinduYear.setIpAddress(ipAddress);

				hinduYearDAO.updateHinduYear(hinduYear);

				return ResponseEntity.ok(hinduYear);

			} catch (Exception e) {
				logger.error("Error updating hindu year with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteHinduYear/{id}")
	public ResponseEntity<Void> deleteHinduYear(@PathVariable("id") int id) {

		logger.info("Deleting hindu year with ID: {}", id);

		try {
			HinduYear existingHinduYear = hinduYearDAO.getHinduYearById(id);
			if (existingHinduYear == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = hinduYearDAO.deleteHinduYear(id);

			if (isDeleted) {
				logger.info("Hindu year with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete hindu year with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting hindu year with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Hindu Month ************************/

	@GetMapping("/getAllHinduMonth")
	public ResponseEntity<List<HinduMonth>> getAllHinduMonth() {

		logger.info("Fetching all hindu month");

		try {
			List<HinduMonth> hinduMonth = hinduMonthDAO.getAllHinduMonth();
			return ResponseEntity.ok(hinduMonth);

		} catch (Exception e) {
			logger.error("Error fetching all hindu month", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveHinduMonth")
	public ResponseEntity<List<HinduMonth>> getAllActiveHinduMonth() {

		logger.info("Fetching all active hindu month");

		try {
			List<HinduMonth> activeHinduMonth = hinduMonthDAO.getAllActiveHinduMonth();

			if (activeHinduMonth.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeHinduMonth);
		} catch (Exception e) {
			logger.error("Error fetching active hindu month", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getHinduMonthById/{id}")
	public ResponseEntity<HinduMonth> getHinduMonthById(@PathVariable("id") int id) {

		logger.info("Fetching hindu month with ID: {}", id);

		try {
			HinduMonth hinduMonth = hinduMonthDAO.getHinduMonthById(id);

			if (hinduMonth == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(hinduMonth);
		} catch (Exception e) {
			logger.error("Error fetching hindu month with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addHinduMonth")
	public ResponseEntity<HinduMonth> addHinduMonth(@RequestParam("hinduMonthStr") String hinduMonthStr,
			HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		HinduMonth hinduMonth = gson.fromJson(hinduMonthStr, HinduMonth.class);

		logger.info("Adding new hindu month: {}", hinduMonth);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (hinduMonth == null || hinduMonth.getHinduMonthName() == null
					|| hinduMonth.getHinduMonthName().isEmpty()) {

				logger.error("Hindu month name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				hinduMonth.setCreatedBy(adminLoginUserId);
				hinduMonth.setIpAddress(ipAddress);

				HinduMonth savedHinduMonth = hinduMonthDAO.addHinduMonth(hinduMonth);

				if (savedHinduMonth.getHinduMonthId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedHinduMonth);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new hindu month", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateHinduMonth")
	public ResponseEntity<HinduMonth> updateHinduMonth(@RequestParam("id") int id,
			@RequestParam("hinduMonthStr") String hinduMonthStr, HttpSession session, HttpServletRequest request) {

		logger.info("Updating hindu month with ID: {}", id);

		Gson gson = new Gson();
		HinduMonth hinduMonth = gson.fromJson(hinduMonthStr, HinduMonth.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (hinduMonth == null || hinduMonth.getHinduMonthName() == null
					|| hinduMonth.getHinduMonthName().isEmpty()) {

				logger.error("Hindu month name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				HinduMonth existingHinduMonth = hinduMonthDAO.getHinduMonthById(id);
				if (existingHinduMonth == null) {
					return ResponseEntity.notFound().build();
				}

				hinduMonth.setHinduMonthId(id); // Ensure correct ID is updated
				hinduMonth.setCreatedBy(adminLoginUserId);
				hinduMonth.setIpAddress(ipAddress);

				hinduMonthDAO.updateHinduMonth(hinduMonth);

				return ResponseEntity.ok(hinduMonth);

			} catch (Exception e) {
				logger.error("Error updating hindu month with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteHinduMonth/{id}")
	public ResponseEntity<Void> deleteHinduMonth(@PathVariable("id") int id) {

		logger.info("Deleting hindu month with ID: {}", id);

		try {
			HinduMonth existingHinduMonth = hinduMonthDAO.getHinduMonthById(id);
			if (existingHinduMonth == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = hinduMonthDAO.deleteHinduMonth(id);

			if (isDeleted) {
				logger.info("Hindu month with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete hindu month with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting hindu month with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Hindu Tithi ************************/

	@GetMapping("/getAllHinduTithi")
	public ResponseEntity<List<HinduTithi>> getAllHinduTithi() {

		logger.info("Fetching all hindu tithi");

		try {
			List<HinduTithi> hinduTithi = hinduTithiDAO.getAllHinduTithi();
			return ResponseEntity.ok(hinduTithi);

		} catch (Exception e) {
			logger.error("Error fetching all hindu tithi", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveHinduTithi")
	public ResponseEntity<List<HinduTithi>> getAllActiveHinduTithi() {

		logger.info("Fetching all active hindu tithi");

		try {
			List<HinduTithi> activeHinduTithi = hinduTithiDAO.getAllActiveHinduTithi();

			if (activeHinduTithi.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeHinduTithi);
		} catch (Exception e) {
			logger.error("Error fetching active hindu tithi", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getHinduTithiById/{id}")
	public ResponseEntity<HinduTithi> getHinduTithiById(@PathVariable("id") int id) {

		logger.info("Fetching hindu tithi with ID: {}", id);

		try {
			HinduTithi hinduTithi = hinduTithiDAO.getHinduTithiById(id);

			if (hinduTithi == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(hinduTithi);
		} catch (Exception e) {
			logger.error("Error fetching hindu tithi with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addHinduTithi")
	public ResponseEntity<HinduTithi> addHinduTithi(@RequestParam("hinduTithiStr") String hinduTithiStr,
			HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		HinduTithi hinduTithi = gson.fromJson(hinduTithiStr, HinduTithi.class);

		logger.info("Adding new hindu tithi: {}", hinduTithi);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (hinduTithi == null || hinduTithi.getTithiName() == null || hinduTithi.getTithiName().isEmpty()) {

				logger.error("Hindu tithi cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				hinduTithi.setCreatedBy(adminLoginUserId);
				hinduTithi.setIpAddress(ipAddress);

				HinduTithi savedHinduTithi = hinduTithiDAO.addHinduTithi(hinduTithi);

				if (savedHinduTithi.getHinduTithiId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedHinduTithi);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new hindu tithi", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateHinduTithi")
	public ResponseEntity<HinduTithi> updateHinduTithi(@RequestParam("id") int id,
			@RequestParam("hinduTithiStr") String hinduTithiStr, HttpSession session, HttpServletRequest request) {

		logger.info("Updating hindu tithi with ID: {}", id);

		Gson gson = new Gson();
		HinduTithi hinduTithi = gson.fromJson(hinduTithiStr, HinduTithi.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (hinduTithi == null || hinduTithi.getTithiName() == null || hinduTithi.getTithiName().isEmpty()) {

				logger.error("Hindu tithi name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				HinduTithi existingHinduTithi = hinduTithiDAO.getHinduTithiById(id);
				if (existingHinduTithi == null) {
					return ResponseEntity.notFound().build();
				}

				hinduTithi.setHinduTithiId(id); // Ensure correct ID is updated
				hinduTithi.setCreatedBy(adminLoginUserId);
				hinduTithi.setIpAddress(ipAddress);

				hinduTithiDAO.updateHinduTithi(hinduTithi);

				return ResponseEntity.ok(hinduTithi);

			} catch (Exception e) {
				logger.error("Error updating hindu tithi with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteHinduTithi/{id}")
	public ResponseEntity<Void> deleteHinduTithi(@PathVariable("id") int id) {

		logger.info("Deleting hindu tithi with ID: {}", id);

		try {
			HinduTithi existingHinduTithi = hinduTithiDAO.getHinduTithiById(id);
			if (existingHinduTithi == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = hinduTithiDAO.deleteHinduTithi(id);

			if (isDeleted) {
				logger.info("Hindu tithi with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete hindu tithi with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting hindu tithi with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/************************ Hindu Month Type ************************/

	@GetMapping("/getAllHinduMonthType")
	public ResponseEntity<List<HinduMonthType>> getAllHinduMonthType() {

		logger.info("Fetching all hindu month type");

		try {
			List<HinduMonthType> hinduMonthType = hinduMonthTypeDAO.getAllHinduMonthType();
			return ResponseEntity.ok(hinduMonthType);

		} catch (Exception e) {
			logger.error("Error fetching all hindu month type", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveHinduMonthType")
	public ResponseEntity<List<HinduMonthType>> getAllActiveHinduMonthType() {

		logger.info("Fetching all active hindu month type");

		try {
			List<HinduMonthType> activeHinduMonthType = hinduMonthTypeDAO.getAllActiveHinduMonthType();

			if (activeHinduMonthType.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeHinduMonthType);
		} catch (Exception e) {
			logger.error("Error fetching active hindu month type", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getHinduMonthTypeById/{id}")
	public ResponseEntity<HinduMonthType> getHinduMonthTypeById(@PathVariable("id") int id) {

		logger.info("Fetching hindu month type with ID: {}", id);

		try {
			HinduMonthType hinduMonthType = hinduMonthTypeDAO.getHinduMonthTypeById(id);

			if (hinduMonthType == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(hinduMonthType);
		} catch (Exception e) {
			logger.error("Error fetching hindu month type with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addHinduMonthType")
	public ResponseEntity<HinduMonthType> addHinduMonthType(@RequestParam("hinduMonthTypeStr") String hinduMonthTypeStr,
			HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		HinduMonthType hinduMonthType = gson.fromJson(hinduMonthTypeStr, HinduMonthType.class);

		logger.info("Adding new hindu month type: {}", hinduMonthType);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (hinduMonthType == null || hinduMonthType.getHinduMonthType() == null
					|| hinduMonthType.getHinduMonthType().isEmpty()) {

				logger.error("Hindu month type cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				// Set metadata
				hinduMonthType.setCreatedBy(adminLoginUserId);
				hinduMonthType.setIpAddress(ipAddress);

				HinduMonthType savedHinduMonthType = hinduMonthTypeDAO.addHinduMonthType(hinduMonthType);

				if (savedHinduMonthType.getHinduMonthTypeId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedHinduMonthType);
				} else {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

			} catch (Exception e) {
				logger.error("Error adding new hindu month type", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateHinduMonthType")
	public ResponseEntity<HinduMonthType> updateHinduMonthType(@RequestParam("id") int id,
			@RequestParam("hinduMonthTypeStr") String hinduMonthTypeStr, HttpSession session,
			HttpServletRequest request) {

		logger.info("Updating hindu month type with ID: {}", id);

		Gson gson = new Gson();
		HinduMonthType hinduMonthType = gson.fromJson(hinduMonthTypeStr, HinduMonthType.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (hinduMonthType == null || hinduMonthType.getHinduMonthType() == null
					|| hinduMonthType.getHinduMonthType().isEmpty()) {

				logger.error("Hindu month type name cannot be null or empty");

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				HinduMonthType existingHinduMonthType = hinduMonthTypeDAO.getHinduMonthTypeById(id);
				if (existingHinduMonthType == null) {
					return ResponseEntity.notFound().build();
				}

				hinduMonthType.setHinduMonthTypeId(id); // Ensure correct ID is updated
				hinduMonthType.setCreatedBy(adminLoginUserId);
				hinduMonthType.setIpAddress(ipAddress);

				hinduMonthTypeDAO.updateHinduMonthType(hinduMonthType);

				return ResponseEntity.ok(hinduMonthType);

			} catch (Exception e) {
				logger.error("Error updating hindu month type with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteHinduMonthType/{id}")
	public ResponseEntity<Void> deleteHinduMonthType(@PathVariable("id") int id) {

		logger.info("Deleting hindu month type with ID: {}", id);

		try {
			HinduMonthType existingHinduMonthType = hinduMonthTypeDAO.getHinduMonthTypeById(id);
			if (existingHinduMonthType == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = hinduMonthTypeDAO.deleteHinduMonthType(id);

			if (isDeleted) {
				logger.info("Hindu month type with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete hindu month type with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting hindu month type with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/**************** Important Dates *************************/

	@GetMapping("/getAllImportantDates")
	public ResponseEntity<List<ImportantDates>> getAllImportantDates() {

		logger.info("Fetching all important dates");

		try {
			List<ImportantDates> importantDates = importantDatesDAO.getAllImportantDates();
			return ResponseEntity.ok(importantDates);
		} catch (Exception e) {
			logger.error("Error fetching all important dates", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveImportantDates")
	public ResponseEntity<List<ImportantDates>> getAllActiveImportantDates() {

		logger.info("Fetching all active important dates");

		try {
			List<ImportantDates> activeImportantDates = importantDatesDAO.getAllActiveImportantDates();

			if (activeImportantDates.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeImportantDates);
		} catch (Exception e) {
			logger.error("Error fetching active important dates", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getImportantDateById/{id}")
	public ResponseEntity<ImportantDates> getImportantDateById(@PathVariable("id") int id) {

		logger.info("Fetching important dates with ID: {}", id);

		try {
			ImportantDates importantDates = importantDatesDAO.getImportantDateById(id);

			if (importantDates == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(importantDates);
		} catch (Exception e) {
			logger.error("Error fetching important dates with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addImportantDates")
	public ResponseEntity<ImportantDates> addImportantDates(
			@RequestParam(value = "importantDatesStr") String importantDatesStr, HttpSession session,
			HttpServletRequest request) {

		Gson gson = new Gson();
		ImportantDates importantDates = gson.fromJson(importantDatesStr, ImportantDates.class);

		logger.info("Adding new important dates: {}", importantDates);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");

		if (adminLoginUserId > 0) {
			if (importantDates == null || importantDates.getFestivalId() == 0) {
				logger.error("Festival ID is required");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				importantDates.setCreatedBy(adminLoginUserId);
				importantDates.setIpAddress(ipAddress);
				ImportantDates savedImportantDates = importantDatesDAO.addImportantDates(importantDates);

				return ResponseEntity.status(HttpStatus.CREATED).body(savedImportantDates);
			} catch (Exception e) {
				logger.error("Error adding important dates", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateImportantDates")
	public ResponseEntity<ImportantDates> updateImportantDates(
			@RequestParam(value = "importantDatesStr") String importantDatesStr, int id, HttpSession session,
			HttpServletRequest request) {

		logger.info("Updating important dates with ID: {}", id);

		Gson gson = new Gson();
		ImportantDates importantDates = gson.fromJson(importantDatesStr, ImportantDates.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (importantDates == null || importantDates.getFestivalId() == 0 || importantDates.getEnglishDate() == null
					|| importantDates.getEnglishDate().isEmpty()) {
				logger.error("Festival ID and English date cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}

			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}

			try {
				ImportantDates existingImportantDates = importantDatesDAO.getImportantDateById(id);
				if (existingImportantDates == null) {
					return ResponseEntity.notFound().build();
				}

				importantDates.setCreatedBy(adminLoginUserId);
				importantDates.setIpAddress(ipAddress);
				importantDatesDAO.updateImportantDates(importantDates);

				return ResponseEntity.ok(importantDates);
			} catch (Exception e) {
				logger.error("Error updating important date with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}

		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteImportantDates/{id}")
	public ResponseEntity<Void> deleteImportantDates(@PathVariable("id") int id) {

		logger.info("Deleting important dates with ID: {}", id);

		try {
			ImportantDates existingImportantDates = importantDatesDAO.getImportantDateById(id);
			if (existingImportantDates == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = importantDatesDAO.deleteImportantDates(id);

			if (isDeleted) {
				logger.info("Important dates with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete important dates with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting important dates with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

}
