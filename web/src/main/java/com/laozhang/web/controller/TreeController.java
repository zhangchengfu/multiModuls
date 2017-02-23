package com.laozhang.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laozhang.page.InvokeResult;

@Controller
@RequestMapping("/tree")
public class TreeController {
	
	@ResponseBody
	@RequestMapping("/get")
	public InvokeResult get() {
		return InvokeResult.success(getList());
	}
	
	private List<TreeDto> getList() {
		List<TreeDto> dtos = new ArrayList<TreeDto>();
		TreeDto dto1 = new TreeDto();
		dto1.setId("1");
		dto1.setCode("1");
		dto1.setLeaf(false);
		dto1.setName("爷爷");
		dto1.setParentId(null);
		TreeDto dto2 = new TreeDto();
		dto2.setId("21");
		dto2.setCode("21");
		dto2.setLeaf(false);
		dto2.setName("儿子1");
		dto2.setParentId(dto1.getId());
		TreeDto dto3 = new TreeDto();
		dto3.setId("22");
		dto3.setCode("22");
		dto3.setLeaf(true);
		dto3.setName("儿子2");
		dto3.setParentId(dto1.getId());
		TreeDto dto4 = new TreeDto();
		dto4.setId("31");
		dto4.setCode("31");
		dto4.setLeaf(false);
		dto4.setName("孙子1");
		dto4.setParentId(dto2.getId());
		TreeDto dto5 = new TreeDto();
		dto5.setId("32");
		dto5.setCode("32");
		dto5.setLeaf(true);
		dto5.setName("孙子2");
		dto5.setParentId(dto2.getId());
		TreeDto dto6 = new TreeDto();
		dto6.setId("41");
		dto6.setCode("41");
		dto6.setLeaf(true);
		dto6.setName("曾孙1");
		dto6.setParentId(dto4.getId());
		dto4.getChildren().add(dto6);
		dto2.getChildren().add(dto4);
		dto2.getChildren().add(dto5);
		dto1.getChildren().add(dto2);
		dto1.getChildren().add(dto3);
		dtos.add(dto1);
		return dtos;
	}

	public class TreeDto {
		private String id;
		private String code;
		private String name;
		private String parentId;
		private boolean leaf;
		private List<TreeDto> children = new ArrayList<TreeDto>();
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getParentId() {
			return parentId;
		}
		public void setParentId(String parentId) {
			this.parentId = parentId;
		}
		public boolean isLeaf() {
			return leaf;
		}
		public void setLeaf(boolean leaf) {
			this.leaf = leaf;
		}
		public List<TreeDto> getChildren() {
			return children;
		}
		public void setChildren(List<TreeDto> children) {
			this.children = children;
		}
	}
}
