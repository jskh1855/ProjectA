package org.kosta.model.vo;

import java.io.Serializable;

public class Authority implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private String username;
	private String authority;
	
	public Authority(){}

	public Authority(String username, String authority) {
		this.username = username;
		this.authority = authority;
	}
  
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Authority [username=" + username + ", authority=" + authority
				+ "]";
	}	
}
