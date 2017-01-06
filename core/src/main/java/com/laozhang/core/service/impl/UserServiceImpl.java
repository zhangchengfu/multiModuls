package com.laozhang.core.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laozhang.core.dao.IUserDao;
import com.laozhang.core.service.IUserService;
import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserDao dao;

	public User getUserById(int id) {
		return dao.selectByPrimaryKey(id);
	}
	
	public List<User> getAll() {
		return dao.getAll();
	}

	public void addUser(User user) {
		dao.insertSelective(user);
	}

	public void deleteUser(int id) {
		dao.deleteByPrimaryKey(id);
	}

	public void updateUser(User user) {
		dao.updateByPrimaryKeySelective(user);
	}

	public List<User> getList(List<User> list) {
		Collections.sort(list, Collections.reverseOrder());
		return list;
	}

	public PageResult<User> getUserPage(Pagination pagination) {
		return dao.getUserPage(pagination);
	}
	
	
}
