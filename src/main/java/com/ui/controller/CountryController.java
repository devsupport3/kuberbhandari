package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.CountryDAO;
import com.ui.model.Country;

@RestController
public class CountryController {

	@Autowired
	CountryDAO countryDao;

	Country country;

	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);

	@RequestMapping(value = "addCountry", method = RequestMethod.POST)
	public String addCountry(@RequestBody Country country, HttpServletRequest request, HttpSession session) {
		logger.info("*************************** ADD COUNTRY CONTROLLER *******************************");

		String result = "";
		int userid = Integer.parseInt(session.getAttribute("adminuserid").toString());
		logger.info("=============================================================" + userid);
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		String s = "y";

		country.setCreatedBy(userid);
		country.setIpAddress(ip);
		country.setStatus(s);

		if (country.getCountryId() == 0) {
			result = countryDao.addCountry(country);
		} else {
			logger.info("*************************** UPDATE COUNTRY CONTROLLER *******************************");
			result = countryDao.editCountry(country);
		}

		return result;

	}

	@GetMapping(value = "/getAllCountry")
	public List<Country> getAllCountry(HttpServletRequest request, HttpServletResponse response) {
		logger.info("*************************** GET ALL COUNTRY CONTROLLER***************************");
		return countryDao.getAllCountry();
	}

	@DeleteMapping(value = "/deleteCountry")
	public String deleteCountry(int countryid, HttpServletRequest request, HttpServletResponse response) {
		logger.info("*************************** DELETE COUNTRY CONTROLLER***************************");
		return countryDao.deleteCountry(countryid);
	}

	@GetMapping(value = "/getCountryById")
	public Country getCountryById(int countryId, HttpServletRequest request, HttpServletResponse response) {
		logger.info("*************************** GET ALL COUNTRY BY COUNTRY ID CONTROLLER***************************");
		return countryDao.getCountryById(countryId);
	}

}