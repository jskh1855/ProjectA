package org.kosta.neoA.model.vo;

public class MemberVO {
	private String memberId;
	private String password;
	private String name;
	private String phoneNo;
	private String address;
	private String bankName;
	private String accountNo;
	private String credit;
	private String enabled;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String memberId, String password, String name, String phoneNo, String address, String bankName,
			String accountNo, String credit) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.phoneNo = phoneNo;
		this.address = address;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.credit = credit;
	}

	public MemberVO(String memberId, String password, String name, String phoneNo, String address, String bankName,
			String accountNo, String credit, String enabled) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.phoneNo = phoneNo;
		this.address = address;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.credit = credit;
		this.enabled = enabled;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", name=" + name + ", phoneNo=" + phoneNo
				+ ", address=" + address + ", bankName=" + bankName + ", accountNo=" + accountNo + ", credit=" + credit
				+ ", enabled=" + enabled + "]";
	}

}
