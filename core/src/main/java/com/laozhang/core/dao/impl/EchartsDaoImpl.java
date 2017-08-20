package com.laozhang.core.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.laozhang.core.dao.IEchartsDao;
import com.laozhang.core.dao.base.BaseDao;
import com.laozhang.model.entity.EchartsVo;

@Repository
public class EchartsDaoImpl extends BaseDao implements IEchartsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EchartsVo> getAll1() {
		return sqlSession.selectList("echartsMapper.getAll1");
	}

	@Override
	public List<EchartsVo> getAll2() {
		return sqlSession.selectList("echartsMapper.getAll2");
	}

	@Override
	public List<EchartsVo> getAll3() {
		return sqlSession.selectList("echartsMapper.getAll3");
	}

}
