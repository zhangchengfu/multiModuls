package com.laozhang.core.aop;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.laozhang.core.jpa.BaseJpaEntity;
import com.laozhang.model.base.PageResult;
/**
 * 查询数据给前台时，利用@DateFormat注解，格式化日期
 * @author zhangchengfu
 *
 */
@Component
@Aspect
public class ServiceAspectAdvice {

	//切入点匹配表达式
	@Pointcut("execution(* com.laozhang.core.service.**.get*(..))")
	public void getMethod(){}
	
	//后置通知
	@AfterReturning(value="getMethod()",returning="result")
	public void doAfter(JoinPoint jp, Object result) {
		try {
			
			if (result.getClass().getSimpleName().startsWith("PageResult")) {
				PageResult page = (PageResult) result;
				List item = page.getResult();
				if (null != item && item.size() > 0) {
					for (Object obj : item) {
						Class superClass = obj.getClass().getSuperclass();//超类
						Field[] fields = obj.getClass().getDeclaredFields();
						Field[] superFields = superClass.getDeclaredFields();
						for (Field field : fields) {
							DateFormat dateFormat = field.getAnnotation(DateFormat.class);
							if (dateFormat != null && dateFormat.active()) {
								field.setAccessible(true);
								Field propertyField = field.getDeclaringClass().getDeclaredField(dateFormat.property());
								propertyField.setAccessible(true);
								Object date = propertyField.get(obj);
								String format = dateFormat.format();
								if (null != date) {
									Object value = new SimpleDateFormat(format).format((Date)date);
									field.set(obj, value);
								}
							}
						}
						for (Field field : superFields) {
							DateFormat dateFormat = field.getAnnotation(DateFormat.class);
							if (dateFormat != null && dateFormat.active()) {
								field.setAccessible(true);
								Field propertyField = field.getDeclaringClass().getDeclaredField(dateFormat.property());
								propertyField.setAccessible(true);
								Object date = propertyField.get(obj);
								String format = dateFormat.format();
								if (null != date) {
									Object value = new SimpleDateFormat(format).format((Date)date);
									field.set(obj, value);
								}
							}
						}
					}
				}
			} else if (result.getClass().getSuperclass() == BaseJpaEntity.class) {
				Class superClass = result.getClass().getSuperclass();
				Field[] superFields = superClass.getDeclaredFields();
				Field[] fields = result.getClass().getDeclaredFields();
				for (Field field : superFields) {
					DateFormat dateFormat = field.getAnnotation(DateFormat.class);
					if (dateFormat != null && dateFormat.active()) {
						field.setAccessible(true);
						Field propertyField = field.getDeclaringClass().getDeclaredField(dateFormat.property());
						propertyField.setAccessible(true);
						Object date = propertyField.get(result);
						String format = dateFormat.format();
						if (null != date) {
							Object value = new SimpleDateFormat(format).format((Date)date);
							field.set(result, value);
						}
					}
				}
				for (Field field : fields) {
					DateFormat dateFormat = field.getAnnotation(DateFormat.class);
					if (dateFormat != null && dateFormat.active()) {
						field.setAccessible(true);
						Field propertyField = field.getDeclaringClass().getDeclaredField(dateFormat.property());
						propertyField.setAccessible(true);
						Object date = propertyField.get(result);
						String format = dateFormat.format();
						if (null != date) {
							Object value = new SimpleDateFormat(format).format((Date)date);
							field.set(result, value);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
