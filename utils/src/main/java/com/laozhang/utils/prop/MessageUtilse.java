package com.laozhang.utils.prop;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;


public class MessageUtilse {
	
	public static Map<String, String> map = new HashMap<String, String>();
	
	static {
		ResourceBundle resource = ResourceBundle.getBundle("message");
		Set<String> keySet = resource.keySet();
		for (String key : keySet) {
			map.put(key, resource.getString(key));
		}
	}
	
	final static MessageFormat FORMAT = new MessageFormat("");
	
	public static String getValue(String key) {
        return map.get(key);
    }
	
	public static String getValue(String key, String arg0) {
        String mes = map.get(key);
        FORMAT.applyPattern(mes);
        return FORMAT.format(new String[] { arg0 });
    }
	
	public static String getValue(String key, String arg0, String arg1) {
        String mes = map.get(key);
        FORMAT.applyPattern(mes);
        return FORMAT.format(new String[] { arg0, arg1 });
    }
	
	public static String getValue(String key, String arg0, String arg1, String arg2) {
        String mes = map.get(key);
        FORMAT.applyPattern(mes);
        return FORMAT.format(new String[] { arg0, arg1, arg2 });
    }
	
	public static String getValue(String key, String arg0, String arg1, String arg2, String arg3) {
        String mes = map.get(key);
        FORMAT.applyPattern(mes);
        return FORMAT.format(new String[] { arg0, arg1, arg2, arg3 });
    }
	
	public static String getValue(String key, String arg0, String arg1, String arg2, String arg3, String arg4) {
        String mes = map.get(key);
        FORMAT.applyPattern(mes);
        return FORMAT.format(new String[] { arg0, arg1, arg2, arg3, arg4 });
    }
	
	public static String getValue(String key, String[] arg0) {
        if (arg0 == null || arg0.length == 0) {
            return getValue(key);
        } else {
            String mes = map.get(key);
            FORMAT.applyPattern(mes);
            return FORMAT.format(arg0);
        }
    }
}
