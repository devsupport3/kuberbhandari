package com.ui.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class ImageCrop {

	public static String saveAndCropImage(
			MultipartFile image, Double xVal, Double yVal, Double wVal, Double hVal,
			Double previewWidth, Double previewHeight, String uploadDirPath) throws IOException {

		File uploadDir = new File(uploadDirPath);
		if (!uploadDir.exists())
			uploadDir.mkdirs();

		BufferedImage originalImage = ImageIO.read(image.getInputStream());
		if (originalImage == null) {
			throw new IOException("Invalid image file");
		}

		int originalWidth = originalImage.getWidth();
		int originalHeight = originalImage.getHeight();

		double scaleX = 1.0;
		double scaleY = 1.0;

		if (previewWidth != null && previewHeight != null && previewWidth > 0 && previewHeight > 0) {
			scaleX = originalWidth / previewWidth;
			scaleY = originalHeight / previewHeight;
		}

		int x = xVal != null ? (int) Math.round(xVal * scaleX) : 0;
		int y = yVal != null ? (int) Math.round(yVal * scaleY) : 0;
		int w = wVal != null ? (int) Math.round(wVal * scaleX) : originalWidth;
		int h = hVal != null ? (int) Math.round(hVal * scaleY) : originalHeight;

// Bounds checking
		x = Math.max(0, x);
		y = Math.max(0, y);
		if (x + w > originalWidth)
			w = originalWidth - x;
		if (y + h > originalHeight)
			h = originalHeight - y;

		if (w <= 0 || h <= 0) {
			throw new IllegalArgumentException("Invalid crop dimensions after scaling");
		}

		BufferedImage croppedImage = originalImage.getSubimage(x, y, w, h);

		BufferedImage finalImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = finalImage.createGraphics();
		g2d.drawImage(croppedImage, 0, 0, null);
		g2d.dispose();

		String filename = UUID.randomUUID() + "_" + image.getOriginalFilename();
		File outputFile = new File(uploadDir, filename);
		ImageIO.write(finalImage, "jpg", outputFile);

		return filename;
	}
}
