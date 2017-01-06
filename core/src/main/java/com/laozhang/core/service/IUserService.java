package com.laozhang.core.service;

import java.util.List;

import com.laozhang.model.base.PageResult;
import com.laozhang.model.base.Pagination;
import com.laozhang.model.entity.User;

public interface IUserService {
	/**
	 * 根据id查询User
	 * @param id
	 * @return
	 */
	User getUserById(int id);
	
	/**
	 * 查询所有User
	 * @return
	 */
	List<User> getAll();
	
	/**
	 * 增加
	 * @param user
	 */
	void addUser(User user);
	
	/**
	 * 刪除
	 * @param id
	 */
	void deleteUser(int id);
	
	/**
	 * 更新
	 * @param user
	 */
	void updateUser(User user);
	
	/**
	 * 排序，倒序
	 * @param list
	 * @return
	 */
	List<User> getList(List<User> list);
	
	/**
	 * 分页
	 * @param pagination
	 * @return
	 */
	PageResult<User> getUserPage(Pagination pagination);
}
