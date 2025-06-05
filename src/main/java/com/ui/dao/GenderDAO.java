package com.ui.dao;

import java.util.List;

import com.ui.model.Gender;

public interface GenderDAO {

	List<Gender> getAllGenders();

	void addGender(Gender gender);

	void updateGender(Gender gender);

	void deleteGender(int genderId);

}
