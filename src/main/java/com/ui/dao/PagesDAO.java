package com.ui.dao;

import java.util.List;

import com.ui.model.Pages;

public interface PagesDAO {

	List<Pages> getAllPages();

	void addPage(Pages page);

	void editPage(Pages page);

	void deletePage(int pageId);

}
