package com.laozhang.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laozhang.core.dao.IEchartsDao;
import com.laozhang.core.service.IEchartsService;
import com.laozhang.model.entity.EchartsVo;

@Service
public class EchartsServiceImpl implements IEchartsService {
	
	@Autowired
	private IEchartsDao dao;

	@Override
	public List<EchartsVo> getAll1() {
		return dao.getAll1();
	}

	@Override
	public List<EchartsVo> getAll2() {
		return dao.getAll2();
	}

	@Override
	public List<EchartsVo> getAll3() {
		return dao.getAll3();
	}

}
