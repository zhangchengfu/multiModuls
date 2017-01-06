package com.laozhang.core.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.laozhang.core.dao.IUserDao;
import com.laozhang.core.dao.base.BaseDao;
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;

@Repository
public class UserDaoImpl extends BaseDao implements IUserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int deleteByPrimaryKey(Integer id) {
		int count = sqlSession.delete("userMapper.deleteByPrimaryKey", id);
		return count;
	}

	public int insert(User record) {
		int count = sqlSession.insert("userMapper.insert", record);
		return count;
	}

	public int insertSelective(User record) {
		int count = sqlSession.insert("userMapper.insertSelective", record);
		return count;
	}

	public User selectByPrimaryKey(Integer id) {
		return sqlSession.selectOne("userMapper.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(User record) {
		int count = sqlSession.update("userMapper.updateByPrimaryKeySelective", record);
		return count;
	}

	public int updateByPrimaryKey(User record) {
		int count = sqlSession.update("userMapper.updateByPrimaryKey", record);
		return count;
	}

	public List<User> getAll() {
		return sqlSession.selectList("userMapper.getAll");
	}

	public PageResult<User> getUserPage(Pagination pagination) {
		return super.selectPagination("userMapper.getPageList", "userMapper.getPageCount", pagination);
	}
}
