package com.laozhang.model.rsp;

/**
 * Json返回对象
 * @author Lenovo
 *
 * @param <T>
 */
public class JsonRsp<T> {
	/**
	 * 请求是否成功
	 * 1：成功 0：失败
	 */
	private int rst;
	
	//失败返回错误信息
	private String msg;
	
	private T info;
	
	public JsonRsp() {
		rst = 1;
	}
	
	public JsonRsp(int rst) {
		this.rst = rst;
	}
	
	public JsonRsp(int rst, String msg) {
		this.rst = rst;
		this.msg = msg;
	}

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getInfo() {
		return info;
	}

	public void setInfo(T info) {
		this.info = info;
	}
	
	
}
