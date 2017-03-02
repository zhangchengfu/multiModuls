package com.laozhang.core.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.laozhang.core.jpa.BaseJpaEntity;
@SqlResultSetMapping(
		name = "jpaTest",
		classes={
				@ConstructorResult(
						targetClass=JpaTestDto.class,
						columns={
								@ColumnResult(name="id",type=String.class),
								@ColumnResult(name="name",type=String.class),
								@ColumnResult(name="createDate",type=Date.class),
								@ColumnResult(name="modifyDate",type=Date.class),
						}
				)
		}
)
@Entity
@Table(name="t_jpa_test")
public class JpaTest extends BaseJpaEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4461734406214403712L;
	@Column(name = "name")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
