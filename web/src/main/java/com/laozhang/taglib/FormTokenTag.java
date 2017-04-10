package com.laozhang.taglib;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class FormTokenTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6960940029264357176L;

	@Override
	public int doEndTag() throws JspException {
		HttpSession httpSession = this.pageContext.getSession();
		String formToken = new Long(new Date().getTime()).toString();
		//httpSession.setAttribute("formToken", formToken);
		try {
			JspWriter out = pageContext.getOut();
			out.println("<input type=\"hidden\" name=\"formToken\" value=\"" + formToken + "\" ></input>");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return super.doEndTag();
	}
}
