/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.laozhang.spring;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

public final class SpringUtils implements BeanFactoryPostProcessor {

    private static ConfigurableListableBeanFactory beanFactory; // Spring搴旂敤涓婁笅鏂囩幆澧�

    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        SpringUtils.beanFactory = beanFactory;
    }

    /**
     * 鑾峰彇瀵硅薄
     *
     * @param name
     * @return Object 涓�涓互鎵�缁欏悕瀛楁敞鍐岀殑bean鐨勫疄渚�
     * @throws org.springframework.beans.BeansException
     *
     */
    @SuppressWarnings("unchecked")
    public static <T> T getBean(String name) throws BeansException {
        return (T) beanFactory.getBean(name);
    }

    /**
     * 鑾峰彇绫诲瀷涓簉equiredType鐨勫璞�
     *
     * @param clz
     * @return
     * @throws org.springframework.beans.BeansException
     *
     */
    public static <T> T getBean(Class<T> clz) throws BeansException {
        @SuppressWarnings("unchecked")
        T result = (T) beanFactory.getBean(clz);
        return result;
    }

    /**
     * 濡傛灉BeanFactory鍖呭惈涓�涓笌鎵�缁欏悕绉板尮閰嶇殑bean瀹氫箟锛屽垯杩斿洖true
     *
     * @param name
     * @return boolean
     */
    public static boolean containsBean(String name) {
        return beanFactory.containsBean(name);
    }

    /**
     * 鍒ゆ柇浠ョ粰瀹氬悕瀛楁敞鍐岀殑bean瀹氫箟鏄竴涓猻ingleton杩樻槸涓�涓猵rototype銆� 濡傛灉涓庣粰瀹氬悕瀛楃浉搴旂殑bean瀹氫箟娌℃湁琚壘鍒帮紝灏嗕細鎶涘嚭涓�涓紓甯革紙NoSuchBeanDefinitionException锛�
     *
     * @param name
     * @return boolean
     * @throws org.springframework.beans.factory.NoSuchBeanDefinitionException
     *
     */
    public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
        return beanFactory.isSingleton(name);
    }

    /**
     * @param name
     * @return Class 娉ㄥ唽瀵硅薄鐨勭被鍨�
     * @throws org.springframework.beans.factory.NoSuchBeanDefinitionException
     *
     */
    public static Class<?> getType(String name) throws NoSuchBeanDefinitionException {
        return beanFactory.getType(name);
    }

    /**
     * 濡傛灉缁欏畾鐨刡ean鍚嶅瓧鍦╞ean瀹氫箟涓湁鍒悕锛屽垯杩斿洖杩欎簺鍒悕
     *
     * @param name
     * @return
     * @throws org.springframework.beans.factory.NoSuchBeanDefinitionException
     *
     */
    public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
        return beanFactory.getAliases(name);
    }

}
