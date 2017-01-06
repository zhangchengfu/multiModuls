package com.laozhang.utils.json;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class JacksonUtils {
	public static <T> T deserialize(final String json, Class<T> classofT) {
        try {

            return new ObjectMapper().readValue(json, classofT);
        } catch (Exception ex) {
        }
        return null;
    }
	
	public static String serialize(Object obj) {
		try {
			return new ObjectMapper().writeValueAsString(obj);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
