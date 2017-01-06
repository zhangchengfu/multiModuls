package com.laozhang.model.serialize;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class DateDeserializer extends JsonDeserializer<Date> {
	
	private SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public Date deserialize(JsonParser jsonParser, DeserializationContext context)
			throws IOException, JsonProcessingException {
		Date date = null;
		try {
			date = formate.parse(jsonParser.getText());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
}
