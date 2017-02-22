package com.laozhang.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laozhang.page.InvokeResult;

@Controller
@RequestMapping("/treeList")
public class TreeListController {

	@ResponseBody
	@RequestMapping("/get")
	public InvokeResult get() {
		return InvokeResult.success(getList());
	}
	
	private List<TreeListDto> getList() {
		List<TreeListDto> dtos = new ArrayList<TreeListDto>();
		TreeListDto dto1 = new TreeListDto();
		dto1.setId("1");
		dto1.setName("test1");
		dto1.setLevel(0);
		TreeListDto dto11 = new TreeListDto();
		dto11.setId("4");
		dto11.setName("test11");
		dto11.setLevel(1);
		TreeListDto dto12 = new TreeListDto();
		dto12.setId("5");
		dto12.setName("test12");
		dto12.setLevel(1);
		dto1.getChildren().add(dto11);
		dto1.getChildren().add(dto12);
		TreeListDto dto2 = new TreeListDto();
		dto2.setId("2");
		dto2.setName("test2");
		dto2.setLevel(0);
		TreeListDto dto21 = new TreeListDto();
		dto21.setId("6");
		dto21.setName("test21");
		dto21.setLevel(1);
		TreeListDto dto22 = new TreeListDto();
		dto22.setId("7");
		dto22.setName("test22");
		dto22.setLevel(1);
		TreeListDto dto3 = new TreeListDto();
		dto3.setId("3");
		dto3.setName("test3");
		dto3.setLevel(0);
		dto2.getChildren().add(dto21);
		dto2.getChildren().add(dto21);
		TreeListDto dto31 = new TreeListDto();
		dto31.setId("8");
		dto31.setName("test31");
		dto31.setLevel(1);
		TreeListDto dto32 = new TreeListDto();
		dto32.setId("9");
		dto32.setName("test32");
		dto32.setLevel(1);
		dto3.getChildren().add(dto31);
		dto3.getChildren().add(dto32);
		dtos.add(dto1);
		dtos.add(dto2);
		dtos.add(dto3);
		return dtos;
	}
	
	public class TreeListDto {
		private String id;
		private String name;
		private int level;
		private List<TreeListDto> children = new ArrayList<TreeListDto>();
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getLevel() {
			return level;
		}
		public void setLevel(int level) {
			this.level = level;
		}
		public List<TreeListDto> getChildren() {
			return children;
		}
		public void setChildren(List<TreeListDto> children) {
			this.children = children;
		}
	}
}
