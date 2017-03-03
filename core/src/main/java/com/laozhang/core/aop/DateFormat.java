package com.laozhang.core.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(value=ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DateFormat {

	String property();
	
	String format() default "yyyy-MM-dd HH:mm:ss";
	
	boolean active() default true;
}
