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
@RequestMapping("/richText")
public class RichTextUploadController {
	
	@RequestMapping("/index")
	public String index() {
		return "richText";
	}

	/**
	 * 富文本上传
	 */
	@ResponseBody
	@RequestMapping("/upload")
	public RichtextUploadDto upload(HttpServletRequest request) {
		RichtextUploadDto dto = new RichtextUploadDto();
		try {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
				Iterator<String> iter = multiRequest.getFileNames();
				while(iter.hasNext()) {
					MultipartFile file = multiRequest.getFile(iter.next());//获取传到后台的文件
					if (null != file) {
						Long size = file.getSize();
						if (size > 2*1024*1024) {
							dto.setState("上传附件大于20M");
							return dto;
						}
						String url = "";
						url = new FtpClientUtil().upload2(file);
						dto.setUrl(url);//图片下载地址
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
		} catch (Exception e) {
			dto.setState("上传失败");
			return dto;
		}
		return dto;
	}
	
	
	public class RichtextUploadDto implements Serializable {
		
		private static final long serialVersionUID = -7007992705969960045L;

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
