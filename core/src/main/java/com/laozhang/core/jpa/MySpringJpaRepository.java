package com.laozhang.core.jpa;

import java.io.Serializable;

import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

@NoRepositoryBean
public interface MySpringJpaRepository<T extends BaseJpaEntity, ID extends Serializable> 
	extends PagingAndSortingRepository<T, Serializable> {

}
