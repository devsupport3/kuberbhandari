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
import com.ui.dao.GalleryDAO;
import com.ui.dao.GalleryImagesDAO;
import com.ui.model.Gallery;
import com.ui.model.GalleryImages;

@RestController
@RequestMapping("/manageKuberbhandari")
public class GalleryController {

	@Autowired
	private GalleryDAO galleryDAO;

	@Autowired
	private GalleryImagesDAO galleryImagesDAO;

	private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);

	@GetMapping("/getAllGallery")
	public ResponseEntity<List<Gallery>> getAllGallery() {
		logger.info("Fetching all gallery");

		try {
			List<Gallery> galleryList = galleryDAO.getAllGallery();
			if (galleryList.size() > 0) {
				for (Gallery item : galleryList) {
					item.setGalleryImages(galleryImagesDAO.getAllGalleryImagesByGalleryId(item.getAlbumId()));
				}
			}
			return ResponseEntity.ok(galleryList);

		} catch (Exception e) {
			logger.error("Error fetching all gallery", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getGalleryById/{albumId}")
	public ResponseEntity<Gallery> getGalleryById(@PathVariable("albumId") int albumId) {

		logger.info("Fetching gallery with ID: {}", albumId);

		try {
			Gallery gallery = galleryDAO.getGalleryById(albumId);

			if (gallery == null) {
				return ResponseEntity.notFound().build();
			}

			gallery.setGalleryImages(galleryImagesDAO.getAllGalleryImagesByAlbumId(albumId));
			return ResponseEntity.ok(gallery);

		} catch (Exception e) {
			logger.error("Error fetching gallery with ID: {}", albumId, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addAlbum")
	public ResponseEntity<Gallery> addAlbum(@RequestParam("albumStr") String albumStr,
			@RequestParam("albumImageStr") String albumImageStr, @RequestParam("files") List<MultipartFile> images,
			@RequestParam("valuex") int valuex, @RequestParam("valuey") int valuey, @RequestParam("valuew") int valuew,
			@RequestParam("valueh") int valueh, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		Gallery gallery = gson.fromJson(albumStr, Gallery.class);

		// Parse JSON array of GalleryImages
		Type listType = new TypeToken<List<GalleryImages>>() {
		}.getType();
		List<GalleryImages> galleryImageList = gson.fromJson(albumImageStr, listType);

		logger.info("Adding new album: {}", gallery);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId <= 0) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}

		if (gallery == null || gallery.getAlbumTitle() == null || gallery.getAlbumTitle().isEmpty()) {
			logger.error("Album title cannot be null or empty");
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
							+ "/resources/front/images/gallery");
					if (!dir.exists()) {
						dir.mkdirs();
					}

					String path = request.getSession().getServletContext()
							.getRealPath("/resources/front/images/gallery");
					File uploadfile = new File(path + File.separator + imageName);

					// Crop and scale image
					ByteArrayInputStream in = new ByteArrayInputStream(bytes);
					BufferedImage img = ImageIO.read(in);

					int imgWidth = img.getWidth();
					int imgHeight = img.getHeight();

					int cropWidth = Math.min(valuew, imgWidth - valuex);
					int cropHeight = Math.min(valueh, imgHeight - valuey);

					if (cropWidth <= 0 || cropHeight <= 0) {
						throw new IllegalArgumentException("Invalid crop dimensions.");
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

			// Save gallery
			gallery.setCreatedBy(adminLoginUserId);
			gallery.setIpAddress(ipAddress);
			Gallery savedAlbum = galleryDAO.addGallery(gallery);

			if (savedAlbum.getAlbumId() > 0) {
				for (int i = 0; i < imagePaths.size(); i++) {
					GalleryImages galleryImage = galleryImageList.get(i);
					galleryImage.setCreatedBy(adminLoginUserId);
					galleryImage.setIpAddress(ipAddress);
					galleryImage.setAlbumId(savedAlbum.getAlbumId());
					galleryImage.setImage(imagePaths.get(i));

					galleryImagesDAO.addGalleryImage(galleryImage);
				}
			}

			return ResponseEntity.status(HttpStatus.CREATED).body(savedAlbum);

		} catch (Exception e) {
			logger.error("Error adding new album", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/updateAlbum")
	public ResponseEntity<Gallery> updateAlbum(@RequestParam("albumStr") String albumStr,
			@RequestParam("albumImageStr") String albumImageStr, @RequestParam("files") List<MultipartFile> images,
			@RequestParam("valuex") int valuex, @RequestParam("valuey") int valuey, @RequestParam("valuew") int valuew,
			@RequestParam("valueh") int valueh, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		Gallery gallery = gson.fromJson(albumStr, Gallery.class);

		Type listType = new TypeToken<List<GalleryImages>>() {
		}.getType();
		List<GalleryImages> galleryImageList = gson.fromJson(albumImageStr, listType);

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
							+ "/resources/front/images/gallery");
					if (!dir.exists()) {
						dir.mkdirs();
					}

					String path = request.getSession().getServletContext()
							.getRealPath("/resources/front/images/gallery");
					File uploadfile = new File(path + File.separator + imageName);

					ByteArrayInputStream in = new ByteArrayInputStream(bytes);
					BufferedImage img = ImageIO.read(in);

					int cropWidth = Math.min(valuew, img.getWidth() - valuex);
					int cropHeight = Math.min(valueh, img.getHeight() - valuey);

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

			gallery.setCreatedBy(adminLoginUserId);
			gallery.setIpAddress(ipAddress);
			galleryDAO.updateGallery(gallery);

			for (int i = 0; i < imagePaths.size(); i++) {
				GalleryImages img = galleryImageList.get(i);
				img.setCreatedBy(adminLoginUserId);
				img.setIpAddress(ipAddress);
				img.setAlbumId(gallery.getAlbumId());
				img.setImage(imagePaths.get(i));
				galleryImagesDAO.addGalleryImage(img);
			}

			return ResponseEntity.ok(gallery);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@DeleteMapping("/deleteGalleryImage/{albumImageId}")
	public ResponseEntity<Void> deleteGalleryImage(@PathVariable("albumImageId") int albumImageId) {
		logger.info("Deleting Daily Darshan Image with ID: {}", albumImageId);

		try {
			boolean isDeleted = galleryImagesDAO.deleteGalleryImage(albumImageId);

			if (isDeleted) {
				logger.info("Gallery Image with ID: {} deleted successfully", albumImageId);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Gallery Image with ID: {} not found or could not be deleted", albumImageId);
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			logger.error("Error deleting gallery Image with ID: {} - {}", albumImageId, e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	@DeleteMapping("/deleteGallery/{albumId}")
	public ResponseEntity<Void> deleteGallery(@PathVariable("albumId") int albumId) {
		logger.info("Deleting album with ID: {}", albumId);

		try {
			Gallery existingGallery = galleryDAO.getGalleryById(albumId);
			if (existingGallery == null) {
				return ResponseEntity.notFound().build();
			}

			// Step 1: Delete images from album_image table
			galleryImagesDAO.deleteGalleryImagesByAlbumId(albumId);

			// Step 2: Delete album from album table
			boolean isDeleted = galleryDAO.deleteGallery(albumId);

			if (isDeleted) {
				logger.info("Gallery with ID: {} and its images deleted successfully", albumId);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete gallery with ID: {}", albumId);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}

		} catch (Exception e) {
			logger.error("Error deleting gallery and images for ID: {}", albumId, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	@GetMapping("/getAllActiveGallery")
	public ResponseEntity<List<Gallery>> getAllActiveGallery() {
		logger.info("Fetching all active gallery");

		try {
			List<Gallery> activeGallery = galleryDAO.getAllActiveGallery();

			if (activeGallery.isEmpty()) {
				return ResponseEntity.noContent().build();
			}
			if (activeGallery.size() > 0) {
				for (Gallery gallery : activeGallery) {
					gallery.setGalleryImages(galleryImagesDAO.getAllGalleryImagesByAlbumId(gallery.getAlbumId()));
				}
			}

			return ResponseEntity.ok(activeGallery);
		} catch (Exception e) {
			logger.error("Error fetching active gallery", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

}