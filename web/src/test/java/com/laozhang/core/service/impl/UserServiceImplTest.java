package com.laozhang.core.service.impl;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.laozhang.core.service.IUserService;
import com.laozhang.model.entity.User;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:*.xml"})
public class UserServiceImplTest {
	
	
	@Autowired
	private IUserService service;

	@Test
	public void testGetUserById() {
		User user = service.getUserById(2);
		assertEquals(Integer.valueOf(2), user.getId());
	}

}
