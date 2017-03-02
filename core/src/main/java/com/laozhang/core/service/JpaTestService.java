package com.laozhang.core.service;

import com.laozhang.core.model.JpaTest;
import com.laozhang.model.base.PageResult;

public interface JpaTestService {

	//jpa分页
	PageResult<JpaTest> getJpaPage(JpaTest jpaTest, int currentPage, int pageSize);
	
	//sql分页
	PageResult<JpaTest> getSqlPage(JpaTest jpaTest, int currentPage, int pageSize);
	
	//查询一条记录
	JpaTest get(String id);
	
	//删除
	void delete(String id);
	
	//增加或更新
	void save(JpaTest jpaTest);
}
