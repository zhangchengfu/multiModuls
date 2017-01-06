package com.laozhang.utils.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

public class JsonUtils {
	
	//map转成json
	public static String map2json(Map map) {
		return net.sf.json.JSONObject.fromObject(map).toString();
	}
	
	//bean转换成json
	public static String bean2json(Object bean) {
		return net.sf.json.JSONObject.fromObject(bean).toString();
	}
	
	//list转换成json
	public static String list2json(List list) {
		return JSONArray.fromObject(list).toString();
	}
	
	//string 转json
	public static net.sf.json.JSONObject StringTOJson(String param) {
		net.sf.json.JSONObject jasonObject = net.sf.json.JSONObject.fromObject(param);
        return jasonObject;
	}
	
	//map中的json字符串转成数组
	public static String[] jsonToArray(String param) {
        if (param != null && param != "") {
            String[] devList = param.toString().substring(1, param.toString().length() - 1).split(",");
            if (devList != null && devList.length > 0) {
                for (int i = 0; i < devList.length; i++) {
                    if (devList[i] != null && devList[i].length() > 2) {
                        devList[i] = devList[i].substring(1, devList[i].length() - 1);
                    }
                }
            }
            return devList;
        }
        else {
            return null;
        }
    }
	
	//map中的json字符串转成数组
	public static String[] jsonTOOArray(String param) {
        if (param != null && param != "") {

            String[] objList = param.toString().substring(1, param.toString().length() - 1).split("},");
            if (objList != null && objList.length > 0) {
                for (int i = 0; i < objList.length; i++) {
                	net.sf.json.JSONObject jasonObject2 = null;
                    if (i == objList.length - 1) {
                        jasonObject2 = JsonUtils.StringTOJson(objList[i]);
                    }
                    else {
                        jasonObject2 = JsonUtils.StringTOJson(objList[i] + "}");
                    }
                    objList[i] = jasonObject2.toString();
                }
            }
            return objList;
        }
        else {
            return null;
        }
    }
	
	
	public static Map getMap4Json(String jsonString) {
		net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(jsonString);
        Iterator keyIter = jsonObject.keys();
        String key;
        Object value;
        Map valueMap = new HashMap();

        while (keyIter.hasNext()) {
            key = (String) keyIter.next();
            value = jsonObject.get(key);
            valueMap.put(key, value);
        }

        return valueMap;
    }
	
	//从json对象集合表达式中得到一个java对象列表
	public static List getList4Json(String jsonString, Class pojoClass) {

        JSONArray jsonArray = JSONArray.fromObject(jsonString);
        net.sf.json.JSONObject jsonObject;
        Object pojoValue;

        List list = new ArrayList();
        for (int i = 0; i < jsonArray.size(); i++) {

            jsonObject = jsonArray.getJSONObject(i);
            pojoValue = net.sf.json.JSONObject.toBean(jsonObject, pojoClass);
            list.add(pojoValue);

        }
        return list;

    }
	
	
	//从json表达式中获取一个map
	public static List getMapList4Json(String jsonString) {

        JSONArray jsonArray = JSONArray.fromObject(jsonString);
        net.sf.json.JSONObject jsonObject;

        List list = new ArrayList();
        for (int i = 0; i < jsonArray.size(); i++) {

            jsonObject = jsonArray.getJSONObject(i);
            Iterator keyIter = jsonObject.keys();
            String key;
            Object value;
            Map valueMap = new HashMap();

            while (keyIter.hasNext()) {
                key = (String) keyIter.next();
                value = jsonObject.get(key);
                valueMap.put(key, value);
            }
            list.add(valueMap);

        }
        return list;
    }
	
	//从一个JSON 对象字符格式中得到一个java对象，其中beansList是一类的集合，
	//形如： {"id" : idValue, "name" : nameValue, "bean" : {"beanId" : beanIdValue, ...}, beansList:[{}, {}, ...]}
	//map 集合属性的类型 (key : 集合属性名, value : 集合属性类型class) eg: ("beansList" : Bean.class)
	public static Object getDto(String json, Class clazz, Map map) {
		net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(json);
		return net.sf.json.JSONObject.toBean(jsonObject, clazz, map);
	}
}
