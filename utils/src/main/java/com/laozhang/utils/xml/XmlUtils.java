package com.laozhang.utils.xml;

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class XmlUtils {
	public static <T> T xmlToObject(String xml, Class<T> classOfT) {
		try {
			JAXBContext context = JAXBContext.newInstance(classOfT);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			return (T) unmarshaller.unmarshal(new StringReader(xml));
		} catch (JAXBException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String objectToXml(Object object) {
		try {
			JAXBContext context = JAXBContext.newInstance(object.getClass());
			Marshaller marshaller = context.createMarshaller();
			StringWriter writer = new StringWriter();
			marshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
			marshaller.marshal(object, writer);
			return writer.toString();
		} catch (JAXBException e) {
			return null;
		}
	}
}
