package org.kosta.model.vo;

import java.io.Serializable;

public class Authority implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private String memberId;
	private String authority;
	
	public Authority(){}

	public Authority(String username, String authority) {
		this.memberId = username;
		this.authority = authority;
	}
  
	public String getMemberId() {
		return memberId;
	}

	public void setUsername(String username) {
		this.memberId = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Authority [username=" + memberId + ", authority=" + authority
				+ "]";
	}	
}
