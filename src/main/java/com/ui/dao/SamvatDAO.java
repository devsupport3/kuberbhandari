package com.ui.dao;

import java.util.List;

import com.ui.model.Samvat;

public interface SamvatDAO {

	Samvat addSamvat(Samvat samvat);

	void updateSamvat(Samvat samvat);

	boolean deleteSamvat(int samvatId);

	Samvat getSamvatById(int samvatId);

	List<Samvat> getAllSamvat();

	List<Samvat> getAllActiveSamvat();

}
