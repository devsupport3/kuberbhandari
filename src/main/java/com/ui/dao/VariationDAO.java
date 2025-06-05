package com.ui.dao;

import java.util.List;

import com.ui.model.Variation;

public interface VariationDAO {

	List<Variation> getAllVariations();

	List<Variation> getAllActiveVariations();

	Variation getVariationById(int variationId);

	Variation addVariation(Variation variation);

	boolean deleteVariation(int variationId);

	void updateVariation(Variation variation);

}
