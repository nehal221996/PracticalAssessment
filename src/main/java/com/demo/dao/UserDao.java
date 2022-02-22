package com.demo.dao;

import java.util.List;

import com.demo.model.User;

public interface UserDao {

	void saveUserDetails(User user);

	List<User> getUserList();

	void deleteUser(int id);

	List<User> viewUserById(int id);

}
