package com.laozhang.web.base;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



public class ContextLoaderListener extends
		org.springframework.web.context.ContextLoaderListener {
	
	
	public void contextInitialized(ServletContextEvent event)
	{
		super.contextInitialized(event);
		ServletContext context = event.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils
			.getRequiredWebApplicationContext(context);
		ApplicationContextUtil.setApplicationContext(ctx);
	}
	
}
