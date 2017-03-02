package com.laozhang.core.jpa;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.Parameter;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;

import com.laozhang.model.base.PageResult;

public abstract class ServiceSupport<T extends BaseJpaEntity> {
	
	@PersistenceContext
	private EntityManager em;
	
	abstract public MySpringJpaRepository<T, ?> getRepo();
	
	public T _save(T object) {
		object.setCreateDate(new Date());
		object.setModifyDate(new Date());
		object.setId(null);
		object = getRepo().save(object);
		return object;
	}
	
	public T _update(T object) {
		object.setModifyDate(new Date());
		object = getRepo().save(object);
		return object;
	}
	
	public void _delete(T entity) {
		getRepo().delete(entity);
	}
	
	public T _getById(String id) {
		return getRepo().findOne(id);
	}
	
	public Query _getJpqlQuery(String jpql, Map<Object, Object> paramers) {
		Query jpqlQuery = em.createQuery(jpql);
		Set<Parameter<?>> jpqlParams = jpqlQuery.getParameters();
		if (null != paramers && paramers.size() > 0) {
			if (null != jpqlParams && jpqlParams.size() > 0) {
				for (Parameter<?> param : jpqlParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					jpqlQuery.setParameter(paramName, value);
				}
			}
		}
		return jpqlQuery;
	}
	
	public Query _getSqlQuery(String sql, Map<Object, Object> paramers, Class resultClass) {
		Query sqlQuery = em.createNativeQuery(sql, resultClass);
		Set<Parameter<?>> sqlParams = sqlQuery.getParameters();
		if (null != paramers && paramers.size() > 0) {
			if (null != sqlParams && sqlParams.size() > 0) {
				for (Parameter<?> param : sqlParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					sqlQuery.setParameter(paramName, value);
				}
			}
		}
		return sqlQuery;
	}
	
	public PageResult _getJpqlPage(String jpql, String countJpql, Map<Object, Object> paramers
			,int currentPage, int pageSize) {
		PageResult page = new PageResult();
		Query jpqlQuery = em.createQuery(jpql);
		Query countQuery = em.createQuery(countJpql);
		
		Set<Parameter<?>> countParams = countQuery.getParameters();
		Set<Parameter<?>> jpqlParams = jpqlQuery.getParameters();
		if (null != paramers && paramers.size() > 0) {
			if (null != jpqlParams && jpqlParams.size() > 0) {
				for (Parameter<?> param : jpqlParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					jpqlQuery.setParameter(paramName, value);
				}
			}
			if (null != countParams && countParams.size() > 0) {
				for (Parameter<?> param : countParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					countQuery.setParameter(paramName, value);
				}
			}
		}
		Integer count = ((Long) countQuery.getSingleResult()).intValue();
		jpqlQuery.setFirstResult((currentPage-1)*pageSize);
		jpqlQuery.setMaxResults(pageSize);
		List list = jpqlQuery.getResultList();
		page.setCurrentPage(currentPage);
		page.setTotalSize(count);
		page.setPageSize(pageSize);
		page.setResult(list);
		return page;
	}
	
	
	public PageResult _getSqlPage(String sql, String countSql, Map<Object, Object> paramers
			,int currentPage, int pageSize, String resultSetMapping) {
		PageResult page = new PageResult();
		Query countQuery = em.createNativeQuery(countSql);
		Set<Parameter<?>> countParams = countQuery.getParameters();
		Query sqlQuery = null;
		if (StringUtils.isNotBlank(resultSetMapping)) {
			sqlQuery = em.createNativeQuery(sql,resultSetMapping);
		} else {
			sqlQuery = em.createNamedQuery(sql);	
		}
		Set<Parameter<?>> sqlParams = sqlQuery.getParameters();
		if (null != paramers && paramers.size() > 0) {
			if (null != countParams && countParams.size() > 0) {
				for (Parameter<?> param : countParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					countQuery.setParameter(paramName, value);
				}
			}
			if (null != sqlParams && sqlParams.size() > 0) {
				for (Parameter<?> param : sqlParams) {
					String paramName=param.getName();
					Object value=paramers.get(paramName);
					sqlQuery.setParameter(paramName, value);
				}
			}
		}
		Integer count = ((BigInteger) countQuery.getSingleResult()).intValue();
		sqlQuery.setFirstResult((currentPage-1)*pageSize);
		sqlQuery.setMaxResults(pageSize);
		List<BaseJpaEntity> list = new ArrayList();
		list = sqlQuery.getResultList();
		page.setCurrentPage(currentPage);
		page.setTotalSize(count);
		page.setPageSize(pageSize);
		page.setResult(list);
		return page;
	}
}
