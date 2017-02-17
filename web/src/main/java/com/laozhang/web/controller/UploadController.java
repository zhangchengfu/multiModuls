package com.laozhang.web.controller;

import java.io.Serializable;
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
	
	@ResponseBody
	@RequestMapping("/file")
	public UploadDto file(HttpServletRequest request) throws Exception {
		UploadDto dto = new UploadDto();
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
					String url = "";
					url = new FtpClientUtil().upload2(file);
					dto.setUrl(url);
					dto.setSize(size.toString());
					dto.setState("SUCCESS");
					String oriName = file.getOriginalFilename();
					int lastIndex = oriName.lastIndexOf(".");
					int firstIndex = oriName.indexOf(".");
					dto.setOriginal(oriName);
					dto.setType(oriName.substring(lastIndex));
					dto.setTitle(oriName.substring(0, firstIndex));
					return dto;
				}
			}
		}
		return dto;
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
	
	public class UploadDto implements Serializable {
		/**
		 * 
		 */
		private static final long serialVersionUID = 3387547474291386523L;

		private String original;
		
		private String size;
		
		private String state;
		
		private String title;
		
		private String type;
		
		private String url;

		public String getOriginal() {
			return original;
		}

		public void setOriginal(String original) {
			this.original = original;
		}

		public String getSize() {
			return size;
		}

		public void setSize(String size) {
			this.size = size;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
	}
}
