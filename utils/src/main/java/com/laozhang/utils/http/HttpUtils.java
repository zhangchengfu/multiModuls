package com.laozhang.utils.http;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.laozhang.utils.json.JacksonUtils;
import com.laozhang.utils.json.JsonUtils;

public class HttpUtils {
	
	private static Log log = LogFactory.getLog(HttpUtils.class);
	
	/**
	 * http post请求
	 * @param url url
	 * @param request 请求
	 * @param classofT 返回类型
	 * @return 将远端返回的Json字串解析为对象，类型为T
	 */
	public static <T> T postRequest(String url, Object request, Class<T> classofT) {
		String info = JsonUtils.bean2json(request);
		try {
			URL _url = new URL(url);
			HttpURLConnection con = (HttpURLConnection) _url.getContent();
			
			//header
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");
			
			con.setDoOutput(true);
			PrintWriter wr = new PrintWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
			wr.write(info);
			wr.flush();
			wr.close();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			StringBuffer response = new StringBuffer();
			
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			reader.close();
			return JacksonUtils.deserialize(response.toString(), classofT);
		} catch (Exception e) {
			log.error("http post request error.", e);
            return null;
		}
	}
	
	//http get请求  远端返回JSON字串
	public static String getRequest(String url) {
		try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("GET");

            con.setDoOutput(true);

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), Charset.forName("UTF-8")));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            log.debug("Get response: " + response.toString());
            return response.toString();
            
        } catch (Exception ex) {
            log.error("Network error.", ex);
            return null;
        }
	}
	
	public static <T> T postRequestWithJson(String url, String req, Class<T> classofT){
		try {
			URL _url = new URL(url);
			HttpURLConnection con = (HttpURLConnection) _url.getContent();
			
			//header
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");
			
			con.setDoOutput(true);
			PrintWriter wr = new PrintWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
			wr.write(req);
			wr.flush();
			wr.close();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			StringBuffer response = new StringBuffer();
			
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			reader.close();
			return JacksonUtils.deserialize(response.toString(), classofT);
		} catch (Exception e) {
			log.error("http post request error.", e);
            return null;
		}
	}
	
	public static <T> T getRequest4Object(String url, Class<T> classofT){
		try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("GET");

            con.setDoOutput(true);

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), Charset.forName("UTF-8")));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            log.debug("Get response: " + response.toString());
            return JacksonUtils.deserialize(response.toString(), classofT);
            
        } catch (Exception ex) {
            log.error("Network error.", ex);
            return null;
        }
	}
}
