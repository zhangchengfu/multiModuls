package com.laozhang.paging.modal;

import java.io.Serializable;

public class Result implements Serializable {

	private static final long serialVersionUID = 1L;

	private Object data;

    private String errorMessage;

    private boolean success=true;
    

    public static Result success(Object data) {
        Result result = new Result();
        result.data = data;
        return result;
    }


    public static Result failure(String message) {
        Result result = new Result();
        result.success = false;
        result.errorMessage = message;
        return result;
    }

    public Object getData() {
        return data;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
   
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

}
