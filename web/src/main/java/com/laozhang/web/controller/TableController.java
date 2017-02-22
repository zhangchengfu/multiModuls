package com.laozhang.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laozhang.core.service.IUserService;
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;
import com.laozhang.page.AdaptPage;
import com.laozhang.page.InvokeResult;
import com.laozhang.page.SimplePageRequestVO;

@Controller
@RequestMapping(value = "/table")
public class TableController {
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/index")
	public String index() {
		return "table";
	}
	
	@ResponseBody
	@RequestMapping(value="/edit")
	public InvokeResult edit(User user,HttpServletRequest request) {
		try {
			if (user.getId() == null) {
				userService.addUser(user);
			} else {
				userService.updateUser(user);
			}
			return InvokeResult.success();
		} catch (Exception e) {
			return InvokeResult.failure("保存失败");
		}
	}
	
	@ResponseBody
	@RequestMapping("/get")
	public InvokeResult get(int id) {
		try {
			User user = userService.getUserById(id);
			return InvokeResult.success(user);
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	/**
	 * 分页
	 * @param simplePageRequestVO
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/page")
	public InvokeResult page(SimplePageRequestVO simplePageRequestVO,User user,
			HttpServletRequest request) {
		try {
			int page = simplePageRequestVO.getPage();
			int pagesize = simplePageRequestVO.getPagesize();
			Map<Object, Object> params = new HashMap<Object, Object>();
			if (null != user && null != user.getUserName() && !StringUtils.isEmpty(user.getUserName())) {
				params.put("name", user.getUserName());
			} else {
				params.put("name", null);
			}
			Pagination pagination = new Pagination();
			pagination.setPage(page + 1);
			pagination.setSize(pagesize);
			pagination.setParams(params);
			PageResult<User> result = userService.getUserPage(pagination);
			return InvokeResult.success(AdaptPage.adapt(result));
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete")
	public InvokeResult delete(User user,HttpServletRequest request) {
		try {
			userService.deleteUser(user.getId());
			return InvokeResult.success();
		} catch (Exception e) {
			return InvokeResult.failure("删除失败");
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/del")
	public InvokeResult del(String ids, HttpServletRequest request) {
		try {
			if (null != ids) {
				String[] _ids = ids.split(",");
				for (String id : _ids) {
					userService.deleteUser(Integer.valueOf(id));
				}
			}
			return InvokeResult.success();
		} catch (Exception e) {
			return InvokeResult.failure("删除失败");
		}
	}

}
