package com.laozhang.core.dao.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.laozhang.model.base.BaseEntity;
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;

public abstract class BaseDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insert(String statement, BaseEntity entity) {
		return session.insert(statement, entity);
	}
	
	public int update(String statement, BaseEntity entity) {
		return session.update(statement, entity);
	}
	
	public int delete(String statement, BaseEntity entity) {
		return session.delete(statement, entity);
	}
	
	public <T> T selectOne(String statement, Object object) {
		return session.selectOne(statement, object);
	}
	
	public int count(String statement, Object object) {
		return session.selectOne(statement, object);
	}
	
	public <T> List<T> select(String statement) {
		return session.selectList(statement);
	}
	
	public <T> List<T> select(String statement, Object object) {
		return session.selectList(statement, object);
	}
	
	public <T> PageResult<T> selectPagination(String statement, String countStatement, Pagination pagination) {
		int page = pagination.getPage();
		int size = pagination.getSize();
		RowBounds bound = new RowBounds((page - 1)*size, size);
		Map<Object, Object> param = pagination.getParams();
		param.put("orderColumn", pagination.getOrderColumn());
        param.put("orderTurn", pagination.getOrderTurn());
        List<T> list = session.selectList(statement, param, bound);
        int total = count(countStatement, pagination.getParams());
        PageResult<T> pageResult = new PageResult<T>();
        pageResult.setCurrentPage(page);
        pageResult.setTotalSize(total);
        pageResult.setPageSize(size);
        pageResult.setResult(list);
        return pageResult;
	}
}
