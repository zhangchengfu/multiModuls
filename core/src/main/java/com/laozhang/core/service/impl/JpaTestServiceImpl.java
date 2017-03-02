package com.laozhang.core.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.laozhang.core.jpa.MySpringJpaRepository;
import com.laozhang.core.jpa.ServiceSupport;
import com.laozhang.core.model.JpaTest;
import com.laozhang.core.service.JpaTestRepository;
import com.laozhang.core.service.JpaTestService;
import com.laozhang.model.base.PageResult;

@Service
@Transactional
public class JpaTestServiceImpl extends ServiceSupport<JpaTest> implements JpaTestService {
	
	@Autowired
	private JpaTestRepository jpaTestRepository;

	@Override
	public PageResult<JpaTest> getJpaPage(JpaTest jpaTest, int currentPage, int pageSize) {
		StringBuilder jpql = new StringBuilder(" select t from JpaTest t where 1=1  ");
		String count = " select count(*) from JpaTest t where 1=1 ";
		Map<Object, Object> parameters = new HashMap<Object, Object>();
		if (!StringUtils.isEmpty(jpaTest.getName())) {
			jpql.append(" and t.name like :name ");
			count += " and t.name like :name ";
			parameters.put("name", "%" + jpaTest.getName() +"%");
		}
		jpql.append(" order by t.modifyDate desc ");
		PageResult<JpaTest> page = _getJpqlPage(jpql.toString(), count, parameters, currentPage, pageSize);
		return page;
	}
	
	@Override
	public PageResult<JpaTest> getSqlPage(JpaTest jpaTest, int currentPage, int pageSize) {
		StringBuilder sql = new StringBuilder(" select t.id as id,t.name as name,t.createDate as createDate,t.modifyDate as modifyDate  from t_jpa_test t where 1=1 ");
		String count = " select count(*) from t_jpa_test t where 1=1 ";
		Map<Object, Object> parameters = new HashMap<Object, Object>();
		if (!StringUtils.isEmpty(jpaTest.getName())) {
			sql.append(" and t.name like :name ");
			count += " and t.name like :name ";
			parameters.put("name", "%" + jpaTest.getName() +"%");
		}
		sql.append(" order by t.modifyDate desc ");
		PageResult page = _getSqlPage(sql.toString(), count, parameters, currentPage, pageSize, "jpaTest");
		return page;
	}

	@Override
	public JpaTest get(String id) {
		JpaTest jpaTest = _getById(id);
		return jpaTest;
	}

	@Override
	public void delete(String id) {
		JpaTest jpaTest = new JpaTest();
		jpaTest.setId(id);
		_delete(jpaTest);
	}

	@Override
	public void save(JpaTest jpaTest) {
		if (StringUtils.isEmpty(jpaTest.getId())) {
			_save(jpaTest);
		} else {
			_update(jpaTest);
		}
	}

	@Override
	public MySpringJpaRepository<JpaTest, ?> getRepo() {
		return jpaTestRepository;
	}

}
