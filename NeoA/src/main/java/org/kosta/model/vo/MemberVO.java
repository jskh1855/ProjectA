package org.kosta.model.vo;

public class MemberVO{
	private String memberId;
	private String memberEmail;
	private String name;
	private String password;
	private String address;
	private String phoneNo;
	private String credit;
	private boolean enabled;
	private String bankName;
	private String accountNo;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String memberEmail, String name, String password, String address, String phoneNo,
			String credit, boolean enabled, String bankName, String accountNo) {
		super();
		this.memberId = memberId;
		this.memberEmail = memberEmail;
		this.name = name;
		this.password = password;
		this.address = address;
		this.phoneNo = phoneNo;
		this.credit = credit;
		this.enabled = enabled;
		this.bankName = bankName;
		this.accountNo = accountNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberEmail=" + memberEmail + ", name=" + name + ", password="
				+ password + ", address=" + address + ", phoneNo=" + phoneNo + ", credit=" + credit + ", enabled="
				+ enabled + ", bankName=" + bankName + ", accountNo=" + accountNo + "]";
	}
	
	
}
