package com.laozhang.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laozhang.core.model.JpaTest;
import com.laozhang.core.service.JpaTestService;
import com.laozhang.model.base.PageResult;
import com.laozhang.page.AdaptPage;
import com.laozhang.page.InvokeResult;
import com.laozhang.page.SimplePageRequestVO;

@Controller
@RequestMapping(value = "/jpa")
public class JpaTestController {

	@Autowired
	private JpaTestService jpaTestService;
	
	@RequestMapping("/index")
	public String index() {
		return "jpa";
	}
	
	@ResponseBody
	@RequestMapping(value = "/page")
	public InvokeResult page(SimplePageRequestVO simplePageRequestVO, JpaTest jpaTest) {
		try {
			int page = simplePageRequestVO.getPage();
			int pagesize = simplePageRequestVO.getPagesize();
			PageResult<JpaTest> result = jpaTestService.getSqlPage(jpaTest, page + 1, pagesize);
			//PageResult<JpaTest> result = jpaTestService.getJpaPage(jpaTest, page + 1, pagesize);
			return InvokeResult.success(AdaptPage.adapt(result));
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	@ResponseBody
	@RequestMapping("/get")
	public InvokeResult get(String id) {
		try {
			JpaTest jpaTest = jpaTestService.get(id);
			return InvokeResult.success(jpaTest);
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/edit")
	public InvokeResult edit(JpaTest jpaTest) {
		try {
			jpaTestService.save(jpaTest);
			return InvokeResult.success();
		} catch (Exception e) {
			return InvokeResult.failure("保存失败");
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete")
	public InvokeResult delete(JpaTest jpaTest) {
		try {
			jpaTestService.delete(jpaTest.getId());
			return InvokeResult.success();
		} catch (Exception e) {
			return InvokeResult.failure("删除失败");
		}
	}
}
