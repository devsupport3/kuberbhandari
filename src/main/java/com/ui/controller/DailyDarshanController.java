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
import java.lang.reflect.Type;
import java.util.ArrayList;
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
import com.google.gson.reflect.TypeToken;
import com.ui.dao.DailyDarshanDAO;
import com.ui.dao.DailyDarshanImagesDAO;
import com.ui.model.DailyDarshan;
import com.ui.model.DailyDarshanImages;

@RestController
@RequestMapping("/manageKuberbhandari")
public class DailyDarshanController {

	@Autowired
	private DailyDarshanDAO dailyDarshanDAO;

	@Autowired
	private DailyDarshanImagesDAO dailyDarshanImagesDAO;

	private static final Logger logger = LoggerFactory.getLogger(DailyDarshanController.class);

	/*********************************************
	 * Manage Daily Darshan
	 ************************************/

	@PostMapping("/addDailyDarshan")
	public ResponseEntity<DailyDarshan> addDailyDarshan(@RequestParam("dailyDarshanStr") String dailyDarshanStr,
			@RequestParam("dailyDarshanImageStr") String dailyDarshanImageStr,
			@RequestParam("files") List<MultipartFile> images, @RequestParam("valuex") int valuex,
			@RequestParam("valuey") int valuey, @RequestParam("valuew") int valuew, @RequestParam("valueh") int valueh,
			@RequestParam("imageInputType") String imageInputType, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		DailyDarshan dailyDarshan = gson.fromJson(dailyDarshanStr, DailyDarshan.class);

		// Parse JSON array of DailyDarshanImages
		Type listType = new TypeToken<List<DailyDarshanImages>>() {
		}.getType();
		List<DailyDarshanImages> dailyDarshanImageList = gson.fromJson(dailyDarshanImageStr, listType);

		logger.info("Adding new daily darshan Image: {}", dailyDarshan);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId <= 0) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}

		if (dailyDarshan == null || dailyDarshan.getDailyDarshanTitle() == null
				|| dailyDarshan.getDailyDarshanTitle().isEmpty()) {

			logger.error("Daily Darshan title cannot be null or empty");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}

		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}

		try {
			// Save uploaded images
			List<String> imagePaths = new ArrayList<>();

			for (MultipartFile image : images) {
				if (!image.getOriginalFilename().isEmpty()) {
					String imageName = image.getOriginalFilename();
					byte[] bytes = image.getBytes();

					File dir = new File(request.getSession().getServletContext().getRealPath("")
							+ "/resources/front/img/DailyDarshan");
					if (!dir.exists()) {
						dir.mkdirs();
					}

					String path = request.getSession().getServletContext()
							.getRealPath("/resources/front/img/DailyDarshan");
					File uploadfile = new File(path + File.separator + imageName);

					// Crop and scale image
					ByteArrayInputStream in = new ByteArrayInputStream(bytes);
					BufferedImage img = ImageIO.read(in);

					int imgWidth = img.getWidth();
					int imgHeight = img.getHeight();

					int cropWidth = imgWidth;
					int cropHeight = imgHeight;

					if (!"upload".equals(imageInputType)) {
						cropWidth = Math.min(valuew, imgWidth - valuex);
						cropHeight = Math.min(valueh, imgHeight - valuey);

						if (cropWidth <= 0 || cropHeight <= 0) {
							throw new IllegalArgumentException("Invalid crop dimensions.");
						}
					}

					BufferedImage subImage = img.getSubimage(valuex, valuey, cropWidth, cropHeight);
					Image scaledImage = subImage.getScaledInstance(cropWidth, cropHeight, Image.SCALE_SMOOTH);

					BufferedImage finalImage = new BufferedImage(cropWidth, cropHeight, BufferedImage.TYPE_INT_RGB);
					Graphics2D g2d = finalImage.createGraphics();
					g2d.setComposite(AlphaComposite.Src);
					g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
					g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
					g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
					g2d.drawImage(scaledImage, 0, 0, null);
					g2d.dispose();

					ByteArrayOutputStream buffer = new ByteArrayOutputStream();
					ImageIO.write(finalImage, "jpg", buffer);
					bytes = buffer.toByteArray();

					// Save image to disk
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadfile));
					bos.write(bytes);
					bos.close();

					imagePaths.add(imageName);
				}
			}

			// Save DailyDarshan
			dailyDarshan.setCreatedBy(adminLoginUserId);
			dailyDarshan.setIpAddress(ipAddress);
			DailyDarshan savedDailyDarshan = dailyDarshanDAO.addDailyDarshan(dailyDarshan);

			if (savedDailyDarshan.getDailyDarshanId() > 0) {
				for (int i = 0; i < imagePaths.size(); i++) {
					DailyDarshanImages dailyDarshanImage = dailyDarshanImageList.get(i);
					dailyDarshanImage.setCreatedBy(adminLoginUserId);
					dailyDarshanImage.setIpAddress(ipAddress);
					dailyDarshanImage.setDailyDarshanId(savedDailyDarshan.getDailyDarshanId());
					dailyDarshanImage.setDailyDarshanImages(imagePaths.get(i));

					dailyDarshanImagesDAO.addDailyDarshanImage(dailyDarshanImage);
				}
			}

			return ResponseEntity.status(HttpStatus.CREATED).body(savedDailyDarshan);

		} catch (Exception e) {
			logger.error("Error adding new daily darshan", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/updateDailyDarshan")
	public ResponseEntity<DailyDarshan> updateDailyDarshan(@RequestParam("dailyDarshanStr") String dailyDarshanStr,
			@RequestParam("dailyDarshanImageStr") String dailyDarshanImageStr,
			@RequestParam("files") List<MultipartFile> images, @RequestParam("valuex") int valuex,
			@RequestParam("valuey") int valuey, @RequestParam("valuew") int valuew, @RequestParam("valueh") int valueh,
			@RequestParam("imageInputType") String imageInputType, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		DailyDarshan dailyDarshan = gson.fromJson(dailyDarshanStr, DailyDarshan.class);

		Type listType = new TypeToken<List<DailyDarshanImages>>() {
		}.getType();
		List<DailyDarshanImages> dailyDarshanImageList = gson.fromJson(dailyDarshanImageStr, listType);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId <= 0) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}

		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}

		try {
			List<String> imagePaths = new ArrayList<>();

			for (MultipartFile image : images) {
				if (!image.getOriginalFilename().isEmpty()) {
					String imageName = image.getOriginalFilename();
					byte[] bytes = image.getBytes();

					File dir = new File(request.getSession().getServletContext().getRealPath("")
							+ "/resources/front/img/DailyDarshan");
					if (!dir.exists()) {
						dir.mkdirs();
					}

					String path = request.getSession().getServletContext()
							.getRealPath("/resources/front/img/DailyDarshan");
					File uploadfile = new File(path + File.separator + imageName);

					ByteArrayInputStream in = new ByteArrayInputStream(bytes);
					BufferedImage img = ImageIO.read(in);
					
					int imgWidth = img.getWidth();
					int imgHeight = img.getHeight();
					
					int cropWidth = img.getWidth();
					int cropHeight = img.getHeight();

					if (!"upload".equals(imageInputType)) {
						cropWidth = Math.min(valuew, imgWidth - valuex);
						cropHeight = Math.min(valueh, imgHeight - valuey);

						if (cropWidth <= 0 || cropHeight <= 0) {
							throw new IllegalArgumentException("Invalid crop dimensions.");
						}
					}

					BufferedImage subImage = img.getSubimage(valuex, valuey, cropWidth, cropHeight);
					Image scaledImage = subImage.getScaledInstance(cropWidth, cropHeight, Image.SCALE_SMOOTH);

					BufferedImage finalImage = new BufferedImage(cropWidth, cropHeight, BufferedImage.TYPE_INT_RGB);
					Graphics2D g2d = finalImage.createGraphics();
					g2d.drawImage(scaledImage, 0, 0, null);
					g2d.dispose();

					ByteArrayOutputStream buffer = new ByteArrayOutputStream();
					ImageIO.write(finalImage, "jpg", buffer);
					bytes = buffer.toByteArray();

					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadfile));
					bos.write(bytes);
					bos.close();

					imagePaths.add(imageName);
				}
			}

			dailyDarshan.setCreatedBy(adminLoginUserId);
			dailyDarshan.setIpAddress(ipAddress);
			dailyDarshanDAO.updateDailyDarshan(dailyDarshan);

			for (int i = 0; i < imagePaths.size(); i++) {
				DailyDarshanImages img = dailyDarshanImageList.get(i);
				img.setCreatedBy(adminLoginUserId);
				img.setIpAddress(ipAddress);
				img.setDailyDarshanId(dailyDarshan.getDailyDarshanId());
				img.setDailyDarshanImages(imagePaths.get(i));
				dailyDarshanImagesDAO.addDailyDarshanImage(img);
			}

			return ResponseEntity.ok(dailyDarshan);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@DeleteMapping("/deleteDailyDarshan/{id}")
	public ResponseEntity<Void> deleteDailyDarshan(@PathVariable("id") int id) {
		logger.info("Deleting daily darshan with ID: {}", id);

		try {
			DailyDarshan existingDailyDarshan = dailyDarshanDAO.getDailyDarshanById(id);
			if (existingDailyDarshan == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = dailyDarshanDAO.deleteDailyDarshan(id);

			if (isDeleted) {
				dailyDarshanImagesDAO.deleteDailyDarshanImages(id);
				logger.info("Daily Darshan with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete dailyDarshan with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting dailyDarshan with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllDailyDarshan")
	public ResponseEntity<List<DailyDarshan>> getAllDailyDarshan() {
		logger.info("Fetching all dailyDarshan");

		try {
			List<DailyDarshan> dailyDarshan = dailyDarshanDAO.getAllDailyDarshan();
			if (dailyDarshan.size() > 0) {
				for (DailyDarshan item : dailyDarshan) {
					item.setDailyDarshanImages(
							dailyDarshanImagesDAO.getAllDailyDarshanImagesByDailyDarshanId(item.getDailyDarshanId()));
				}
			}
			return ResponseEntity.ok(dailyDarshan);

		} catch (Exception e) {
			logger.error("Error fetching all dailyDarshan", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveDailyDarshan")
	public ResponseEntity<List<DailyDarshan>> getAllActiveDailyDarshan(
			@RequestParam(name = "filterToday", defaultValue = "false") boolean filterToday) {

		logger.info("Fetching all active dailyDarshan");

		try {
			List<DailyDarshan> activeDailyDarshan = dailyDarshanDAO.getAllActiveDailyDarshan(filterToday);

			if (activeDailyDarshan.isEmpty()) {
				return ResponseEntity.noContent().build();
			}
			if (activeDailyDarshan.size() > 0) {
				for (DailyDarshan item : activeDailyDarshan) {
					item.setDailyDarshanImages(
							dailyDarshanImagesDAO.getAllDailyDarshanImagesByDailyDarshanId(item.getDailyDarshanId()));
				}
			}

			return ResponseEntity.ok(activeDailyDarshan);
		} catch (Exception e) {
			logger.error("Error fetching active dailyDarshan", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getDailyDarshanById/{id}")
	public ResponseEntity<DailyDarshan> getDailyDarshanById(@PathVariable("id") int id) {
		logger.info("Fetching daily darshan with ID: {}", id);

		try {
			DailyDarshan dailyDarshan = dailyDarshanDAO.getDailyDarshanById(id);

			if (dailyDarshan == null) {
				return ResponseEntity.notFound().build();
			}

			dailyDarshan.setDailyDarshanImages(
					dailyDarshanImagesDAO.getAllDailyDarshanImagesByDailyDarshanId(dailyDarshan.getDailyDarshanId()));
			return ResponseEntity.ok(dailyDarshan);
		} catch (Exception e) {
			logger.error("Error fetching daily darshan with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@DeleteMapping("/deleteDailyDarshanImage/{imageId}")
	public ResponseEntity<Void> deleteDailyDarshanImage(@PathVariable("imageId") int imageId) {
		logger.info("Deleting Daily Darshan Image with ID: {}", imageId);

		try {
			boolean isDeleted = dailyDarshanImagesDAO.deleteDailyDarshanImage(imageId);

			if (isDeleted) {
				logger.info("Daily Darshan Image with ID: {} deleted successfully", imageId);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Daily Darshan Image with ID: {} not found or could not be deleted", imageId);
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			logger.error("Error deleting Daily Darshan Image with ID: {} - {}", imageId, e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

}
