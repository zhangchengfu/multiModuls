package com.laozhang.web.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class ApplicationContextUtil {
	private  ApplicationContextUtil() {
		
	}
	private static ApplicationContext context;
	public static void setApplicationContext(ApplicationContext ctx) {
		context = ctx;
	}
	public static ApplicationContext getApplicationContext() {
		return context;
	}
	public static Object getBean(String name) {
		return context.getBean(name);
	}
	public static Object getBean(String name, Class clazz) {
		return context.getBean(name, clazz);
	}
	public static boolean containsBean(String name) {
		return context.containsBean(name);
	}
	public static boolean isSingleton(String name) {
		return context.isSingleton(name);
	}
	public static Class getType(String name) {
		return context.getType(name);
	}
	public static String[] getAliases(String name) {
		return context.getAliases(name);
	}
	public static void publishEvent(ApplicationEvent applicationEvent)
	{
		context.publishEvent(applicationEvent);
	}
	public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
	public static HttpSession getSession() {
        return getRequest().getSession();
    }
	public static void setSessionAttribute(String id, Object value) {
        getRequest().getSession().setAttribute(id, value);
    }
	public static void removeSessionAttribute(String id) {
		getRequest().getSession().removeAttribute(id);
	}
	public static Object getSessionAttribute(String id) {
        return getRequest().getSession().getAttribute(id);
    }
	public static String getUrl() {
        String queryString = getRequest().getQueryString();
        if (StringUtils.isEmpty(queryString)) {
            return getRequest().getRequestURL().toString();
        }
        return getRequest().getRequestURL().append("?").append(queryString).toString();
    }
	public static String getRequestURI() {
        return getRequest().getRequestURI();
    }
}
