package com.demo.service;

import java.util.List;

import com.demo.model.User;

public interface UserService {

	void saveUserDetails(User user);

	List<User> getUserList();

	void deleteUser(int id);

	List<User> viewUserById(int id);

}
