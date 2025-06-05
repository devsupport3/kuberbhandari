package com.ui.dao;

import java.util.List;

import com.ui.model.Country;

public interface CountryDAO {

	public List<Country> getAllCountry();

	public String addCountry(Country country);

	public String editCountry(Country country);

	public String deleteCountry(int countryId);

	public Country getCountryById(int countryId);

}
