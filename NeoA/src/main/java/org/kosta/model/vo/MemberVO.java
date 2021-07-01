package org.kosta.model.vo;

public class MemberVO{
	
	private String id;
	private String password;
	private String name;
	private String address;
	private String enabled;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String id, String password, String name, String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
	}
	
	public MemberVO(String id, String password, String name, String address, String enabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.enabled = enabled;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", enabled=" + enabled + "]";
	}	
}
