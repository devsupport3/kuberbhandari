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
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.ui.dao.FrequencyDAO;
import com.ui.dao.SevaCategoryDAO;
import com.ui.dao.SevaDAO;
import com.ui.dao.SevaImagesDAO;
import com.ui.dao.SevaTypeDAO;
import com.ui.dao.VariationDAO;
import com.ui.model.Frequency;
import com.ui.model.Seva;
import com.ui.model.SevaCategory;
import com.ui.model.SevaImages;
import com.ui.model.SevaType;
import com.ui.model.Variation;

@RestController
@RequestMapping("/manageKuberbhandari/sevaType")
public class SevaController {

	@Autowired
	private SevaTypeDAO sevaTypeDAO;

	@Autowired
	private SevaCategoryDAO sevaCategoryDAO;

	@Autowired
	private VariationDAO variationDAO;

	@Autowired
	private FrequencyDAO frequencyDAO;

	@Autowired
	private SevaDAO sevaDAO;

	@Autowired
	private SevaImagesDAO sevaImagesDAO;

	private static final Logger logger = LoggerFactory.getLogger(SevaController.class);

	@GetMapping("/getAll")
	public ResponseEntity<ApiResponse<List<SevaType>>> getAllSevaTypes() {
		try {
			List<SevaType> sevaTypes = sevaTypeDAO.getAllSevaTypes();
			return ResponseEntity.ok(new ApiResponse<>(true, "Fetched successfully", sevaTypes));
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ApiResponse<>(false, "Error fetching seva types", null));
		}
	}



	@GetMapping("/getAllActiveSevaTypes")
	public ResponseEntity<List<SevaType>> getAllActiveSevaTypes() {
		logger.info("Fetching all active SevaTypes");

		try {
			List<SevaType> activeSevaTypes = sevaTypeDAO.getAllActiveSevaTypes();

			if (activeSevaTypes.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeSevaTypes);
		} catch (Exception e) {
			logger.error("Error fetching active seva types", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/{id}")
	public ResponseEntity<SevaType> getSevaTypeById(@PathVariable("id") int id) {
		logger.info("Fetching SevaType with ID: {}", id);

		try {
			SevaType sevaType = sevaTypeDAO.getSevaTypeById(id);

			if (sevaType == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(sevaType);
		} catch (Exception e) {
			logger.error("Error fetching seva type with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}



	@PostMapping({ "/add", "/update" })
	public ResponseEntity<ApiResponse<SevaType>> handleSevaType(@RequestParam("sevaTypeStr") String sevaTypeStr,
			@RequestParam(value = "file", required = false) MultipartFile image,
			@RequestParam(value = "valuex", required = false) Double valuex,
			@RequestParam(value = "valuey", required = false) Double valuey,
			@RequestParam(value = "valuew", required = false) Double valuew,
			@RequestParam(value = "valueh", required = false) Double valueh,
			@RequestParam(value = "previewWidth", required = false) Double previewWidth,
			@RequestParam(value = "previewHeight", required = false) Double previewHeight, HttpSession session,
			HttpServletRequest request) {

		int userId = (int) session.getAttribute("adminLoginUserId");
		if (userId <= 0)
			return unauthorized();

		boolean isUpdate = request.getRequestURI().endsWith("/update");

		try {
			SevaType sevaType = processRequest(sevaTypeStr, image, valuex, valuey, valuew, valueh, previewWidth,
					previewHeight, request, userId, isUpdate);

			if (isUpdate) {
				if (sevaType.getId() == 0) {
					return ResponseEntity.badRequest()
							.body(new ApiResponse<>(false, "SevaType ID is required for update", null));
				}
				boolean updated = sevaTypeDAO.updateSevaType(sevaType);
				if (updated) {
					return ResponseEntity.ok(new ApiResponse<>(true, "Record updated successfully", sevaType));
				}
				return serverError("Update failed");
			} else {
				SevaType saved = sevaTypeDAO.addSevaType(sevaType);
				if (saved != null && saved.getId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED)
							.body(new ApiResponse<>(true, "Record added successfully", saved));
				}
				return serverError("Failed to save SevaType");
			}

		} catch (Exception e) {
			logger.error(isUpdate ? "Update error" : "Add error", e);
			return serverError(e.getMessage());
		}
	}

	private SevaType processRequest(String sevaTypeStr, MultipartFile image, Double valuex, Double valuey,
			Double valuew, Double valueh, Double previewWidth, Double previewHeight, HttpServletRequest request,
			int userId, boolean isUpdate) throws IOException {

		Gson gson = new Gson();
		SevaType sevaType = gson.fromJson(sevaTypeStr, SevaType.class);

		// Process image if uploaded
		if (image != null && !image.isEmpty()) {
			String uploadDirPath = request.getSession().getServletContext()
					.getRealPath("/resources/front/demo-images/imgseva/");
			String imagePath = ImageCrop.saveAndCropImage(image, valuex, valuey, valuew, valueh, previewWidth,
					previewHeight, uploadDirPath);
			sevaType.setImage(imagePath);
		}

		String ipAddress = getClientIp(request);
		sevaType.setCreatedBy(userId);
		sevaType.setIpAddress(ipAddress);

		return sevaType;
	}

	private String getClientIp(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		return (ip != null && !ip.isEmpty()) ? ip : request.getRemoteAddr();
	}

	private ResponseEntity<ApiResponse<SevaType>> unauthorized() {
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new ApiResponse<>(false, "Unauthorized", null));
	}

	private ResponseEntity<ApiResponse<SevaType>> serverError(String message) {
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.body(new ApiResponse<>(false, "Server error: " + message, null));
	}

	@PostMapping("/delete")
	public ResponseEntity<ApiResponse<Void>> deleteSevaTypes(@RequestBody List<Integer> ids) {
		try {
			boolean result = sevaTypeDAO.softDeleteByIds(ids); // or hard delete
			if (result) {
				return ResponseEntity.ok(ApiResponse.success("Deleted successfully", null));
			} else {
				return ResponseEntity.badRequest().body(ApiResponse.failure("Delete failed"));
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.body(ApiResponse.failure("Error deleting seva types"));
		}
	}




	/*********************************************
	 * Seva Category
	 ************************************/

	@GetMapping("/getAllSevaCategories")
	public ResponseEntity<List<SevaCategory>> getAllSevaCategories() {
		logger.info("Fetching all SevaCategories");

		try {
			List<SevaCategory> sevaCategories = sevaCategoryDAO.getAllSevaCategories();
			return ResponseEntity.ok(sevaCategories);

		} catch (Exception e) {
			logger.error("Error fetching all SevaCategories", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveSevaCategories")
	public ResponseEntity<List<SevaCategory>> getAllActiveSevaCategories() {
		logger.info("Fetching all active SevaCategory");

		try {
			List<SevaCategory> activeSevaCategory = sevaCategoryDAO.getAllActiveSevaCategories();

			if (activeSevaCategory.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeSevaCategory);
		} catch (Exception e) {
			logger.error("Error fetching active seva categories", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getSevaCategoryById/{id}")
	public ResponseEntity<SevaCategory> getSevaCategoryById(@PathVariable("id") int id) {
		logger.info("Fetching Seva category with ID: {}", id);

		try {
			SevaCategory sevaCategory = sevaCategoryDAO.getSevaCategoryById(id);

			if (sevaCategory == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(sevaCategory);
		} catch (Exception e) {
			logger.error("Error fetching seva category with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addSevaCategory")
	public ResponseEntity<SevaCategory> addSevaCategory(@RequestParam(value = "sevaCategoryStr") String sevaCategoryStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		SevaCategory sevaCategory = gson.fromJson(sevaCategoryStr, SevaCategory.class);

		logger.info("Adding new SevaCategory: {}", sevaCategory);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (sevaCategory == null || sevaCategory.getSevaCategoryName() == null
					|| sevaCategory.getSevaCategoryName().isEmpty()) {
				logger.error("Seva category name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				if (image != null && !image.isEmpty()) {
					String image1 = "";
					try {
						byte[] bytes = image.getBytes();

						File dir = new File(request.getSession().getServletContext().getRealPath("")
								+ "/resources/front/demo-images/imgseva");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/demo-images/imgseva/");
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

						sevaCategory.setImage(image.getOriginalFilename());

					} catch (Exception e) {
						logger.error("Error processing image", e);
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
					}
				} else {
					// No image uploaded, set image as null
					sevaCategory.setImage(null);
				}

				sevaCategory.setCreatedBy(adminLoginUserId);
				sevaCategory.setIpAddress(IpAddress);
				SevaCategory savedSevaCategory = sevaCategoryDAO.addSevaCategory(sevaCategory);

				if (savedSevaCategory.getSevaCategoryId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedSevaCategory);
				}
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);

			} catch (Exception e) {
				logger.error("Error adding new sevaCategory", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateSevaCategory")
	public ResponseEntity<SevaCategory> updateSevaCategory(int id,
			@RequestParam("sevaCategoryStr") String sevaCategoryStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		logger.info("Updating SevaCategory with ID: {}", id);

		Gson gson = new Gson();
		SevaCategory sevaCategory = gson.fromJson(sevaCategoryStr, SevaCategory.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (sevaCategory == null || sevaCategory.getSevaCategoryName() == null
					|| sevaCategory.getSevaCategoryName().isEmpty()) {
				logger.error("SevaCategory name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				SevaCategory existingSevaCategory = sevaCategoryDAO.getSevaCategoryById(id);
				if (existingSevaCategory == null) {
					return ResponseEntity.notFound().build();
				}

				try {
					if (image != null && image.getOriginalFilename() != "") {
						String image1 = "";
						try {
							byte[] bytes = image.getBytes();

							File dir = new File(request.getSession().getServletContext().getRealPath("")
									+ "/resources/front/demo-images/imgseva");

							if (!dir.exists())
								dir.mkdirs();

							String path = request.getSession().getServletContext()
									.getRealPath("/resources/front/demo-images/imgseva/");
							File uploadfile = new File(path + File.separator + image.getOriginalFilename());

							ByteArrayInputStream in = new ByteArrayInputStream(bytes);
							try {
								BufferedImage image2 = ImageIO.read(image.getInputStream());
								System.out.println("Image size: " + image2.getWidth() + "x" + image2.getHeight());
								System.out.println("Crop coordinates: x=" + valuex + ", y=" + valuey + ", width="
										+ valuew + ", height=" + valueh);

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
								drawer.setRenderingHint(RenderingHints.KEY_RENDERING,
										RenderingHints.VALUE_RENDER_QUALITY);
								drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
										RenderingHints.VALUE_ANTIALIAS_ON);
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

						} catch (Exception e) {
							logger.error("Error while fetching image", e);
							return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
						}
						sevaCategory.setImage(image.getOriginalFilename());
					}

				} catch (Exception e) {
					logger.error("Error updating sevaCategoryImage", e);
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}
				sevaCategory.setCreatedBy(adminLoginUserId);
				sevaCategory.setIpAddress(IpAddress);
				sevaCategoryDAO.updateSevaCategory(sevaCategory);

				return ResponseEntity.ok(sevaCategory);
			} catch (Exception e) {
				logger.error("Error updating sevaCategory with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteSevaCategory/{id}")
	public ResponseEntity<Void> deleteSevaCategory(@PathVariable("id") int id) {
		logger.info("Deleting SevaCategory with ID: {}", id);

		try {
			SevaCategory existingSevaCategory = sevaCategoryDAO.getSevaCategoryById(id);
			if (existingSevaCategory == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = sevaCategoryDAO.deleteSevaCategory(id);

			if (isDeleted) {
				logger.info("SevaCategory with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete SevaCategory with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting seva category with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/*********************************************
	 * Variation
	 ************************************/

	@GetMapping("/getAllVariations")
	public ResponseEntity<List<Variation>> getAllVariations() {
		logger.info("Fetching all Variation");

		try {
			List<Variation> variation = variationDAO.getAllVariations();
			return ResponseEntity.ok(variation);

		} catch (Exception e) {
			logger.error("Error fetching all variation", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveVariations")
	public ResponseEntity<List<Variation>> getAllActiveVariations() {
		logger.info("Fetching all active Variation");

		try {
			List<Variation> activeVariation = variationDAO.getAllActiveVariations();

			if (activeVariation.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeVariation);
		} catch (Exception e) {
			logger.error("Error fetching active variation", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getVariationById/{id}")
	public ResponseEntity<Variation> getVariationById(@PathVariable("id") int id) {
		logger.info("Fetching variation with ID: {}", id);

		try {
			Variation variation = variationDAO.getVariationById(id);

			if (variation == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(variation);
		} catch (Exception e) {
			logger.error("Error fetching variation with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addVariation")
	public ResponseEntity<Variation> addVariation(@RequestParam(value = "variationStr") String variationStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		Variation variation = gson.fromJson(variationStr, Variation.class);

		logger.info("Adding new Variation: {}", variation);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (variation == null || variation.getVariationName() == null || variation.getVariationName().isEmpty()) {
				logger.error("variation name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				if (image != null && !image.isEmpty()) {
					String image1 = "";
					try {
						byte[] bytes = image.getBytes();

						File dir = new File(request.getSession().getServletContext().getRealPath("")
								+ "/resources/front/demo-images/imgseva");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/demo-images/imgseva/");
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

						variation.setImage(image.getOriginalFilename());

					} catch (Exception e) {
						logger.error("Error processing image", e);
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
					}
				} else {
					// No image uploaded, set image as null
					variation.setImage(null);
				}

				// Set common properties
				variation.setCreatedBy(adminLoginUserId);
				variation.setIpAddress(IpAddress);
				Variation savedVariation = variationDAO.addVariation(variation);

				if (savedVariation.getVariationId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedVariation);
				}
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);

			} catch (Exception e) {
				logger.error("Error adding new variation", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateVariation")
	public ResponseEntity<Variation> updateVariation(int id, @RequestParam("variationStr") String variationStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		logger.info("Updating variation with ID: {}", id);

		Gson gson = new Gson();
		Variation variation = gson.fromJson(variationStr, Variation.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (variation == null || variation.getVariationName() == null || variation.getVariationName().isEmpty()) {
				logger.error("Variation name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				Variation existingVariation = variationDAO.getVariationById(id);
				if (existingVariation == null) {
					return ResponseEntity.notFound().build();
				}

				try {
					if (image != null && image.getOriginalFilename() != "") {
						String image1 = "";
						try {
							byte[] bytes = image.getBytes();

							File dir = new File(request.getSession().getServletContext().getRealPath("")
									+ "/resources/front/demo-images/imgseva");

							if (!dir.exists())
								dir.mkdirs();

							String path = request.getSession().getServletContext()
									.getRealPath("/resources/front/demo-images/imgseva/");
							File uploadfile = new File(path + File.separator + image.getOriginalFilename());

							ByteArrayInputStream in = new ByteArrayInputStream(bytes);
							try {
								BufferedImage image2 = ImageIO.read(image.getInputStream());
								System.out.println("Image size: " + image2.getWidth() + "x" + image2.getHeight());
								System.out.println("Crop coordinates: x=" + valuex + ", y=" + valuey + ", width="
										+ valuew + ", height=" + valueh);

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
								drawer.setRenderingHint(RenderingHints.KEY_RENDERING,
										RenderingHints.VALUE_RENDER_QUALITY);
								drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
										RenderingHints.VALUE_ANTIALIAS_ON);
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

						} catch (Exception e) {
							logger.error("Error while fetching image", e);
							return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
						}
						variation.setImage(image.getOriginalFilename());
					}

				} catch (Exception e) {
					logger.error("Error updating variationImage", e);
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}
				variation.setCreatedBy(adminLoginUserId);
				variation.setIpAddress(IpAddress);
				variationDAO.updateVariation(variation);

				return ResponseEntity.ok(variation);
			} catch (Exception e) {
				logger.error("Error updating variation with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteVariation/{id}")
	public ResponseEntity<Void> deleteVariation(@PathVariable("id") int id) {
		logger.info("Deleting Variation with ID: {}", id);

		try {
			Variation existingVariation = variationDAO.getVariationById(id);
			if (existingVariation == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = variationDAO.deleteVariation(id);

			if (isDeleted) {
				logger.info("Variation with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete Variation with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting variation with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/*********************************************
	 * Frequency
	 ************************************/

	@GetMapping("/getAllFrequency")
	public ResponseEntity<List<Frequency>> getAllFrequency() {
		logger.info("Fetching all Frequency");

		try {
			List<Frequency> frequency = frequencyDAO.getAllFrequency();
			return ResponseEntity.ok(frequency);

		} catch (Exception e) {
			logger.error("Error fetching all frequency", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveFrequencies")
	public ResponseEntity<List<Frequency>> getAllActiveFrequencies() {
		logger.info("Fetching all active frequency");

		try {
			List<Frequency> activeFrequency = frequencyDAO.getAllActiveFrequencies();

			if (activeFrequency.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(activeFrequency);
		} catch (Exception e) {
			logger.error("Error fetching active frequency", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getFrequencyById/{id}")
	public ResponseEntity<Frequency> getFrequencyById(@PathVariable("id") int id) {
		logger.info("Fetching frequency with ID: {}", id);

		try {
			Frequency frequency = frequencyDAO.getFrequencyById(id);

			if (frequency == null) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok(frequency);
		} catch (Exception e) {
			logger.error("Error fetching frequency with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addFrequency")
	public ResponseEntity<Frequency> addFrequency(@RequestParam(value = "frequencyStr") String frequencyStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		Gson gson = new Gson();
		Frequency frequency = gson.fromJson(frequencyStr, Frequency.class);

		logger.info("Adding new frequency: {}", frequency);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (frequency == null || frequency.getFrequencyName() == null || frequency.getFrequencyName().isEmpty()) {
				logger.error("frequency name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				if (image != null && !image.isEmpty()) {
					String image1 = "";
					try {
						byte[] bytes = image.getBytes();

						File dir = new File(request.getSession().getServletContext().getRealPath("")
								+ "/resources/front/demo-images/imgseva");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/demo-images/imgseva/");
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

						frequency.setImage(image.getOriginalFilename());

					} catch (Exception e) {
						logger.error("Error processing image", e);
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
					}
				} else {
					// No image uploaded, set image as null
					frequency.setImage(null);
				}

				// Set common properties
				frequency.setCreatedBy(adminLoginUserId);
				frequency.setIpAddress(IpAddress);
				Frequency savedFrequency = frequencyDAO.addFrequency(frequency);

				if (savedFrequency.getFrequencyId() > 0) {
					return ResponseEntity.status(HttpStatus.CREATED).body(savedFrequency);
				}
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);

			} catch (Exception e) {
				logger.error("Error adding new frequency", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateFrequency")
	public ResponseEntity<Frequency> updateFrequency(int id, @RequestParam("frequencyStr") String frequencyStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int valuex, int valuey, int valuew,
			int valueh, HttpSession session, HttpServletRequest request) {

		logger.info("Updating frequency with ID: {}", id);

		Gson gson = new Gson();
		Frequency frequency = gson.fromJson(frequencyStr, Frequency.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (frequency == null || frequency.getFrequencyName() == null || frequency.getFrequencyName().isEmpty()) {
				logger.error("Frequency name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				Frequency existingFrequency = frequencyDAO.getFrequencyById(id);
				if (existingFrequency == null) {
					return ResponseEntity.notFound().build();
				}

				try {
					if (image != null && image.getOriginalFilename() != "") {
						String image1 = "";
						try {
							byte[] bytes = image.getBytes();

							File dir = new File(request.getSession().getServletContext().getRealPath("")
									+ "/resources/front/demo-images/imgseva");

							if (!dir.exists())
								dir.mkdirs();

							String path = request.getSession().getServletContext()
									.getRealPath("/resources/front/demo-images/imgseva/");
							File uploadfile = new File(path + File.separator + image.getOriginalFilename());

							ByteArrayInputStream in = new ByteArrayInputStream(bytes);
							try {
								BufferedImage image2 = ImageIO.read(image.getInputStream());
								System.out.println("Image size: " + image2.getWidth() + "x" + image2.getHeight());
								System.out.println("Crop coordinates: x=" + valuex + ", y=" + valuey + ", width="
										+ valuew + ", height=" + valueh);

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
								drawer.setRenderingHint(RenderingHints.KEY_RENDERING,
										RenderingHints.VALUE_RENDER_QUALITY);
								drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
										RenderingHints.VALUE_ANTIALIAS_ON);
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

						} catch (Exception e) {
							logger.error("Error while fetching image", e);
							return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
						}
						frequency.setImage(image.getOriginalFilename());
					}

				} catch (Exception e) {
					logger.error("Error updating frequencyImage", e);
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

				frequency.setCreatedBy(adminLoginUserId);
				frequency.setIpAddress(IpAddress);
				frequencyDAO.updateFrequency(frequency);

				return ResponseEntity.ok(frequency);
			} catch (Exception e) {
				logger.error("Error updating frequency with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	/*
	 * @PutMapping("/updateFrequency/{id}") public ResponseEntity<Frequency>
	 * updateFrequency(@PathVariable("id") int id, @RequestBody Frequency frequency)
	 * { logger.info("Updating frequency with ID: {}", id);
	 * 
	 * try { Frequency existingFrequency = frequencyDAO.getFrequencyById(id); if
	 * (existingFrequency == null) { return ResponseEntity.notFound().build(); }
	 * 
	 * frequency.setFrequencyId(id); frequencyDAO.updateFrequency(frequency);
	 * Frequency updateFrequency = frequencyDAO.getFrequencyById(id);
	 * 
	 * return ResponseEntity.ok(updateFrequency); } catch (Exception e) {
	 * logger.error("Error updating frequency with ID: {}", id, e); return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); } }
	 */

	@DeleteMapping("/deleteFrequency/{id}")
	public ResponseEntity<Void> deleteFrequency(@PathVariable("id") int id) {
		logger.info("Deleting frequency with ID: {}", id);

		try {
			Frequency existingFrequency = frequencyDAO.getFrequencyById(id);
			if (existingFrequency == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = frequencyDAO.deleteFrequency(id);

			if (isDeleted) {
				logger.info("Frequency with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete frequency with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting frequency with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/*********************************************
	 * Manage Seva
	 ************************************/

	@GetMapping("/getAllSeva")
	public ResponseEntity<List<Seva>> getAllSeva() {
		logger.info("Fetching all Seva");

		try {
			List<Seva> seva = sevaDAO.getAllSeva();
			if (seva.size() > 0) {
				for (Seva item : seva) {
					item.setSevaImages(sevaImagesDAO.getAllSevaImagesBySevaId(item.getSevaId()));
				}
			}
			return ResponseEntity.ok(seva);

		} catch (Exception e) {
			logger.error("Error fetching all seva", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getAllActiveSeva")
	public ResponseEntity<List<Seva>> getAllActiveSeva() {
		logger.info("Fetching all active seva");

		try {
			List<Seva> activeSeva = sevaDAO.getAllActiveSeva();

			if (activeSeva.isEmpty()) {
				return ResponseEntity.noContent().build();
			}
			if (activeSeva.size() > 0) {
				for (Seva item : activeSeva) {
					item.setSevaImages(sevaImagesDAO.getAllSevaImagesBySevaId(item.getSevaId()));
				}
			}

			return ResponseEntity.ok(activeSeva);
		} catch (Exception e) {
			logger.error("Error fetching active seva", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/getSevaById/{id}")
	public ResponseEntity<Seva> getSevaById(@PathVariable("id") int id) {
		logger.info("Fetching seva with ID: {}", id);

		try {
			Seva seva = sevaDAO.getSevaById(id);

			if (seva == null) {
				return ResponseEntity.notFound().build();
			}

			seva.setSevaImages(sevaImagesDAO.getAllSevaImagesBySevaId(seva.getSevaId()));
			return ResponseEntity.ok(seva);
		} catch (Exception e) {
			logger.error("Error fetching seva with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@PostMapping("/addSeva")
	public ResponseEntity<Seva> addSeva(@RequestParam(value = "sevaStr") String sevaStr,
			@RequestParam(value = "sevaImageStr") String sevaImageStr,
			@RequestParam(value = "file") MultipartFile image, int valuex, int valuey, int valuew, int valueh,
			HttpSession session, HttpServletRequest request) {
		Gson gson = new Gson();
		Seva seva = gson.fromJson(sevaStr, Seva.class);
		SevaImages sevaImageObj = gson.fromJson(sevaImageStr, SevaImages.class);

		logger.info("Adding new seva: {}", seva);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (seva == null || seva.getSevaTitle() == null || seva.getSevaTitle().isEmpty()) {
				logger.error("seva name cannot be null or empty");
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
								+ "/resources/front/demo-images/imgseva");

						if (!dir.exists())
							dir.mkdirs();

						String path = request.getSession().getServletContext()
								.getRealPath("/resources/front/demo-images/imgseva/");
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

						seva.setCreatedBy(adminLoginUserId);
						seva.setIpAddress(IpAddress);
						Seva savedSeva = sevaDAO.addSeva(seva);
						if (savedSeva.getSevaId() > 0) {
							sevaImageObj.setCreatedBy(adminLoginUserId);
							sevaImageObj.setIpAddress(IpAddress);
							sevaImageObj.setSevaId(savedSeva.getSevaId());
							sevaImageObj.setSevaImages(image.getOriginalFilename());
							sevaImagesDAO.addSevaImage(sevaImageObj);
						}
						return ResponseEntity.status(HttpStatus.CREATED).body(savedSeva);
					} catch (Exception e) {
						logger.error("Error adding new seva", e);
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
					}
				}
				logger.error("Image not found");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			} catch (Exception e) {
				logger.error("Error adding new seva", e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@PostMapping("/updateSeva")
	public ResponseEntity<Seva> updateSeva(@RequestParam(value = "sevaStr") String sevaStr,
			@RequestParam(value = "sevaImageStr") String sevaImageStr,
			@RequestParam(value = "file", required = false) MultipartFile image, int id, int valuex, int valuey,
			int valuew, int valueh, HttpSession session, HttpServletRequest request) {

		logger.info("Updating seva with ID: {}", id);

		Gson gson = new Gson();
		Seva seva = gson.fromJson(sevaStr, Seva.class);
		SevaImages sevaImageObj = gson.fromJson(sevaImageStr, SevaImages.class);

		int adminLoginUserId = (int) session.getAttribute("adminLoginUserId");
		if (adminLoginUserId > 0) {
			if (seva == null || seva.getSevaTitle() == null || seva.getSevaTitle().isEmpty()) {
				logger.error("seva name cannot be null or empty");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
			String IpAddress = request.getHeader("X-FORWARDED-FOR");
			if (IpAddress == null) {
				IpAddress = request.getRemoteAddr();
			}
			try {
				Seva existingSeva = sevaDAO.getSevaById(id);
				if (existingSeva == null) {
					return ResponseEntity.notFound().build();
				}
				seva.setCreatedBy(adminLoginUserId);
				seva.setIpAddress(IpAddress);
				sevaDAO.updateSeva(seva);
				try {
					if (image != null && image.getOriginalFilename() != "") {
						String image1 = "";
						try {
							byte[] bytes = image.getBytes();

							File dir = new File(request.getSession().getServletContext().getRealPath("")
									+ "/resources/front/demo-images/imgseva");

							if (!dir.exists())
								dir.mkdirs();

							String path = request.getSession().getServletContext()
									.getRealPath("/resources/front/demo-images/imgseva/");
							File uploadfile = new File(path + File.separator + image.getOriginalFilename());

							ByteArrayInputStream in = new ByteArrayInputStream(bytes);
							try {
								BufferedImage image2 = ImageIO.read(image.getInputStream());
								System.out.println("Image size: " + image2.getWidth() + "x" + image2.getHeight());
								System.out.println("Crop coordinates: x=" + valuex + ", y=" + valuey + ", width="
										+ valuew + ", height=" + valueh);

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
								drawer.setRenderingHint(RenderingHints.KEY_RENDERING,
										RenderingHints.VALUE_RENDER_QUALITY);
								drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
										RenderingHints.VALUE_ANTIALIAS_ON);
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
							sevaImageObj.setSevaImages(image.getOriginalFilename());
						} catch (Exception e) {
							logger.error("Error while fetching image", e);
							return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
						}
					}
					sevaImageObj.setCreatedBy(adminLoginUserId);
					sevaImageObj.setIpAddress(IpAddress);

					sevaImagesDAO.editSevaImage(sevaImageObj);
				} catch (Exception e) {
					logger.error("Error updating sevaImage", e);
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}

				/* seva.setSevaId(id); */

				/* Seva updateSeva = sevaDAO.getSevaById(id); */

				return ResponseEntity.ok(seva);
			} catch (Exception e) {
				logger.error("Error updating seva with ID: {}", id, e);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}

	@DeleteMapping("/deleteSeva/{id}")
	public ResponseEntity<Void> deleteSeva(@PathVariable("id") int id) {
		logger.info("Deleting seva with ID: {}", id);

		try {
			Seva existingSeva = sevaDAO.getSevaById(id);
			if (existingSeva == null) {
				return ResponseEntity.notFound().build();
			}

			boolean isDeleted = sevaDAO.deleteSeva(id);

			if (isDeleted) {
				logger.info("Seva with ID: {} deleted successfully", id);
				return ResponseEntity.noContent().build();
			} else {
				logger.warn("Failed to delete seva with ID: {}", id);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
		} catch (Exception e) {
			logger.error("Error deleting seva with ID: {}", id, e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
}
