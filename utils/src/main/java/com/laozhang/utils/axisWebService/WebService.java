package com.laozhang.utils.axisWebService;

import java.rmi.RemoteException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.encoding.XMLType;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class WebService {

	public static String sendXmlAxisWebService(String one, String two) {
		String requestUrl = "*/*/webservice/*WS?wsdl";
		Object[] object = new Object[7];
		object[0] = one;
		object[2] = two;
		org.apache.axis.client.Service service = new org.apache.axis.client.Service();
		Call call = null;
		try {
			call = (Call) service.createCall();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		call.setTargetEndpointAddress(requestUrl);//远程调用路径
		// 调用的命名空间和方法名  
		call.setOperationName(new QName("http://www.abc.com/", "exportSearchData"));
		call.setUseSOAPAction(true);
		//可以在wsdl中找个这个地址
		call.setSOAPActionURI("http://www.abc.com/exportSearchData");
		//命名空间和参数名
		call.addParameter(new QName("http://www.abc.com/","searchExp"), // 参数名
				XMLType.XSD_STRING,// 参数类型:String
				ParameterMode.IN);// 参数模式：'IN' or 'OUT'
		
		call.addParameter(new QName("http://www.abc.com/","exportColumn"), // 参数名
				XMLType.XSD_STRING,// 参数类型:String
				ParameterMode.IN);// 参数模式：'IN' or 'OUT'
		call.setReturnType(XMLType.XSD_STRING);// 返回值类型：String
		call.setTimeout(100000);//超时 
		String result = null;
		try {
			result = (String) call.invoke(object);// 远程调用  
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//解析
		JSONObject jo = JSONObject.parseObject(result);
		String count = jo.getString("count");
		JSONArray ja = jo.getJSONArray("list");
		if (null != ja) {
			for(int i = 0,length_i = ja.size();i < length_i;i++){
				JSONArray jsonArray = ja.getJSONArray(i);
				jsonArray.getString(0);
				//do something
			}
		}
		
		return result;
	}
}

/*{
    "code": "success",
    "count": "4225",
    "message": "检索成功!",
    "list": [
        [
            "DE1960F030419",
            "2960.01.29 12:00:00",
            "DE1142583B",
            "1963.01.24 12:00:00",
            "FMC CORP",
            "MORGAN PHILIP FAIRBANKS",
            "Verfahren und Vorrichtung zum Dispergieren von Gasen in Fluessigkeiten",
            "B01F3/04;B03D1/24;C02F3/20;C12M1/04"
        ],
        [
            "TW20090213060U",
            "2017.07.09 12:00:00",
            "TWM374649U",
            "2010.02.21 12:00:00",
            "KS TERMINALS INC",
            "LIN CHIH-HSIN",
            "Solar holder",
            "H01L31/042"
        ]
    ]
}*/
