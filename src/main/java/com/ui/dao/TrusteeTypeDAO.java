package com.ui.dao;

import java.util.List;

import com.ui.model.TrusteeType;

public interface TrusteeTypeDAO {

	List<TrusteeType> getAllTrusteeTypes();

	void addTrusteeType(TrusteeType trusteeType);

	void editTrusteeType(TrusteeType trusteeType);

	void deleteTrusteeType(int trusteeTypeId);

}
