package com.laozhang.page;

import java.util.List;

public interface KPage<T> {

	List<T> getContent();
	
	int getTotalPageNumber();
	
	long getTotalRecordNumber();
	
	void setStart(long start);
	
	void setData(List<T> list);
}
