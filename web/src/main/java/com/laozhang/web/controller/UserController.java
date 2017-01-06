package com.laozhang.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.PageUtil;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;
import com.laozhang.model.rsp.JsonRsp;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Log log = LogFactory.getLog(UserController.class);
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="index")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
    @ResponseBody
	public JsonRsp<PageResult<User>> getPageList(@RequestParam String pageNo, HttpServletRequest request) {
		JsonRsp<PageResult<User>> ret = new JsonRsp<PageResult<User>>();
		try {
			Pagination pagination = new Pagination();
			pagination.setPage(Integer.valueOf(pageNo));
			PageResult<User> result = service.getUserPage(pagination);
			int totalNum = result.getTotalSize();
			int pageSize = result.getPageSize();
			String requestUrl = request.getRequestURI();
			String pageComponet = PageUtil.getPagation(requestUrl, totalNum, Integer.valueOf(pageNo), pageSize);
			result.setPageComponet(pageComponet);
			ret.setInfo(result);
		} catch (Exception e) {
			log.error("message", e);
			ret.setMsg("系统异常，请稍候重试");
			ret.setRst(0);
		}
		return ret;
	}
	
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
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public JsonRsp<User> getOne(@PathVariable int id) {
		JsonRsp<User> ret = new JsonRsp<User>();
		try {
			User user = service.getUserById(id);
			ret.setInfo(user);
		} catch (Exception e) {
			ret.setRst(0);
			log.error("message", e);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	@RequestMapping(value = "/userPage", method = RequestMethod.GET)
	public ModelAndView userPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("userPage");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/toUpdateUser", method = RequestMethod.GET)
	public ModelAndView toUpdateUser(@RequestParam int id) {
		ModelAndView view = new ModelAndView();
		view.setViewName("updateUser");
		User user = service.getUserById(id);
		view.addObject("user", user);
		return view;
	}
	
	@RequestMapping(value = "/toUserPage", method = RequestMethod.GET)
	public ModelAndView toUserPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("userPage2");
		return modelAndView;
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
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	@ResponseBody
	public String test() {
		return "123";
	}
	
	@RequestMapping(value = "/add2", method = RequestMethod.POST)
	@ResponseBody
	public JsonRsp<?> add(@RequestBody User user){
		JsonRsp<?> ret = new JsonRsp<Object>();
		try {
			service.addUser(user);
		} catch (Exception e) {
			ret.setRst(0);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	/**
	 * 保存
	 * @param user
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public JsonRsp<?> add(@RequestParam(value = "userName") String userName,
			@RequestParam(value = "password") String password, @RequestParam(value = "age") String age) {
		JsonRsp<?> ret = new JsonRsp<Object>();
		try {
			User user = new User();
			user.setAge(Integer.valueOf(age));
			user.setPassword(password);
			user.setUserName(userName);
			service.addUser(user);
		} catch (Exception e) {
			ret.setRst(0);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	/**
	 * 更新
	 * @param user
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public JsonRsp updateUser(@RequestBody User user) {
		JsonRsp ret = new JsonRsp();
		try {
			service.updateUser(user);
		} catch (Exception e) {
			ret.setRst(0);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public JsonRsp deleteUser(@PathVariable int id) {
		JsonRsp ret = new JsonRsp();
		try {
			service.deleteUser(id);
		} catch (Exception e) {
			ret.setRst(0);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
}
