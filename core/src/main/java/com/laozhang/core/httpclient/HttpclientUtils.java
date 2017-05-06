package com.laozhang.core.httpclient;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HttpclientUtils {

	@Autowired
	private CloseableHttpClient httpClient ;
	
	@Autowired
	private RequestConfig requestConfig;
	
	//执行GET请求
	public String doGet(String url) throws ClientProtocolException, IOException {
		HttpGet httpGet = new HttpGet(url);
		httpGet.setConfig(this.requestConfig);
		CloseableHttpResponse response = null;
		try{
			response = httpClient.execute(httpGet);
			if (response.getStatusLine().getStatusCode() == 200) {
				return EntityUtils.toString(response.getEntity(), "UTF-8");
			}
		} finally {
			if (response != null) {
				response.close();
			}
		}
		return null;
	}
	
	//带有参数的GET请求
	public String doGet(String url, Map<String, String> params)
			throws ClientProtocolException, IOException, URISyntaxException {
		URIBuilder uriBuilder = new URIBuilder(url);
		for (String key : params.keySet()) {
			uriBuilder.addParameter(key, params.get(key));
		}
		return this.doGet(uriBuilder.build().toString());
	}
	
	//执行POST请求
	public HttpResult doPost(String url, Map<String, String> params) throws IOException {
		HttpPost httpPost = new HttpPost(url);
		httpPost.setConfig(this.requestConfig);
		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");
		//httpPost.setHeader("Accept", "application/json");
		if (params != null) {
			List<NameValuePair> parameters = new ArrayList<NameValuePair>();
			for (String key : params.keySet()) {
				parameters.add(new BasicNameValuePair(key, params.get(key)));
			}
			// 构造一个form表单式的实体
			UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(parameters, "UTF-8");
			// 将请求实体设置到httpPost对象中
			httpPost.setEntity(formEntity);
		}
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(httpPost);
			HttpResult httpResult=new HttpResult(response.getStatusLine().getStatusCode(),
					EntityUtils.toString(response.getEntity(), "UTF-8"));
			return httpResult;
		} finally {
			if (response != null) {
				response.close();
			}
		}
	}
	
	//执行POST请求
	public HttpResult doPost(String url) throws IOException {
		return this.doPost(url, null);
	}
	
	//提交json数据
	public HttpResult doPostJson(String url, String json) throws ClientProtocolException, IOException {
		HttpPost httpPost = new HttpPost(url);
		httpPost.setConfig(this.requestConfig);
		if (json != null) {
			StringEntity stringEntity = new StringEntity(json, ContentType.APPLICATION_JSON);
			httpPost.setEntity(stringEntity);
		}
		CloseableHttpResponse response = null;
		try{
			response = this.httpClient.execute(httpPost);
			return new HttpResult(response.getStatusLine().getStatusCode(),
					EntityUtils.toString(response.getEntity(), "UTF-8"));
		} finally {
			if (response != null) {
				response.close();
			}
		}
	}
	
}
