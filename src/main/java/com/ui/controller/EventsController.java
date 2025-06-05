package com.ui.controller;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.ui.dao.EventsDAO;
import com.ui.dao.EventsImagesDAO;
import com.ui.model.Events;
import com.ui.model.EventsImages;

@RestController
@RequestMapping("/manageKuberbhandari")
public class EventsController {

	@Autowired
	private EventsDAO eventsDAO;

	@Autowired
	private EventsImagesDAO eventsImagesDAO;

	private static final Logger logger = LoggerFactory.getLogger(EventsController.class);

	@GetMapping("/getAllEvents")
	public ResponseEntity<List<Events>> getAllEvents() {
		logger.info("Fetching all Events");

		try {
			List<Events> events = eventsDAO.getAllEvents();
			if (events.size() > 0) {
				for (Events item : events) {
					item.setEventsImages(eventsImagesDAO.getAllEventImagesByEventId(item.getEventId()));
				}
			}
			return ResponseEntity.ok(events);

		} catch (Exception e) {
			logger.error("Error fetching all events", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveEvents")
	public ResponseEntity<List<Events>> getAllActiveEvents() {
		logger.info("Fetching all active events");

		try {
			List<Events> activeEvents = eventsDAO.getAllActiveEvents();

			if (activeEvents.isEmpty()) {
				return ResponseEntity.noContent().build();
			}
			if (activeEvents.size() > 0) {
				for (Events event : activeEvents) {
					event.setEventsImages(eventsImagesDAO.getAllEventImagesByEventId(event.getEventId()));
				}
			}

			return ResponseEntity.ok(activeEvents);
		} catch (Exception e) {
			logger.error("Error fetching active events", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getEventById/{eventId}")
	public ResponseEntity<Events> getEventById(@PathVariable("eventId") int eventId) {
		logger.info("Fetching event with ID: {}", eventId);

		try {
			Events events = eventsDAO.getEventById(eventId);

			if (events == null) {
				return ResponseEntity.notFound().build();
			}

			events.setEventsImages(eventsImagesDAO.getAllEventImagesByEventId(events.getEventId()));
			return ResponseEntity.ok(events);
		} catch (Exception e) {
			logger.error("Error fetching event with ID: {}", eventId, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/*
	 * @PostMapping("/addEvent") public ResponseEntity<Events>
	 * addEvent(@RequestParam(value = "eventStr") String eventStr,
	 * 
	 * @RequestParam(value = "eventImageStr") String eventImageStr,
	 * 
	 * @RequestParam(value = "file") MultipartFile image, int valuex, int valuey,
	 * int valuew, int valueh, HttpSession session, HttpServletRequest request) {
	 * 
	 * Gson gson = new Gson(); Events events = gson.fromJson(eventStr,
	 * Events.class); EventsImages eventImageObj = gson.fromJson(eventImageStr,
	 * EventsImages.class);
	 * 
	 * logger.info("Adding new event: {}", events);
	 * 
	 * int adminLoginUserId = (int) session.getAttribute("adminLoginUserId"); if
	 * (adminLoginUserId > 0) { if (events == null || events.getEventTitle() == null
	 * || events.getEventTitle().isEmpty()) {
	 * logger.error("Event name cannot be null or empty"); return
	 * ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null); } String IpAddress
	 * = request.getHeader("X-FORWARDED-FOR"); if (IpAddress == null) { IpAddress =
	 * request.getRemoteAddr(); } try { if (image.getOriginalFilename() != "") { try
	 * { byte[] bytes = image.getBytes();
	 * 
	 * File dir = new File(request.getSession().getServletContext().getRealPath("")
	 * + "/resources/front/img/Events");
	 * 
	 * if (!dir.exists()) dir.mkdirs();
	 * 
	 * String path = request.getSession().getServletContext()
	 * .getRealPath("/resources/front/img/Events/"); File uploadfile = new File(path
	 * + File.separator + image.getOriginalFilename());
	 * 
	 * ByteArrayInputStream in = new ByteArrayInputStream(bytes); try {
	 * BufferedImage img = ImageIO.read(image.getInputStream());
	 * 
	 * int imgWidth = img.getWidth(); int imgHeight = img.getHeight();
	 * 
	 * int cropWidth = Math.min(valuew, imgWidth - valuex); int cropHeight =
	 * Math.min(valueh, imgHeight - valuey);
	 * 
	 * if (cropWidth <= 0 || cropHeight <= 0) { throw new
	 * IllegalArgumentException("Invalid crop dimensions."); }
	 * 
	 * BufferedImage subImage = img.getSubimage(valuex, valuey, cropWidth,
	 * cropHeight);
	 * 
	 * Image scaledImage = img.getScaledInstance(cropWidth, cropHeight,
	 * Image.SCALE_SMOOTH); Graphics2D drawer = subImage.createGraphics();
	 * drawer.setComposite(AlphaComposite.Src);
	 * drawer.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
	 * RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	 * drawer.setRenderingHint(RenderingHints.KEY_RENDERING,
	 * RenderingHints.VALUE_RENDER_QUALITY);
	 * drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
	 * RenderingHints.VALUE_ANTIALIAS_ON); drawer.drawImage(scaledImage, 0, 0,
	 * null); drawer.dispose(); ByteArrayOutputStream buffer = new
	 * ByteArrayOutputStream(); ImageIO.write(subImage, "jpg", buffer); bytes =
	 * buffer.toByteArray(); } catch (IOException e) { }
	 * 
	 * BufferedOutputStream bufferedOutputStream = new BufferedOutputStream( new
	 * FileOutputStream(uploadfile)); bufferedOutputStream.write(bytes);
	 * bufferedOutputStream.close();
	 * 
	 * events.setCreatedBy(adminLoginUserId); events.setIpAddress(IpAddress); Events
	 * savedEvent = eventsDAO.addEvent(events); if (savedEvent.getEventId() > 0) {
	 * eventImageObj.setCreatedBy(adminLoginUserId);
	 * eventImageObj.setIpAddress(IpAddress);
	 * eventImageObj.setEventId(savedEvent.getEventId());
	 * eventImageObj.setEventsImages(image.getOriginalFilename());
	 * eventsImagesDAO.addEventImage(eventImageObj); } return
	 * ResponseEntity.status(HttpStatus.CREATED).body(savedEvent); } catch
	 * (Exception e) { logger.error("Error adding new event", e); return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); } }
	 * logger.error("Image not found"); return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); } catch
	 * (Exception e) { logger.error("Error adding new event", e); return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); } }
	 * return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null); }
	 */

	@PostMapping("/addEvent")
	public ResponseEntity<Events> addEvent(@RequestParam(value = "eventStr") String eventStr,
			@RequestParam(value = "eventImageStr") String eventImageStr,
			@RequestParam(value = "file") MultipartFile image, int valuex, int valuey, int valuew, int valueh,
			HttpSession session, HttpServletRequest request) {
		Gson gson = new Gson();
		Events events = gson.fromJson(eventStr, Events.class);
		EventsImages eventImageObj = gson.fromJson(eventImageStr, EventsImages.class);

		logger.info("Adding new event: {}", events);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (events == null || events.getEventTitle() == null || events.getEventTitle().isEmpty()) {
				logger.error("Event name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				if (image.getOriginalFilename() != "") {
					String image1 = "";
					try {
						byte[] bytes = image.getBytes();

						File dir = new File(request.getSession().getServletContext().getRealPath("")
								+ "/resources/front/img/Events");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/img/Events/");
						File uploadfile = new File(path + File.separator + image.getOriginalFilename());

						ByteArrayInputStream in = new ByteArrayInputStream(bytes);
						try {
							BufferedImage image2 = ImageIO.read(image.getInputStream());
							System.out.println("Image size: " + image2.getWidth() + "x" + image2.getHeight());
							System.out.println("Crop coordinates: x=" + valuex + ", y=" + valuey + ", width=" + valuew
									+ ", height=" + valueh);

							BufferedImage img = ImageIO.read(in);

							int imgWidth = img.getWidth();
							int imgHeight = img.getHeight();

							// Validate cropping bounds
							int cropWidth = Math.min(valuew, imgWidth - valuex);
							int cropHeight = Math.min(valueh, imgHeight - valuey);

							if (cropWidth <= 0 || cropHeight <= 0) {
								throw new IllegalArgumentException("Invalid crop dimensions.");
							}

							BufferedImage subImage = img.getSubimage(valuex, valuey, cropWidth, cropHeight);

							Image scaledImage = img.getScaledInstance(cropWidth, cropHeight, Image.SCALE_SMOOTH);
							Graphics2D drawer = subImage.createGraphics();
							drawer.setComposite(AlphaComposite.Src);
							drawer.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
									RenderingHints.VALUE_INTERPOLATION_BILINEAR);
							drawer.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
							drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
							drawer.drawImage(scaledImage, 0, 0, null);
							drawer.dispose();
							ByteArrayOutputStream buffer = new ByteArrayOutputStream();
							ImageIO.write(subImage, "jpg", buffer);
							bytes = buffer.toByteArray();
						} catch (IOException e) {
						}

						BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
								new FileOutputStream(uploadfile));
						bufferedOutputStream.write(bytes);
						bufferedOutputStream.close();

						/*
						 * image1 = request.getScheme() + "://" + request.getServerName() + ":" +
						 * request.getServerPort() + "/resources/front/demo-images/imgseva/" +
						 * image.getOriginalFilename();
						 */

						events.setCreatedBy(adminLoginUserId);
						events.setIpAddress(IpAddress);
						Events savedEvent = eventsDAO.addEvent(events);
						if (savedEvent.getEventId() > 0) {
							eventImageObj.setCreatedBy(adminLoginUserId);
							eventImageObj.setIpAddress(IpAddress);
							eventImageObj.setEventId(savedEvent.getEventId());
							eventImageObj.setEventImage(image.getOriginalFilename());
							eventsImagesDAO.addEventImage(eventImageObj);
						}
						return ResponseEntity.status(HttpStatus.CREATED).body(savedEvent);
					} catch (Exception e) {
						logger.error("Error adding new event", e);
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
					}
				}
				logger.error("Image not found");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			} catch (Exception e) {
				logger.error("Error adding new event", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateEvent")
	public ResponseEntity<Void> updateEvent(@RequestParam(value = "eventStr") String eventStr,
			@RequestParam(value = "eventImageStr") String eventImageStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int id, int valuex, int valuey,
			int valuew, int valueh, HttpSession session, HttpServletRequest request) {

		logger.info("Updating event with ID: {}", id);

		Gson gson = new Gson();
		Events events = gson.fromJson(eventStr, Events.class);
		EventsImages eventImageObj = gson.fromJson(eventImageStr, EventsImages.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (events == null || events.getEventTitle() == null || events.getEventTitle().isEmpty()) {
				logger.error("Event name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				Events existingEvent = eventsDAO.getEventById(id);
				if (existingEvent == null) {
					return ResponseEntity.notFound().build();
				}
				events.setCreatedBy(adminLoginUserId);
				events.setIpAddress(IpAddress);
				eventsDAO.updateEvent(events);
				try {
					if (image != null && !image.getOriginalFilename().isEmpty()) {
						byte[] bytes = image.getBytes();
						File dir = new File(request.getSession().getServletContext().getRealPath("")
								+ "/resources/front/img/Events");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/img/Events/");
						File uploadfile = new File(path + File.separator + image.getOriginalFilename());

						ByteArrayInputStream in = new ByteArrayInputStream(bytes);
						try {
							BufferedImage img = ImageIO.read(in);
							int imgWidth = img.getWidth();
							int imgHeight = img.getHeight();
							int cropWidth = Math.min(valuew, imgWidth - valuex);
							int cropHeight = Math.min(valueh, imgHeight - valuey);
							if (cropWidth <= 0 || cropHeight <= 0) {
								throw new IllegalArgumentException("Invalid crop dimensions.");
							}
							BufferedImage subImage = img.getSubimage(valuex, valuey, cropWidth, cropHeight);
							ImageIO.write(subImage, "jpg", uploadfile);
							eventImageObj.setEventImage(image.getOriginalFilename());
						} catch (IOException e) {
							logger.error("Error processing image", e);
							return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
						}
					}
					eventImageObj.setCreatedBy(adminLoginUserId);
					eventImageObj.setIpAddress(IpAddress);
					eventsImagesDAO.updateEventImage(eventImageObj);
				} catch (Exception e) {
					logger.error("Error updating eventImage", e);
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
				}
				return ResponseEntity.ok().build();
			} catch (Exception e) {
				logger.error("Error updating event with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
	}

	@DeleteMapping("/deleteEvent/{eventId}")
	public ResponseEntity<Void> deleteEvent(@PathVariable("eventId") int eventId) {

		logger.info("Deleting event with ID: {}", eventId);

		try {
			Events existingEvent = eventsDAO.getEventById(eventId);
			if (existingEvent == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = eventsDAO.deleteEvent(eventId);

			if (isDeleted) {
				logger.info("Event with ID: {} deleted successfully", eventId);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete event with ID: {}", eventId);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting event with ID: {}", eventId, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

}
