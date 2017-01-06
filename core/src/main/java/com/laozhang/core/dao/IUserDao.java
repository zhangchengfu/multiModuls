package com.laozhang.core.dao;

import java.util.List;

import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;


public interface IUserDao {
	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> getAll();

	PageResult<User> getUserPage(Pagination pagination);
}
