package com.laozhang.web.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laozhang.core.service.IUserService;
import com.laozhang.model.entity.User;
import com.laozhang.model.rsp.JsonRsp;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Log log = LogFactory.getLog(UserController.class);
	
	@Autowired
	private IUserService service;
	
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/showUser", method = RequestMethod.GET)
	public ModelAndView getUser(@RequestParam int id) {
		ModelAndView modeAndView = new ModelAndView();
		User user = service.getUserById(id);
		modeAndView.addObject("user", user);
		modeAndView.setViewName("/showUser");
		//System.out.println("userName:" + user.getUserName());
		return modeAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/showAll", method = RequestMethod.GET)
	public JsonRsp<List<User>> getAllUser() {
		JsonRsp<List<User>> ret = new JsonRsp<List<User>>();
		try {
			List<User> users = service.getAll();
			ret.setInfo(users);
		} catch (Exception e) {
			log.error("message", e);
			ret.setMsg("系统异常，请稍候重试");
			ret.setRst(0);
		}
		return ret;
	}
	
	/**
	 * 保存
	 * @param user
	 */
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public void add(@RequestBody User user) {
		service.addUser(user);
	}
	
	/**
	 * 更新
	 * @param user
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public void updateUser(@RequestBody User user) {
		service.updateUser(user);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteUser(@PathVariable int id) {
		service.deleteUser(id);
	}
}
