package com.laozhang.core.jpa;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

public class MySimpleSpringJpaImpl<T extends BaseJpaEntity, ID extends Serializable> 
	extends SimpleJpaRepository<T, Serializable> implements MySpringJpaRepository<T, ID> {

	private EntityManager em;
	
	public MySimpleSpringJpaImpl(Class<T> domainClass, EntityManager entityManager) {
		super(domainClass, entityManager);
		this.em = entityManager;
	}
}
