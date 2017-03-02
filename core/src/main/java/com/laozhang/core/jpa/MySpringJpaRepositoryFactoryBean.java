package com.laozhang.core.jpa;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean;
import org.springframework.data.repository.core.RepositoryInformation;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;

public class MySpringJpaRepositoryFactoryBean<R extends JpaRepository<T, I>,T,I extends Serializable> 
	extends JpaRepositoryFactoryBean<R, T, I>{
	
	@Override
	protected RepositoryFactorySupport createRepositoryFactory(EntityManager entityManager) {
		return new MySpringJpaRepositoryFactory(entityManager);
	}
	
	private static class MySpringJpaRepositoryFactory<T,I extends Serializable> extends
		JpaRepositoryFactory {
		
		private EntityManager entityManager;
		
		public MySpringJpaRepositoryFactory(EntityManager entityManager) {
			super(entityManager);
			this.entityManager = entityManager;
		}
		
		@Override
		protected Object getTargetRepository(RepositoryInformation information) {
			return new MySimpleSpringJpaImpl((Class<T>) information.getDomainType(), entityManager);
		}
		
		@Override
		protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
			return MySpringJpaRepository.class;
		}
		
	}
}
