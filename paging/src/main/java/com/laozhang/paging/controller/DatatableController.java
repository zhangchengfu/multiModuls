package com.laozhang.paging.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.laozhang.core.service.IUserService;
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.PageUtil;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;
import com.laozhang.model.rsp.JsonRsp;
import com.laozhang.paging.modal.Result;
import com.laozhang.paging.page.AdaptPage;

@Controller
@RequestMapping("/dataTable")
public class DatatableController {
private static final Log log = LogFactory.getLog(DatatableController.class);
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
	public Result getPageList(HttpServletRequest request) {
		try {
			String length = request.getParameter("length");//每页数目
			String start = request.getParameter("start");//起始记录数
			String formData = request.getParameter("formData");//请求参数,形如：{"type":"类型","name":"名称"}
			Map<Object, Object> params = JSON.parseObject(formData, Map.class);
			Pagination pagination = new Pagination();
			int pageNo = getPage(length, start);
			pagination.setPage(Integer.valueOf(start) + 1);
			pagination.setSize(Integer.valueOf(length));
			pagination.setParams(params);
			PageResult<User> result = service.getUserPage(pagination);
			int totalNum = result.getTotalSize();
			int pageSize = result.getPageSize();
			String requestUrl = request.getRequestURI();
			String pageComponet = PageUtil.getPagation(requestUrl, totalNum, Integer.valueOf(start), pageSize);
			result.setPageComponet(pageComponet);
			return Result.success(AdaptPage.adapt(result));
		} catch (Exception e) {
			log.error("message", e);
			return Result.failure("系统异常，请稍候重试");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/show")
	public JsonRsp<User> getOne(@RequestParam String formData) {
		Map<Object, Object> params = JSON.parseObject(formData, Map.class);
		int id = Integer.valueOf((String)(params.get("id")));
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
	
	@ResponseBody
	@RequestMapping(value="/del")
	public JsonRsp delOne(@RequestParam String formData) {
		Map<Object, Object> params = JSON.parseObject(formData, Map.class);
		int id = Integer.valueOf((String)(params.get("id")));
		JsonRsp ret = new JsonRsp();
		try {
			service.deleteUser(id);
		} catch (Exception e) {
			ret.setRst(0);
			log.error("message", e);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	@ResponseBody
	@RequestMapping(value="/save")
	public JsonRsp saveOne(@RequestParam(name="formData") String formData) {
		JsonRsp ret = new JsonRsp();
		User user = (User) JSON.parseObject(formData, User.class);
		try {
			if (user.getId() == 0) {
				user.setId(null);
				service.addUser(user);
				
			} else {
				service.updateUser(user);
			}
		} catch (Exception e) {
			ret.setRst(0);
			log.error("message", e);
			ret.setMsg("系统异常，请稍候重试");
		}
		return ret;
	}
	
	private int getPage(String length, String start) {
		if (start.equals("0")) {
			return 1;//首页
		} else {
			int _length = Integer.valueOf(length);
			int _start = Integer.valueOf(start);
			int page = (_start + 1) / _length + 1;
			if ((_start + 1) % _length > 0) {
				page++;
			}
			return page;
		}
	}
}
