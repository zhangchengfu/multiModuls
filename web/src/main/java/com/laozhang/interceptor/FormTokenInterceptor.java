package com.laozhang.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.laozhang.taglib.FormToken;

public class FormTokenInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod)handler;
			Method method = handlerMethod.getMethod();
			FormToken formToken = method.getAnnotation(FormToken.class);
			String token = request.getParameter("formToken");
			if (formToken != null) {
				if (StringUtils.isNotBlank(token)) {
					String sToken = (String) request.getSession(false).getAttribute("formToken");
					if (StringUtils.isNotBlank(sToken) && token.equals(sToken)) {
						return false;//阻止表单重复提交
					}
				}
			}
			request.getSession(false).setAttribute("formToken", token);
		}
		return super.preHandle(request, response, handler);
	}
	
	
}
