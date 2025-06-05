package com.ui.dao;

import java.util.List;

import com.ui.model.UserTitle;

public interface UserTitleDAO {

	List<UserTitle> getAllUserTitles();

	void addUserTitle(UserTitle userTitle);

	void editUserTitle(UserTitle userTitle);

	void deleteUserTitle(int userTitleId);

}
