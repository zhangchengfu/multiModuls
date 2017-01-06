package com.laozhang.model.base;

public class PageUtil {
	/**
	 * 
	 * @param targetUrl 目标地址
	 * @param totalNum 总记录数
	 * @param currentPage 当前页
	 * @param pageSize 每页大小
	 */
	public static String getPagation(String targetUrl, int totalNum, int currentPage, int pageSize) {
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
	            : totalNum / pageSize + 1;
		if (totalPage == 0) {
	        return "<font color=red>未查询到数据！</font>";
	    }
		StringBuffer pageCode = new StringBuffer();
		pageCode.append("<ul>");
		if (currentPage == 1) {
			pageCode.append("<li class='disabled'><a href='#'>首页</a></li>");
			 pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
		} else {
			//pageCode.append("<li><a href='" + targetUrl + "page=1'>首页</a></li>");
			pageCode.append("<li><a href='#' onclick=turn(" + 1 + ")>首页</a></li>");
			/*pageCode.append("<li><a href='" + targetUrl + "page="
	                + (currentPage - 1) + "'>上一页</a></li>");*/
			pageCode.append("<li><a href='#' onclick=turn(" + (currentPage - 1) + ")>上一页</a></li>");
		}
		if (currentPage == totalPage) {
			pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
			pageCode.append("<li class='disabled'><a href='#'>尾页</a></li>");
		} else {
			/*pageCode.append("<li><a href='" + targetUrl + "page="
	                + (currentPage + 1) + "'>下一页</a></li>");*/
			pageCode.append("<li><a href='#' onclick=turn(" + (currentPage + 1) + ")>下一页</a></li>");
			/*pageCode.append("<li><a href='" + targetUrl + "page=" + totalPage
		            + "'>尾页</a></li>");*/
			pageCode.append("<li><a href='#' onclick=turn(" + totalPage + ")>尾页</a></li>");
			/*pageCode.append("<li><input type='button' value='尾页' onclick='turn(" + totalPage + ")></li>");*/
		}
		pageCode.append("<li>" + "共" + totalNum + "条记录	页数" + currentPage + "/" + totalPage + "</li>");
		if (totalPage > 5) {
			pageCode.append("<li>" + "跳转到第");
			pageCode.append("<select class='sel' onchange='change()'>");
			for (int i = 1; i <= totalPage; i++) {
				if (currentPage == i) {
					pageCode.append("<option selected='selected'>" + i + "</option>");
				} else {
					pageCode.append("<option>" + i + "</option>");
				}
			}
			pageCode.append("</select>");
			pageCode.append("页");
			pageCode.append("</li>");
		}
		pageCode.append("</ul>");
		return pageCode.toString();
	}
}
