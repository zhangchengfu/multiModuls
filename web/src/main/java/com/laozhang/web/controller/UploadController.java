package com.laozhang.web.controller;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.laozhang.utils.ftp.FtpClientUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@RequestMapping("/index")
	public String index() {
		return "upload/upload";
	}

	@ResponseBody
	@RequestMapping("/img")
	public String img(HttpServletRequest request) throws Exception {
		/*MultipartHttpServletRequest multipartHttpServletRequest = 
				createMultipartHttpServletRequest(request);
		MultipartFile file = multipartHttpServletRequest.getFile("file");
		String url = "";
		url = new FtpClientUtil().upload2(file);
		return url;*/
		String url = "";
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			Iterator<String> iter = multiRequest.getFileNames();
			while(iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next());//获取传到后台的文件
				if (null != file) {
					Long size = file.getSize();
					if (size > 20*1024*1024) {
						throw new Exception();
					}
					url = new FtpClientUtil().upload2(file);
					return url;
				}
			}
		}
		return url;
	}
	
	private MultipartHttpServletRequest createMultipartHttpServletRequest(HttpServletRequest request) {
		CommonsMultipartResolver resolver = null;
		MultipartHttpServletRequest multiRequest = null;
		resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(200 * 1024 * 1024);// 20M
		resolver.setServletContext(request.getSession().getServletContext());
		resolver.setMaxInMemorySize(1024 * 1024);
		multiRequest = resolver.resolveMultipart(request);
		return multiRequest;
	}
}
