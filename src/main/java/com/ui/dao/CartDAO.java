package com.ui.dao;

import com.ui.model.Cart;

public interface CartDAO {

	Cart addCart(Cart cart);

	void removeFromCart(int sevaId);

	void clearCart(int userId);

}
