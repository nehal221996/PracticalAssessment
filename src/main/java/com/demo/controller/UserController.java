package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.User;
import com.demo.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/userRegistration", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
		return mv;
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveUserDetails(HttpServletRequest request, HttpServletResponse response, @RequestBody User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userService.saveUserDetails(user);
			map.put("UserList", user);
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			e.printStackTrace();
		}	
		return map;
	}
	
	@RequestMapping(value = "/viewUser", method = RequestMethod.GET)
	public ModelAndView showWelcomePage(ModelMap model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewUser");
		return mv;
	}
	
	@RequestMapping(value = "/viewList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getUserDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userService.getUserList();
		map.put("data", list);
		return map;
	}
	
	@RequestMapping(value ="/deleteUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> deleteUser(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		userService.deleteUser(id);
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value ="/viewUserById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> viewUserById(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userService.viewUserById(id);
		map.put("data", list);
		map.put("status", true);
		return map;
	}
	
}
