package com.ui.dao;

import java.util.List;

import com.ui.model.Frequency;

public interface FrequencyDAO {

	Frequency getFrequencyById(int frequencyId);

	List<Frequency> getAllFrequency();

	Frequency addFrequency(Frequency frequency);

	boolean deleteFrequency(int frequencyId);

	List<Frequency> getAllActiveFrequencies();

	void updateFrequency(Frequency frequency);
}
