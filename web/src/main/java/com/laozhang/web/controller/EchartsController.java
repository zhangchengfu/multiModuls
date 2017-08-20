package com.laozhang.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laozhang.core.service.IEchartsService;
import com.laozhang.page.InvokeResult;

@Controller
@RequestMapping(value = "/echarts")
public class EchartsController {

	@Autowired
	private IEchartsService service;
	
	@ResponseBody
	@RequestMapping("/getAll1")
	public InvokeResult getAll1() {
		try {
			vo v = new vo();
			v.setName("销量");
			v.setData(service.getAll1());
			return InvokeResult.success(v);
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	@ResponseBody
	@RequestMapping("/getAll2")
	public InvokeResult getAll2() {
		try {
			vo v = new vo();
			v.setName("最高气温");
			v.setData(service.getAll2());
			return InvokeResult.success(v);
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	@ResponseBody
	@RequestMapping("/getAll3")
	public InvokeResult getAll3() {
		try {
			vo v = new vo();
			v.setName("最高气温");
			v.setData(service.getAll3());
			return InvokeResult.success(v);
		} catch (Exception e) {
			return InvokeResult.failure("查询失败");
		}
	}
	
	class vo {
		private String name;
		private List data;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public List getData() {
			return data;
		}
		public void setData(List data) {
			this.data = data;
		}
		
	}
}
