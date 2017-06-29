package com.laozhang.core.httpclient;

import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpClientUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(HttpClientUtil.class);
	
	/**
	 * post请求
	 */
	public static String doPost(HttpClient httpClient,String url,Map<String,String> map,String charset){
		HttpPost httpPost = null;
		String result = null;
		try{
			httpPost = new HttpPost(url);
			List<NameValuePair> list = new ArrayList<NameValuePair>();
			Iterator iterator = map.entrySet().iterator();
			while(iterator.hasNext()){
				Entry<String,String> elem = (Entry<String, String>) iterator.next();
				list.add(new BasicNameValuePair(elem.getKey(),elem.getValue()));
			}
			if(list.size() > 0){
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,charset);
				httpPost.setEntity(entity);
			}
			HttpResponse response = httpClient.execute(httpPost);
			if(response != null){
				HttpEntity resEntity = response.getEntity();
				if(resEntity != null){
					result = EntityUtils.toString(resEntity,charset);
				}
			}
		}catch(Exception ex){
			LOGGER.error(ex.getMessage(),ex);
			throw new RuntimeException(ex);
		}
		return result;
	}

	/**
	 * get请求
	 */
	public static String doGet(HttpClient httpClient,String url,String charset){
		HttpGet httpGet = null;
		String result = null;
		try{
			httpGet = new HttpGet(url);
			HttpResponse response = httpClient.execute(httpGet);
			if(response != null){
				HttpEntity resEntity = response.getEntity();
				if(resEntity != null){
					result = EntityUtils.toString(resEntity,charset);
				}
			}
		}catch(Exception ex){
			LOGGER.error(ex.getMessage(),ex);
			throw new RuntimeException(ex);
		}
		return result;
	}
	
	/**
	 * 执行POST请求
	 * 
	 * @param url
	 * @param params
	 * @return CloseableHttpResponse 返回CloseableHttpResponse
	 * @throws IOException
	 */
	public static String doPostResponse(String url, Map<String, String> params, Map<String, String> headers) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String backSource = null;
		try {
			// 创建http POST请求

			HttpPost httpPost = new HttpPost(url);
			// httpPost.setConfig(HttpClientManager.getRequestConfig());
			// 构造头部信息
			if (headers != null) {
				for (Map.Entry<String, String> header : headers.entrySet()) {
					httpPost.setHeader(header.getKey(), header.getValue());
					// httpPost.setHeader("Authorization", "Bearer "+token);
					// httpPost.setHeader("Accept", "application/json");
				}
			}

			if (params != null) {
				// 设置2个post参数，一个是scope、一个是q
				List<NameValuePair> parameters = new ArrayList<NameValuePair>();
				for (String key : params.keySet()) {
					parameters.add(new BasicNameValuePair(key, params.get(key)));
				}
				// 构造一个form表单式的实体
				UrlEncodedFormEntity formEntity;

				formEntity = new UrlEncodedFormEntity(parameters, "UTF-8");

				// 将请求实体设置到httpPost对象中
				httpPost.setEntity(formEntity);
			}
			// 执行请求
			CloseableHttpResponse response = httpclient.execute(httpPost);

			HttpEntity entity = response.getEntity();
			try {
				if (entity != null) {
					backSource = EntityUtils.toString(entity, "UTF-8");
				}else{
					LOGGER.info("url:"+url+"|参数为空");
				}
			} finally {
				response.close();
			}

		} catch (Exception e) {
			LOGGER.error(e.getMessage(),e);
			throw new RuntimeException(e);
		} finally {
			closeQuiet(httpclient);
		}
		return backSource;
	}
	
	private static void closeQuiet(Closeable closeable){
		try {
			closeable.close();
		} catch (IOException e) {
			LOGGER.error(e.getMessage(),e);
			throw new RuntimeException(e); 
		}
	}
}
