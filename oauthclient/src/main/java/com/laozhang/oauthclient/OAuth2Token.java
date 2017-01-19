package com.laozhang.oauthclient;

import org.apache.shiro.authc.AuthenticationToken;

public class OAuth2Token implements AuthenticationToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3794893968737857565L;
	private String authCode;
	private String principal;
	
	public OAuth2Token(String authCode) {
		this.authCode = authCode;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
	public Object getCredentials() {
		return authCode;
	}
	
}
