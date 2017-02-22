package com.laozhang.page;

import com.laozhang.model.base.PageResult;

public class AdaptPage {

	public static KPage adapt(PageResult jPage) {
		if (jPage == null) {
			return null;
		}
		if (null == jPage.getResult() || jPage.getResult().size() < 1) {
			return null;
		}
		KSimplePageImpl page = new KSimplePageImpl();
		page.setData(jPage.getResult());
		page.setPageSize(jPage.getPageSize());
		page.setResultCount(jPage.getTotalSize());
		page.setPageIndex(jPage.getCurrentPage()-1);
		page.setStart((jPage.getCurrentPage()-1) * jPage.getPageSize());
		return page;
	}
}
