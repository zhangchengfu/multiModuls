package com.laozhang.page;

import java.io.Serializable;

public class InvokeResult implements Serializable, Cloneable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8771504052994281686L;

	private Object data;
	
	private boolean success;
	
	private String errorMessage;
	
	public static InvokeResult failure(String errorMessage) {
		InvokeResult result = new InvokeResult();
		result.errorMessage = errorMessage;
		result.success = false;
		return result;
	}
	
	public static InvokeResult success(Object data) {
		InvokeResult result = new InvokeResult();
		result.errorMessage = "";
		result.data = data;
		result.success = true;
		return result;
	}
	
	public static InvokeResult success() {
		InvokeResult result = new InvokeResult();
		result.errorMessage = "";
		result.success = true;
		return result;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
}
