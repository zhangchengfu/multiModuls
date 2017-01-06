package com.laozhang.paging.page;

import com.laozhang.model.base.PageResult;

public class AdaptPage {
	
	public static Page adapt(PageResult<?> jPage){
		if(jPage == null){
			return null;
		}
		Page page = new Page();
		page.setRows(jPage.getResult());
		page.setTotal(jPage.getTotalSize());
		return page;
	}
	

}
